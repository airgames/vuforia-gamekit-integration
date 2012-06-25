/*==============================================================================
            Copyright (c) 2012 QUALCOMM Austria Research Center GmbH.
            All Rights Reserved.
            Qualcomm Confidential and Proprietary
            
@file 
    ImageTargetsRenderer.java

@brief
    Sample for ImageTargets

==============================================================================*/


package com.qualcomm.QCARSamples.ImageTargets;

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

import android.opengl.GLSurfaceView;
import android.view.MotionEvent;

import com.qualcomm.QCAR.QCAR;
 
 
/** The renderer class for the ImageTargets sample. */
public class ImageTargetsRenderer implements GLSurfaceView.Renderer
{
	public native boolean render(int drawWidth, int drawHeight, boolean forceRedraw, float[] matrix, float[] projmatrix);
	public native boolean init(String initArg);
	public native boolean inputEvent(int action, float x, float y, MotionEvent event);
	
    private int surfaceWidth = 800;
    private int surfaceHeight = 800;
    
	static
	{	
		System.loadLibrary("ogrekit");
	}
	
    public boolean mIsActive = false;
    
    /** Native function for initializing the renderer. */
    public native void initRendering();
    
    
    /** Native function to update the renderer. */
    public native void updateRendering(int width, int height);

    
    /** Called when the surface is created or recreated. */
    public void onSurfaceCreated(GL10 gl, EGLConfig config)
    {
    	                    	        
    	init("/sdcard/gamekit/gk_android.blend");
    	
    	
        DebugLog.LOGD("GLRenderer::onSurfaceCreated");

        // Call native function to initialize rendering:
        initRendering();
        
        // Call QCAR function to (re)initialize rendering after first use
        // or after OpenGL ES context was lost (e.g. after onPause/onResume):
        QCAR.onSurfaceCreated();
    }
    
    
    public void touch(MotionEvent event) {
    	
    	System.out.println("@@@@@@@@touched!!");
    	inputEvent(event.getAction(), event.getX(), event.getY(), event);
    	  
    }
   
    
    /** Called when the surface changed size. */
    public void onSurfaceChanged(GL10 gl, int width, int height)
    {
    	
    	surfaceWidth = width;
    	surfaceHeight = height;
    	
        DebugLog.LOGD("GLRenderer::onSurfaceChanged");
        
        // Call native function to update rendering when render surface parameters have changed:
        updateRendering(width, height);

        // Call QCAR function to handle render surface size changes:
        QCAR.onSurfaceChanged(width, height);
    }    
    
    
    private float[] mvmHolder = new float[16];
    private float[] projHolder = new float[16];

    public native void renderFrame(float[]mvmHolder, float[] projHolder);
    public native void end();


    
    int i = 0;
    private float factor = 0;
    
    /** Called to draw the current frame. */
    public void onDrawFrame(GL10 gl)
    {
        if (!mIsActive)
            return;

        System.out.println("Rendering QCAR!");
        
        // QCAR
        renderFrame(mvmHolder, projHolder);
      
        /*
        System.out.println("Model view matrix0: " + mvmHolder[0]);
        System.out.println("Model view matrix1: " + mvmHolder[1]);
        System.out.println("Model view matrix2: " + mvmHolder[2]);
        System.out.println("Model view matrix3: " + mvmHolder[3]);
        System.out.println("Model view matrix4: " + mvmHolder[4]);
        System.out.println("Model view matrix5: " + mvmHolder[5]);
        System.out.println("Model view matrix6: " + mvmHolder[6]);
        System.out.println("Model view matrix7: " + mvmHolder[7]);
        System.out.println("Model view matrix8: " + mvmHolder[8]);
        System.out.println("Model view matrix9: " + mvmHolder[9]);
        System.out.println("Model view matrix10: " + mvmHolder[10]);
        System.out.println("Model view matrix11: " + mvmHolder[11]);
        System.out.println("Model view matrix12: " + mvmHolder[12]);
        System.out.println("Model view matrix13: " + mvmHolder[13]); 
        System.out.println("Model view matrix14: " + mvmHolder[14]);
        System.out.println("Model view matrix15: " + mvmHolder[15]);
        */
               
        // GAMEKIT
        render(surfaceWidth, surfaceHeight, true, mvmHolder, projHolder);   
  
        //end();
        
          /*     
      System.out.println("Projection matrix0: " + projHolder[0]);
      System.out.println("Projection matrix1: " + projHolder[1]);
      System.out.println("Projection matrix2: " + projHolder[2]);
      System.out.println("Projection matrix3: " + projHolder[3]);
      System.out.println("Projection matrix4: " + projHolder[4]);
      System.out.println("Projection matrix5: " + projHolder[5]);
      System.out.println("Projection matrix6: " + projHolder[6]);
      System.out.println("Projection matrix7: " + projHolder[7]);
      System.out.println("Projection matrix8: " + projHolder[8]);
      System.out.println("Projection matrix9: " + projHolder[9]);
      System.out.println("Projection matrix10: " + projHolder[10]);
      System.out.println("Projection matrix11: " + projHolder[11]);
      System.out.println("Projection matrix12: " + projHolder[12]);
      System.out.println("Projection matrix13: " + projHolder[13]);
      System.out.println("Projection matrix14: " + projHolder[14]);
      System.out.println("Projection matrix15: " + projHolder[15]);
          */
               
        
    }
}
