QT += qml widgets core multimedia
android {
    QT += androidextras
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources
    # CONFIG +=  console


}

CONFIG += c++11

SOURCES += main.cpp
   # units.cpp \
   # javaclient.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model androidextras
QML_IMPORT_PATH =
include(qml-material/material.pri)

QML_IMPORT_PATH += qml-material
QML2_IMPORT_PATH += qml-material
#HEADERS += \
   # units.h \
   # javaclient.h

HEADERS +=

DISTFILES += \
    android-sources/AndroidManifest.xml \
    android-sources/gradle/wrapper/gradle-wrapper.jar \
    android-sources/gradlew \
    android-sources/res/values/libs.xml \
    android-sources/build.gradle \
    android-sources/gradle/wrapper/gradle-wrapper.properties \
    android-sources/gradlew.bat

