#include "enet/enet.h"
#include <stdio.h>      // standard input / output functions
#include <stdlib.h>
#include <string.h>     // string function definitions
#include <unistd.h>     // UNIX standard function definitions
#include <fcntl.h>      // File control definitions
#include <errno.h>      // Error number definitions
#include <termios.h>    // POSIX terminal control definitions


int set_interface_attribs(int fd, int speed, int parity)
{
	struct termios tty;
	memset(&tty, 0, sizeof tty);
	if (tcgetattr(fd, &tty) != 0)
	{
		printf("error %d from tcgetattr", errno);
		return -1;
	}

	cfsetospeed(&tty, speed);
	cfsetispeed(&tty, speed);

	tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;     // 8-bit chars
	// disable IGNBRK for mismatched speed tests; otherwise receive break
	// as \000 chars
	tty.c_iflag &= ~IGNBRK;         // disable break processing
	tty.c_lflag = 0;                // no signaling chars, no echo,
	// no canonical processing
	tty.c_oflag = 0;                // no remapping, no delays
	tty.c_cc[VMIN] = 0;            // read doesn't block
	tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

	tty.c_iflag &= ~(IXON | IXOFF | IXANY); // shut off xon/xoff ctrl

	tty.c_cflag |= (CLOCAL | CREAD);// ignore modem controls,
	// enable reading
	tty.c_cflag &= ~(PARENB | PARODD);      // shut off parity
	tty.c_cflag |= parity;
	tty.c_cflag &= ~CSTOPB;
	tty.c_cflag &= ~CRTSCTS;

	if (tcsetattr(fd, TCSANOW, &tty) != 0)
	{
		printf("error %d from tcsetattr", errno);
		return -1;
	}

	tty.c_cc[VMIN] = 0;
	tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

	if (tcsetattr(fd, TCSANOW, &tty) != 0)
		printf("error %d setting term attributes", errno);
	return 0;
}

void* doSerialRead(void *arg) {
    /*
    int fd = *((int *)arg);
    char wholeData[1000];


     while (1){
      int n = 0;
        char buf = '\0';

        std::string response;

        do
        {
            n = read(fd, &buf, 1);
            response.append(&buf);
        } while (buf != '\r' && n > 0);

        if (n < 0)
        {
            cout << "Error reading: " << strerror(errno) << endl;
        }
        else if (n == 0)
        {
            cout << "Read nothing!" << endl;
        }
        else
        {
            cout << "Response: " << response;
        }
        
    }*/


    /*
    char data[100]
        char started = 0;
        int fixCounter = 0;
        for (int i = 0; i <= 1000; i++){
            if (started == 0 && wholeData[i] == '>' && wholeData[i + 2] == data[4]){
                started = 1;
                i += 3;
            }

            if (started == 1){
                fixed[fixCounter] = wholeData[i];
                fixCounter++;
                if (fixCounter >= returnDataSize + 5){
                    break;
                }
            }
        }
        ENetPacket* posPacket = enet_packet_create(fixed, returnDataSize + 1, ENET_PACKET_FLAG_RELIABLE);
        enet_peer_send(ev.peer, ev.channelID, posPacket);
        enet_host_flush(pHost);
    }*/
    return NULL;
}



int main(int argc, char *argv[])
{

	int fd = open("/dev/ttyAMA0", O_RDWR | O_NOCTTY | O_SYNC);
	if (fd < 0) {
		printf("error %d opening device: %s", errno, strerror(errno));
		return 0;
	}

	set_interface_attribs(fd, B115200, 0);  // set speed to 115,200 bps, 8n1 (no parity) no blocking

    if (enet_initialize() != 0){
        return EXIT_FAILURE;
    }

    ENetAddress addr;
    addr.host = ENET_HOST_ANY;
    addr.port = 10000;

    ENetHost* pHost = enet_host_create(&addr, 32, 15, 0, 0);;

    if (pHost == NULL) {
        return EXIT_FAILURE;
    }

    char data[100];


    //pthread_t serialReadThread;

    //int err = pthread_create(&serialReadThread, NULL, &doSerialRead, &fd);

    while (1){

        ENetEvent ev;
        int ret = enet_host_service(pHost, &ev, 0);
        if (ret > 0)
        {
            switch (ev.type) {

            case ENET_EVENT_TYPE_RECEIVE:{
                                            
                                             int size = ev.packet->dataLength; //ammount chars we send
                                             int i;
                                             for (i = 1; i < size; i++){
                                                 data[i-1] = *(ev.packet->data + i); //prep the tx data buffer
                                             }

											 if (*(ev.packet->data) != 0){
												 //must read from serial and return
											 }
5                                             write(fd, data, size-1);

                                             enet_packet_destroy(ev.packet); // destroy recived packet
                                             break;
            }
                
            };
        }
		
        usleep(1500);
    }
}