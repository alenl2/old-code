#-------------------------------------------------
#
# Project created by QtCreator 2014-08-29T15:17:43
#
#-------------------------------------------------

QT       += core
QT       -= gui

TARGET = Controller-Client
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

# Add SFML include directory, where SFML headers are located
INCLUDEPATH += "../SFML-2.1-build/include"

# Add SFML library directory to search path
LIBS += -L"../SFML-2.1-build/lib"

# Add SFML window library, where Joystick is located
LIBS += -lsfml-window
LIBS += -lws2_32
LIBS += -lwinmm

SOURCES += main.cpp \
    callbacks.c \
    compress.c \
    host.c \
    list.c \
    packet.c \
    peer.c \
    protocol.c \
    win32.c \
    unix.c

HEADERS += \
    enet/callbacks.h \
    enet/enet.h \
    enet/list.h \
    enet/protocol.h \
    enet/time.h \
    enet/types.h \
    enet/utility.h \
    enet/win32.h \
    enet/callbacks.h \
    enet/enet.h \
    enet/list.h \
    enet/protocol.h \
    enet/time.h \
    enet/types.h \
    enet/unix.h \
    enet/utility.h \
    enet/win32.h
