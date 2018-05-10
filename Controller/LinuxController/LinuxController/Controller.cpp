
#include <math.h>
#include "gamepad.h"
#include <stdio.h>

#if defined(_WIN32)
	#include <tchar.h>
	#include "Windows.h"
#elif defined(__linux__)
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
#endif


#define SERIAL

float map(float value, float oldMin, float oldMax, float newMin, float newMax) {
	return (((value - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin;
}

int main(int argc, char *argv[]){

	#ifdef SERIAL			
		#if defined(_WIN32)
			printf("SERIAL ENABLED\n");
			DCB dcb;
			HANDLE hPort = CreateFile(L"COM4",GENERIC_WRITE,0,NULL,OPEN_EXISTING,0,NULL);

			if (!GetCommState(hPort, &dcb))
				printf("SERIAL INIT FAIL\n");

			dcb.BaudRate = CBR_115200;
			dcb.ByteSize = 8; //8 data bits 
			dcb.Parity = NOPARITY; //no parity 
			dcb.StopBits = ONESTOPBIT; //1 stop 

			if (!SetCommState(hPort, &dcb)){
				printf("SERIAL INIT FAIL\n");
			}

		#elif defined(__linux__)
			int fd = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY | O_SYNC);
			if (fd < 0) {
				printf("error %d opening device: %s", errno, strerror(errno));
				return 0;
			}

			set_interface_attribs(fd, B115200, 0);  // set speed to 115,200 bps, 8n1 (no parity) no blocking
		#endif

	#endif


    GamepadInit();
	int sleepTime = 15;

	char posTxBuf[23];
	posTxBuf[0] = '0';
	posTxBuf[1] = '$';
	posTxBuf[2] = 'M';
	posTxBuf[3] = '<';
	posTxBuf[4] = 16; //payload size
	posTxBuf[5] = 200; //multiwii command (set stick values)

	int posBuf[8];
	for (int i = 0; i < 8; i++){
		posBuf[i] = 1500;
	}

	while (1) {

        GamepadUpdate();

        int gamepad = -1;
        GAMEPAD_DEVICE gamepadIndex;
        for (int i = 0; i < GAMEPAD_COUNT; ++i) {
            GAMEPAD_BOOL is = GamepadIsConnected((GAMEPAD_DEVICE)i);
            if (is == GAMEPAD_TRUE) {
                gamepad = i;
            }
        }
        gamepadIndex = (GAMEPAD_DEVICE)gamepad;

        if (GamepadButtonTriggered(gamepadIndex, BUTTON_A)){
			posBuf[7] = 2000;
		}

        if (GamepadButtonTriggered(gamepadIndex, BUTTON_B)){
			posBuf[6] = 2000;
		}

		if (GamepadButtonTriggered(gamepadIndex, BUTTON_X)){
			posBuf[7] = 1500;
		}

        if (GamepadButtonTriggered(gamepadIndex, BUTTON_Y)){
			posBuf[6] = 1500;
		}

        if (GamepadButtonTriggered(gamepadIndex, BUTTON_RIGHT_SHOULDER)){
			posBuf[5] = 2000;
		}

        if (GamepadButtonTriggered(gamepadIndex, BUTTON_LEFT_SHOULDER)){
			posBuf[5] = 1500;
		}

        if (GamepadButtonTriggered(gamepadIndex, BUTTON_RIGHT_THUMB)){

		}

        if(GamepadButtonTriggered(gamepadIndex, BUTTON_LEFT_THUMB)){

		}

        if (GamepadButtonTriggered(gamepadIndex, BUTTON_BACK)){
            if (posBuf[3] <= 1000 && posBuf[6] == 1500){ // throttle low and baro off
                posBuf[4] = 1500;
            }
			
		}

        if (GamepadButtonTriggered(gamepadIndex, BUTTON_START)){
            if (posBuf[3] <= 1000 && posBuf[6] == 1500){ // throttle low and baro off
                posBuf[4] = 2000;
            }
			
		}

        /*
		if ((state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_RIGHT) == XINPUT_GAMEPAD_DPAD_RIGHT){
		}
		if ((state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_LEFT) == XINPUT_GAMEPAD_DPAD_LEFT){
		}
		if ((state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_DOWN) == XINPUT_GAMEPAD_DPAD_DOWN){
		}
		if ((state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_UP) == XINPUT_GAMEPAD_DPAD_UP){
		}*/

        int roll;
        int pitch;
        GamepadStickXY(gamepadIndex, STICK_RIGHT, &roll, &pitch);

        if (roll < GAMEPAD_DEADZONE_RIGHT_STICK && roll > 0){
            roll = 0;
        }
        else if (roll > -GAMEPAD_DEADZONE_RIGHT_STICK && roll < 0){
            roll = 0;
        }
        else if (roll > GAMEPAD_DEADZONE_RIGHT_STICK) {
            roll -= GAMEPAD_DEADZONE_RIGHT_STICK;
        }
        else if (roll < -GAMEPAD_DEADZONE_RIGHT_STICK) {
            roll += GAMEPAD_DEADZONE_RIGHT_STICK;
        }

        if (pitch < GAMEPAD_DEADZONE_RIGHT_STICK && pitch > 0){
            pitch = 0;
        }
        else if (pitch > -GAMEPAD_DEADZONE_RIGHT_STICK && pitch < 0){
            pitch = 0;
        }
        else if (pitch > GAMEPAD_DEADZONE_RIGHT_STICK) {
            pitch -= GAMEPAD_DEADZONE_RIGHT_STICK;
        }
        else if (pitch < -GAMEPAD_DEADZONE_RIGHT_STICK) {
            pitch += GAMEPAD_DEADZONE_RIGHT_STICK;
        }

				
        roll = roundf(map(roll, -32768 + GAMEPAD_DEADZONE_RIGHT_STICK, 32767 - GAMEPAD_DEADZONE_RIGHT_STICK, 1000, 2000));
		pitch = roundf(map(pitch, -32768 + GAMEPAD_DEADZONE_RIGHT_STICK, 32767 - GAMEPAD_DEADZONE_RIGHT_STICK, 1000, 2000));


        int yaw;
        int throtle;
        GamepadStickXY(gamepadIndex, STICK_LEFT, &yaw, &throtle);

        if (yaw < GAMEPAD_DEADZONE_LEFT_STICK && yaw > 0){
			yaw = 0;
        }
        else if (yaw > -GAMEPAD_DEADZONE_LEFT_STICK && yaw < 0){
			yaw = 0;
        }
        else if (yaw > GAMEPAD_DEADZONE_LEFT_STICK) {
            yaw -= GAMEPAD_DEADZONE_LEFT_STICK;
        }
        else if (yaw < -GAMEPAD_DEADZONE_LEFT_STICK) {
            yaw += GAMEPAD_DEADZONE_LEFT_STICK;
		}


        yaw = roundf(map(yaw, -32768 + GAMEPAD_DEADZONE_LEFT_STICK, 32767 - GAMEPAD_DEADZONE_LEFT_STICK, 1000, 2000));

        throtle = GamepadTriggerValue(gamepadIndex, TRIGGER_LEFT) - GamepadTriggerValue(gamepadIndex, TRIGGER_RIGHT);
                throtle = map(throtle, -255, 255, 1000, 2000);

				posBuf[0] = roll;
				posBuf[1] = pitch;
				posBuf[2] = yaw;
				posBuf[3] = throtle;

				//positions
				posTxBuf[6] = (posBuf[0]) & 0xFF;
				posTxBuf[7] = (posBuf[0] >> 8) & 0xFF;
				posTxBuf[8] = (posBuf[1]) & 0xFF;
				posTxBuf[9] = (posBuf[1] >> 8) & 0xFF;
				posTxBuf[10] = (posBuf[2]) & 0xFF;
				posTxBuf[11] = (posBuf[2] >> 8) & 0xFF;
				posTxBuf[12] = (posBuf[3]) & 0xFF;
				posTxBuf[13] = (posBuf[3] >> 8) & 0xFF;
				posTxBuf[14] = (posBuf[4]) & 0xFF;
				posTxBuf[15] = (posBuf[4] >> 8) & 0xFF;
				posTxBuf[16] = (posBuf[5]) & 0xFF;
				posTxBuf[17] = (posBuf[5] >> 8) & 0xFF;
				posTxBuf[18] = (posBuf[6]) & 0xFF;
				posTxBuf[19] = (posBuf[6] >> 8) & 0xFF;
				posTxBuf[20] = (posBuf[7]) & 0xFF;
				posTxBuf[21] = (posBuf[7] >> 8) & 0xFF;

				//calculate checksum
				char checksum = 0;
				for (int i = 4; i < 22; i++) {
					checksum ^= posTxBuf[i];
				}
				posTxBuf[22] = checksum;


				#ifdef SERIAL
					#if defined(_WIN32)
						DWORD byteswritten;
						WriteFile(hPort, (LPCVOID)posTxBuf, 23, &byteswritten, NULL);
					#elif defined(__linux__)
						write(fd, posTxBuf, 23);
					#endif
				#endif

                
                for (int i = 0; i < 8; i++){
                    printf("%d=%d   ", i, posBuf[i]);
                }
                printf("\n");


				#if defined(_WIN32)
					Sleep(sleepTime);
				#elif defined(__linux__)
					usleep(sleepTime*1000);
				#endif
                    
			
		
	}

	#ifdef SERIAL

		#if defined(_WIN32)
			CloseHandle(hPort);
		#elif defined(__linux__)
		#endif

		
	#endif


}