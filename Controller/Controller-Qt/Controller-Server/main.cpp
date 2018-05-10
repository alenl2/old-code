#define WIN32_LEAN_AND_MEAN

#include <QCoreApplication>
#include <QDebug>
#include <QThread>
#include "enet/enet.h"


int main(int argc, char *argv[])
{
    bool spamm = false;
	ENetPeer * target;

    if (enet_initialize () != 0){
       return EXIT_FAILURE;
    }

    ENetAddress addr;
      addr.host = ENET_HOST_ANY;
      addr.port = 10000;

      ENetHost *pHost =  enet_host_create (& addr /* the address to bind the server host to */,
         32      /* allow up to 32 clients and/or outgoing connections */,
         2      /* allow up to 2 channels to be used, 0 and 1 */,
         0      /* assume any amount of incoming bandwidth */,
         0      /* assume any amount of outgoing bandwidth */);;

         if (pHost == NULL) {
             return EXIT_FAILURE;
         }

    while(1){
		 ENetEvent ev;
         int ret = enet_host_service( pHost, &ev, 0 );
         if( ret > 0 )
         {
            switch( ev.type ) {

               case ENET_EVENT_TYPE_RECEIVE: {
                    const char* data = (const char*)ev.packet->data;

                    QString qData = QString::fromUtf8(data);
                    QStringList list = qData.split(",");

                    float servo0 = 0;
                    float servo1 = 0;
                    float servo2 = 0;
                    float servo3 = 0;

                    for(int i=0;i<list.count();i++){
                        QString curText = list.at(i);
                        if(curText.startsWith("a0")){
                            servo0 = curText.replace("a0:","").toFloat();
                        }
                        if(curText.startsWith("a1")){
                            servo1 = curText.replace("a1:","").toFloat();
                        }
                        if(curText.startsWith("a2")){
                            servo2 = curText.replace("a2:","").toFloat();
                        }
                        if(curText.startsWith("b3")){
                            servo3 = curText.replace("a3:","").toFloat();
                        }
                    }
                    qDebug()<<servo2;


                    //GPIO IT UP BRA
                     enet_packet_destroy( ev.packet ); // destroy recived packet
                  }
                  break;


            };
         }

    }
}
