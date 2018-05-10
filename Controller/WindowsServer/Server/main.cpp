// Test2.cpp : Defines the entry point for the console application.
//

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <iostream>
#include <sstream>
#include "enet/enet.h"
#include <SDL.h>
#undef main


void Log(const char* str,...)
{
   va_list v;
   va_start(v,str);
   char buf[1024];
   vsprintf_s( buf, str, v );
   OutputDebugString( buf );
   printf( buf );
   va_end( v );
}

int main(int argc, const char* argv[])
{
   Log( "SERVER\n" );

   if (enet_initialize () != 0)
   {
      Log("An error occurred while initializing ENet.\n");
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

      if (pHost == NULL)
      {
          Log ("An error occurred while trying to create an ENet server host.\n");
          exit (EXIT_FAILURE);
      }

   while( 1 )
   {
      ENetEvent ev;


      int ret = enet_host_service( pHost, &ev, 0 );
      if( ret > 0 )
      {
         switch( ev.type ) {
            case ENET_EVENT_TYPE_CONNECT: {
                  Log("Client connected from %d.%d.%d.%d\n",(ev.peer->address.host>>0)&0xff,(ev.peer->address.host>>8)&0xff,(ev.peer->address.host>>16)&0xff,(ev.peer->address.host>>24)&0xff) ;
                  const char* data = "Hi noob client!";
                  ENetPacket* p = enet_packet_create( data, strlen(data)+1,ENET_PACKET_FLAG_RELIABLE );
                  enet_peer_send( ev.peer, 0, p );
               }
               break;

            case ENET_EVENT_TYPE_RECEIVE: {
                  Log( "RECEIVED: %s\n", ev.packet->data );
                  char data[50];
                  sprintf(data, "Server recived '%s' from  you.", (const char*)ev.packet->data);
                  ENetPacket* p = enet_packet_create( data, strlen(data)+1,ENET_PACKET_FLAG_RELIABLE );
                  enet_peer_send( ev.peer, 0, p );
                  enet_packet_destroy( ev.packet ); // destroy recived packet
               }
               break;

            case ENET_EVENT_TYPE_DISCONNECT: {
                  Log("Client disconnected \n");
               }
               break;

         };

      } else if( ret < 0 ) {
         Log( "ENET EREROR %d", ret );
         return 0;
      }
      Sleep(1);
   }


   enet_host_destroy(pHost);
   return 0;
}

