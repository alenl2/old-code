#define WIN32_LEAN_AND_MEAN

#include <QCoreApplication>
#include <SFML/Window.hpp>
#include <QDebug>
#include <QThread>
#include "enet/enet.h"


int main(int argc, char *argv[])
{

    bool spamm = false;
    if (enet_initialize () != 0) {
       return EXIT_FAILURE;
    }

    ENetHost * client;
      client = enet_host_create (NULL /* create a client host */,
         10 /* only allow 1 outgoing connection */,
         5 /* allow up 2 channels to be used, 0 and 1 */,
         0 /* 56K modem with 56 Kbps downstream bandwidth */,
         0 /* 56K modem with 14 Kbps upstream bandwidth */);

      ENetAddress address;

      ENetPeer *peer;
      enet_address_set_host (& address, "127.0.0.1");
      address.port = 10000;
      /* Initiate the connection, allocating the two channels 0 and 1. */
      peer = enet_host_connect (client, & address, 2, 0);

    while(1){
        ENetEvent ev;
        int ret = enet_host_service( client, &ev, 0 );
        if( ret > 0 ) {
           switch( ev.type ) {
           case ENET_EVENT_TYPE_CONNECT:
               spamm = true;
              break;
           case ENET_EVENT_TYPE_RECEIVE:
              enet_packet_destroy( ev.packet );
              break;

           case ENET_EVENT_TYPE_DISCONNECT:
               spamm = false;
               break;
            }
         }



        sf::Joystick::update();
        if (sf::Joystick::isConnected(0)){
            QString data = "";

            int buttons = sf::Joystick::getButtonCount(0);
            for(int i=0; i<buttons;i++){
                bool pressed = sf::Joystick::isButtonPressed(0, i);
                QString intStr = QString::number(i);
                data += "b"+intStr;
                if(pressed){
                    data += ":t,";
                } else {
                    data += ":f,";
                }
            }

            for(int i=0;i<8;i++){
                sf::Joystick::Axis ax = (sf::Joystick::Axis)i;
                int hasAxis = sf::Joystick::hasAxis(0, ax);
                if(hasAxis){
                    float pos = sf::Joystick::getAxisPosition(0, ax);
                    QString intStr = QString::number(i);
                    QString val = QString::number(pos);
                    data += "a"+intStr+":"+val+",";
                }
            }
            data.chop(1);

            if(spamm){
				std::string myChar = data.toStdString();
				const char* datas = myChar.c_str();
                ENetPacket* p = enet_packet_create( datas, strlen(datas)+1,ENET_PACKET_FLAG_UNSEQUENCED | ENET_PACKET_FLAG_UNRELIABLE_FRAGMENT );
                enet_peer_send(peer, 0, p);
            }

            QThread::msleep(1);
        } else {
            qDebug("!FOUND");
        }
    }
}
