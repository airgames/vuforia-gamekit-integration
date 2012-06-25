# Install script for directory: /Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OGRE/Plugins/ParticleFX" TYPE FILE FILES
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreAreaEmitter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreBoxEmitterFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreBoxEmitter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreColourFaderAffector2.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreColourFaderAffectorFactory2.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreColourFaderAffectorFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreColourFaderAffector.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreColourImageAffectorFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreColourImageAffector.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreColourInterpolatorAffectorFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreColourInterpolatorAffector.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreCylinderEmitterFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreCylinderEmitter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreDeflectorPlaneAffectorFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreDeflectorPlaneAffector.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreDirectionRandomiserAffectorFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreDirectionRandomiserAffector.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreEllipsoidEmitterFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreEllipsoidEmitter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreHollowEllipsoidEmitterFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreHollowEllipsoidEmitter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreLinearForceAffectorFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreLinearForceAffector.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreParticleFXPlugin.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreParticleFXPrerequisites.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgrePointEmitterFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgrePointEmitter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreRingEmitterFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreRingEmitter.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreRotationAffectorFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreRotationAffector.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreScaleAffectorFactory.h"
    "/Users/erikvillegas/Development/Android/vuforia-sdk-android-1-5-9/samples/airgames/tools/Gamekit/Ogre-1.8rc/PlugIns/ParticleFX/include/OgreScaleAffector.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

