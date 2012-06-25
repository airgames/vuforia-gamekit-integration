# Install script for directory: /Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/Users/erikvillegas/Development/Android/android-ndk-r7b/toolchains/arm-linux-androideabi-4.4.3/prebuilt/darwin-x86/user")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "MinSizeRel")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OGRE/RenderSystems/GLES2" TYPE FILE FILES
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2Context.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2DefaultHardwareBufferManager.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2DepthBuffer.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2FBOMultiRenderTarget.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2FBORenderTexture.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2FrameBufferObject.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2GpuProgram.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2GpuProgramManager.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2HardwareBufferManager.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2HardwareIndexBuffer.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2HardwareOcclusionQuery.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2HardwarePixelBuffer.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2HardwareVertexBuffer.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2PixelFormat.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2Plugin.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2Prerequisites.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2RenderSystem.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2RenderTexture.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2Support.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2Texture.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/OgreGLES2TextureManager.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OGRE/RenderSystems/GLES2/Android" TYPE FILE FILES
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/Android/OgreAndroidGLContext.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/Android/OgreAndroidGLSupport.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/Android/OgreAndroidWindow.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/include/Android/OgreGLES2Util.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OGRE/RenderSystems/GLES2/Android" TYPE DIRECTORY FILES "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/RenderSystems/GLES2/src/GLSLES/include/")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

