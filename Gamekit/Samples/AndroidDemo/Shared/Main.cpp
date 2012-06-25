/*
-------------------------------------------------------------------------------
    This file is part of OgreKit.
    http://gamekit.googlecode.com/

    Copyright (c) 2006-2010 zcube(JiSeop Moon).

    Contributor(s): harkon.kr.
-------------------------------------------------------------------------------
  This software is provided 'as-is', without any express or implied
  warranty. In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
-------------------------------------------------------------------------------
*/




#include "OgreKit.h"
#include "OgreRoot.h"
#include "Ogre.h"
#include <OgreVector3.h>
#include <OgreMath.h>
#include <OgreFrustum.h>
#include <OgreRenderSystem.h>
#include <OgreRenderTarget.h>
#include <OgreViewport.h>



#include "android/AndroidInputManager.h"
#include <stdlib.h>
#include <pthread.h>
#include <OgreMatrix4.h>

#include <GLES2/gl2.h>
#include <GLES2/gl2ext.h>
#include <OgreCamera.h>

//extern static void onJavaDetach(void* arg);
#include <jni.h>
#include <stdlib.h>
#include "AndroidLogListener.h"
#include <android/log.h>

#define LOG_TAG    "OgreKit"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
#define LOG_FOOT   LOGI("%s %s %d", __FILE__, __FUNCTION__, __LINE__)


const gkString gkDefaultBlend   = "/sdcard/gk_android.blend";
const gkString gkDefaultConfig  = "/sdcard/OgreKitStartup.cfg";



class OgreKit : public gkCoreApplication, public gkMessageManager::GenericMessageListener
{
public:
	gkString    m_blend;
	gkScene*    m_scene;
	OIS::AndroidInputManager* m_input;


public:
	OgreKit(): m_blend(gkDefaultBlend), m_scene(0), m_input(0) {     };
	virtual ~OgreKit()   {}

	bool init(const gkString& blend,JavaVM* vm);

	void keyReleased(const gkKeyboard& key, const gkScanCode& sc);

	void injectKey(int action, int uniChar, int keyCode) { if (m_input) m_input->injectKey(action, uniChar, keyCode); }
	void injectTouch(int action, float x, float y) { if (m_input) m_input->injectTouch(action, x, y); }
	void injectAcceleration(float x,float y, float z) { if (m_input) m_input->injectAcceleration(x,y,z);}
	void setOffsets(int x, int y) { if (m_input) m_input->setOffsets(x,y); }
	void setWindowSize(int w, int h) { if (m_input) m_input->setWindowSize(w,h); }
	void handleMessage(gkMessageManager::Message* message);
	JNIEnv* GetEnv();
//	jstring JNU_NewStringNative(JNIEnv *env,  char *str);
private:
	JavaVM* mJVM;
	bool setup(void);
	jmethodID mFireString;
};




//
//jstring OgreKit::JNU_NewStringNative(JNIEnv *env,  char *str)
//{
//    jstring result;
//    jbyteArray bytes = 0;
//    int len;
//    if ((env)->EnsureLocalCapacity(2) < 0) {
//        return NULL; /* out of memory error */
//    }
//    len = strlen(str);
//    bytes = (env)->NewByteArray(len);
//    if (bytes != NULL) {
//        (env)->SetByteArrayRegion( bytes, 0, len,
//                                   (jbyte *)str);
//        result = (env)->NewObject( Class_java_lang_String,
//                                   MID_String_init, bytes);
//        (env)->DeleteLocalRef(bytes);
//        return result;
//    } /* else fall through */
//    return NULL;
//}

void OgreKit::handleMessage(gkMessageManager::Message* message){
	LOGI("HANDLE MSG %s ",message->m_subject.c_str());

	JNIEnv* env = this->GetEnv();

    jclass ANDROID_MAIN = (env)->FindClass( "org/gamekit/jni/Main");
    if (!ANDROID_MAIN)
    {
    	LOGI("COULDNT FIND MAIN!!!");
    	return ;
    }


    mFireString = (env)->GetStaticMethodID(ANDROID_MAIN, "fireStringMessage", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V");

//    jstring from = this->JNU_NewStringNative(env,message->m_subject.c_str());
    jstring from = env->NewStringUTF(message->m_from.c_str());
    jstring to = env->NewStringUTF(message->m_to.c_str());
    jstring subject = env->NewStringUTF(message->m_subject.c_str());
    jstring body = env->NewStringUTF(message->m_body.c_str());
    env->CallStaticVoidMethod(ANDROID_MAIN,mFireString, from,to,subject,body);

}

JNIEnv* OgreKit::GetEnv()
{
    JNIEnv* env = NULL;
    if (mJVM) (mJVM)->GetEnv((void**)&env, JNI_VERSION_1_2);
    return env;
}

bool OgreKit::init(const gkString& blend,JavaVM* vm)
{
	
	gkPrintf("----------- OgreKit Android Demo init -------------------");
    LOG_FOOT;



    gkString cfgfname;
	mJVM = vm;
	// Parse command line
	m_blend = gkDefaultBlend;
	if (!blend.empty()) m_blend = blend;

	


	getPrefs().wintitle         = gkString("airgames");
	getPrefs().blendermat=true;
//	getPrefs().viewportOrientation="portrait";
//	m_prefs.disableSound=false;
	gkPath path = cfgfname;



    LOG_FOOT;

	// overide settings if found
	if (path.isFileInBundle())
		getPrefs().load(path.getPath());

    LOG_FOOT;

	bool ok = initialize();
	LOG_FOOT;
	gkMessageManager::getSingleton().addListener(this);
	return ok;
}


bool OgreKit::setup(void)
{
    LOG_FOOT;

	gkBlendFile* blend = gkBlendLoader::getSingleton().loadFile(gkUtils::getFile(m_blend), gkBlendLoader::LO_ALL_SCENES);
	if (!blend)
	{
		LOGI("File loading failed.\n");
		return false;
	}

    LOG_FOOT;

	m_scene = blend->getMainScene();
	if (!m_scene)
	{
		LOGI("No usable scenes found in blend.\n");
		return false;
	}

    LOG_FOOT;



	m_scene->createInstance();

    LOG_FOOT;

	// add input hooks
	gkWindow* win = gkWindowSystem::getSingleton().getMainWindow();
	m_input = static_cast<OIS::AndroidInputManager*>(win->getInputManager());

    LOG_FOOT;


	return true;
}




OgreKit okit;
//Ogre::LogManager gLogManager;
AndroidLogListener gLogListener;
gkString file;

jboolean init(JNIEnv* env, jobject thiz, jstring arg)
{
	
   file = gkDefaultBlend;
   const char* str = env->GetStringUTFChars(arg, 0);
   if (str)
   {
      file = str;
      env->ReleaseStringUTFChars(arg, str);
   }

   return JNI_TRUE;
}

JavaVM* vmPointer;

float k = 0;

jboolean render(JNIEnv* env, jobject thiz, jint drawWidth, jint drawHeight, jboolean forceRedraw, jfloatArray matrix, jfloatArray proj)
{
	//glClearColor(0,0,1,0.5);
	
	
   //LOG_FOOT;
   static bool first = true;
   if (first)
   {
      first = false;
      LOG_FOOT;

      okit.getPrefs().winsize.x        = drawWidth;
      okit.getPrefs().winsize.y        = drawHeight;


      gkLogger::enable("OgreKitDemo.log", true);
      Ogre::LogManager::getSingleton().getDefaultLog()->addListener(&gLogListener);

       LOG_FOOT;




//      LOGI("****** %s ******", file.c_str());


      LOG_FOOT;

      okit.getPrefs().verbose = true;
      if (!okit.init(file,vmPointer))
      {
         LOG_FOOT;
         // error
         return JNI_FALSE;
      }
      gkLogger::write("window");
      gkWindow* win = gkWindowSystem::getSingleton().getMainWindow();

	// ***
	

      gkLogger::write("window");
  	okit.m_input = static_cast<OIS::AndroidInputManager*>(win->getInputManager());
    gkLogger::write("window");

       LOG_FOOT;
       gkLogger::write("steploop");

      gkEngine::getSingleton().initializeStepLoop();
      gkLogger::write("window");


      LOG_FOOT;
      okit.setWindowSize(drawWidth, drawHeight);
      gkLogger::write("window");

   }


	

	float *mvm = env->GetFloatArrayElements(matrix,false);
	float *projmatrix = env->GetFloatArrayElements(proj,false);
	
	Ogre::Camera *c = gkEngine::getSingleton().getCamera();
	
	c->setProjectionType(Ogre::PT_PERSPECTIVE);
	
	//Ogre::Vector3 *v = new Ogre::Vector3(0,0,1);
	//Ogre::Radian *r = new Ogre::Radian(1.570796);
	
	//c->rotate(*v, *r);
	
	
	Ogre::Matrix4 *defaultMatrix = new Ogre::Matrix4(
		1,0,0,0,
		0,1,0,0,
		0,0,1,0,
		0,0,0,1
	);
	
	/*
	Ogre::Matrix4 *QCARMatrix = new Ogre::Matrix4(
		mvm[0], mvm[4], mvm[8], -0.245045,
		mvm[1], -mvm[5], -mvm[9], 0,
		mvm[2], -mvm[6], -mvm[10], mvm[14]*-0.1,
		mvm[3], mvm[7], mvm[11], mvm[15]
	);
	*/

/*
*mvm[0]: 3 at front (sideways), left or right at 90 deg. goes towards 0 (turning in z plane)
*mvm[1]: 0 at front (sideways), left at 90 deg. goes towards 3, right goes towards -3 (turning in z plane)
mvm[2]: controls turning in y plane
mvm[3]: 0
*mvm[4]: 0 at front (sideways), left at 90 deg. goes towards -3, right goes towards -3 (turning in z plane)
*mvm[5]: -3 at front (sideways), left or right at 90 deg. goes towards 0 (turning in z plane)
mvm[6]: controls turning in x plane
mvm[7]: 0
mvm[8]: controls turning in y plane
mvm[9]: controls turning in x plane
mvm[10]: controls turning in x and y plane
mvm[11]: 0
mvm[12]: controls x movement
mvm[13]: controls y movement
mvm[14]: controls z movement
mvm[15]: 1

*/


// for mvm[14], the smaller the constant the more zoomed in it is

Ogre::Matrix4 *QCARMatrix = new Ogre::Matrix4(
	3,			0,		 	mvm[8], 	mvm[12]/4,
	0,			3,			-mvm[9],	-mvm[13]/4,
	-mvm[2],	-mvm[6],	-mvm[10], 	-mvm[14]*0.3,
	0,		 	0,		 	0,		 	1
);
	
	

	/*
	Ogre::Matrix4 *QCARMatrix = new Ogre::Matrix4(
		mvm[0], mvm[1], mvm[2], mvm[3],
		mvm[4], mvm[5], mvm[6], mvm[7],
		mvm[8], mvm[9], mvm[10], mvm[11],
		mvm[12]/12, mvm[13]/12, mvm[14]*-.1, mvm[15]
	);
	*/


	/*
	Ogre::Matrix4 *projmatrix4 = new Ogre::Matrix4(
		projmatrix[0], projmatrix[4], projmatrix[8], projmatrix[12],
		projmatrix[1], projmatrix[5], projmatrix[9], projmatrix[13],
		projmatrix[2], projmatrix[6], projmatrix[10], projmatrix[14],
		projmatrix[3], projmatrix[7], projmatrix[11], projmatrix[15]
	);

	Ogre::Radian *rad = new Ogre::Radian(1.57079633);

	k += 0.01;

	Ogre::Matrix4 *rotMatrixX = new Ogre::Matrix4(
		1, 0, 		0, 		 	0,
		0, cos(6.28318531), -sin(6.28318531),	0,
		0, sin(6.28318531), cos(6.28318531), 	0,
		0, 0, 			0,		1
	);
	
	
	*/

	/*
	float radY = (45/180) * 3.14159265;

	Ogre::Matrix4 *rotMatrixY = new Ogre::Matrix4(
		cos(radY), 	0, 	sin(radY), 	0,
		0, 			1,	0, 			0,
		-sin(radY), 0, 	cos(radY), 	0,
		0, 			0, 		0,		1
	);
	*/
	
	float deg = 90.0 - (90.0*(mvm[0]/3.0));
	
	if (mvm[1] >= 0)
		deg = -deg;
	
	
	float rad = (deg/180.0) * 3.141592653589793;
	
	
	Ogre::Matrix4 *rotMatrixZ = new Ogre::Matrix4(
		cos(rad), 	-sin(rad), 	0,		0,
		sin(rad), 	cos(rad), 	0,		0,
		0, 			0, 			1,		0,
		0, 			0, 			0,		1
	);
	
	/*
	Ogre::Matrix4 *rotMatrixZ = new Ogre::Matrix4(
		cos(3.14159265), 	-sin(3.14159265), 	0,		0,
		sin(3.14159265), 	cos(3.14159265), 	0,		0,
		0, 			0, 			1,		0,
		0, 			0, 			0,		1
	);
	*/

	//c->setTransform(QCARMatrix->inverse()); 
	
	//c->setCustomViewMatrix(true, (QCARMatrix->concatenate(*projmatrix4))->inverse());
	
	//c->setCustomViewMatrix(true, (QCARMatrix->concatenate(*rotMatrixZ)).concatenate(*rotMatrixX));
	
	
	
	c->setCustomViewMatrix(true, QCARMatrix->concatenate(*rotMatrixZ));
	
	//c->setUseRenderingDistance(false);
	
	//c->setNearClipDistance(1);
	c->setFarClipDistance(0);
	
	//LOGI("FARCLIPDISTANCE: %f\n", c->getFarClipDistance());
	
	
	
	//c->setCustomProjectionMatrix(true, projmatrix4->inverse());
	
	
	
	// the default matrix
	//0.947448, 0.319909, -0.000008, -0.245045,
	//-0.078832, 0.233494, 0.969157, -4.429060,
	//0.310044, -0.918226, 0.246442, -18.712547,
	//0.000000, 0.000000, 0.000000, 1.000000
	
	
	

	//c->setPosition(0,0,k);
	//k -= 0.01;
	
	
	
	//release the created pointer to avoid memory leak
	env->ReleaseFloatArrayElements(matrix, mvm, 16);
	env->ReleaseFloatArrayElements(proj, projmatrix, 16);

   if (gkEngine::getSingleton().stepOneFrame())
   		return JNI_TRUE;
   else
      	return JNI_FALSE;


}
void cleanup(JNIEnv* env)
{
	LOG_FOOT;

	gkEngine::getSingleton().finalizeStepLoop();
}

jboolean inputEvent(JNIEnv* env, jobject thiz, jint action, jfloat mx, jfloat my)
{
//	LOG_FOOT;

	okit.injectTouch(action, mx, my);

	return JNI_TRUE;
}

jboolean keyEvent(JNIEnv* env, jobject thiz, jint action, jint unicodeChar, jint keyCode, jobject keyEvent)
{
//	LOG_FOOT;

	okit.injectKey(action, unicodeChar, keyCode);

	return JNI_TRUE;
}

void setOffsets(JNIEnv* env, jobject thiz, jint x, jint y)
{
//	LOGI("%s %d %d", __FUNCTION__, x, y);

	okit.setOffsets(x,y);
}

void sendSensor(JNIEnv *env, jclass thiz, jint type, jfloat x, jfloat y, jfloat z){
//	LOGI("%d %f %f %f", __FUNCTION__, type,x, y,z);
	okit.injectAcceleration(x,y,z);
}

/*
 * Class:     org_gamekit_jni_GameKitJNI
 * Method:    sendMessage
 * Signature: (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
 */
void sendMessage
  (JNIEnv *env, jclass thiz, jstring jfrom, jstring jto, jstring jsubject, jstring jbody){

	const char* str = env->GetStringUTFChars(jfrom, 0);
	gkString from = str;
	env->ReleaseStringUTFChars(jfrom,str);

	const char* str2 = env->GetStringUTFChars(jto, 0);
	gkString to = str2;
	env->ReleaseStringUTFChars(jto,str2);

	const char* str3 = env->GetStringUTFChars(jsubject, 0);
	gkString subject = str3;
	env->ReleaseStringUTFChars(jsubject,str3);

	const char* str4 = env->GetStringUTFChars(jbody, 0);
	gkString body = str4;
	env->ReleaseStringUTFChars(jbody,str4);

	if (gkMessageManager::getSingletonPtr()){
		gkMessageManager::getSingletonPtr()->sendMessage(from,to,subject,body);
	}
//	LOGI("%s %s %s %s", from.c_str(),to.c_str(),subject.c_str(),body.c_str());
}



jint JNI_OnLoad(JavaVM* vm, void* reserved)
{
//	EXPORT_JNI_OnLoad(vm,reserved);

	JNIEnv *env;

	vmPointer = vm;

    LOGI("JNI_OnLoad called");
    if (vm->GetEnv((void**) &env, JNI_VERSION_1_4) != JNI_OK)
    {
    	LOGE("Failed to get the environment using GetEnv()");
        return -1;
    }
	else {
		LOGI("SUCCESS!!!! @@@@@@@@@!!!");
	}
    JNINativeMethod methods[] =
    {
		{
            "init",
            "(Ljava/lang/String;)Z",
            (void *) init
        },
        {
        	"render",
			"(IIZ[F[F)Z",
			(void *) render
        },
        {
			"inputEvent",
			"(IFFLandroid/view/MotionEvent;)Z",
			(void *) inputEvent

        },
        {
            "keyEvent",
            "(IIILandroid/view/KeyEvent;)Z",
            (void *) keyEvent
        },
        {
            "cleanup",
            "()V",
            (void *) cleanup
        },
		{
			"setOffsets",
			"(II)V",
			(void *) setOffsets
		},
		{
			"sendSensor",
			"(IFFF)V",
			(void *) sendSensor
		},
		{
			"sendMessage",
			"(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
			(void *) sendMessage
		}

    };
    jclass k;
    //k = (env)->FindClass ("org/gamekit/jni/Main");
    k = (env)->FindClass ("com/qualcomm/QCARSamples/ImageTargets/ImageTargetsRenderer");
	(env)->RegisterNatives(k, methods, 8);

    return JNI_VERSION_1_4;
}

