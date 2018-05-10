// Test2.cpp : Defines the entry point for the console application.
//

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <iostream>
#include <sstream>
#include "enet/enet.h"


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
   Log( "CLIENT\n" );
   if (enet_initialize () != 0)
   {
      Log("An error occurred while initializing ENet.\n");
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

   while( 1 )
   {
      ENetEvent ev;
      int ret = enet_host_service( client, &ev, 0 );
      if( ret > 0 )
      {
         switch( ev.type ) {
         case ENET_EVENT_TYPE_CONNECT:
            {
               Log("Connection succeeded. sending hi\n");
               const char* data = "Hi noob server!";
               ENetPacket* p = enet_packet_create( data, strlen(data)+1, 0 );
               enet_peer_send( peer, 0, p );
            }
            break;
         case ENET_EVENT_TYPE_RECEIVE:
            {
               Log("RECIVED: %s\n", ev.packet->data);
               enet_packet_destroy( ev.packet );
            }
            break;
         }
      }  
   } 

   return 0;
}

