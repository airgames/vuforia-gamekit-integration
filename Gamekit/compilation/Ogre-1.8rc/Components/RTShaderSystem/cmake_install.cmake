# Install script for directory: /Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OGRE/RTShaderSystem" TYPE FILE FILES
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreRTShaderSystem.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderPrerequisites.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFFPColour.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFFPFog.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFFPLighting.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFFPRenderState.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFFPRenderStateBuilder.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFFPTexturing.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFFPTransform.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFunction.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderFunctionAtom.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderGenerator.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderParameter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderProgram.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderProgramManager.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderProgramSet.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderProgramWriter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderRenderState.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderSubRenderState.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExNormalMapLighting.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExPerPixelLighting.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExIntegratedPSSM3.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderScriptTranslator.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderMaterialSerializerListener.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderProgramProcessor.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderCGProgramProcessor.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderCGProgramWriter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderGLSLProgramProcessor.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderGLSLProgramWriter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderGLSLESProgramProcessor.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderGLSLESProgramWriter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderProgramWriterManager.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderHLSLProgramProcessor.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderHLSLProgramWriter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExLayeredBlending.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExHardwareSkinning.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExDualQuaternionSkinning.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExLinearSkinning.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExHardwareSkinningTechnique.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/Components/RTShaderSystem/include/OgreShaderExTextureAtlasSampler.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

