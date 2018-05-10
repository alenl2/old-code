#include <jni.h>
#include "../libenet/enet/enet.h"
#include <android/log.h>

#define  LOG_TAG    "NativeQuad"
#define  ALOG(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  PACKET_DELAY 10000

#define CHANNAL_LIMIT 15


extern "C" {
bool enable = true; //will get set to false so we know to exit the main loop asap
bool connected = false; //are we connected to the server
char posTxBuf[23]; //contains the stick positions for unreliable spamm
bool posTxBufLock = false;

typedef struct _CommStuct {
	char data[100];
	uint8_t dataSize;
	uint8_t chanall;
	uint8_t returnDataSize;
	char returnData[100];
	bool isReturned;
	bool isTxRedy;
} CommStuct;

CommStuct commsArray[CHANNAL_LIMIT];

//send data to multiwii and get a reply
JNIEXPORT jintArray JNICALL Java_si_komp_quadcontroller_QuadConnector_sendRequestForData(JNIEnv *env, jobject obj, jint command, jint commandLength, jint dataChannel) {

    if (connected != true) {
		return NULL; //i wasent reeeedy
	}

	CommStuct *tx = &commsArray[dataChannel];
	tx->chanall = dataChannel;
    tx->isReturned = false;
    tx->dataSize = 4;
    tx->returnDataSize = 0;
    tx->isReturned = false;

    tx->data[0] = commandLength;
    tx->data[1] = '$';
    tx->data[2] = 'M';
    tx->data[3] = '<';
    tx->data[4] = 0; //payload size
    tx->data[5] = (int)command; //multiwii command
    tx->data[6] = (int)command; //xor checksum

    tx->isTxRedy = true;

	if (commandLength == 0) { //no data reply requestd
		return NULL; // return  nothing
	}

    while (tx->isReturned == false) { //while the eEvents[(int) dataChannel] packet is not set
		usleep(100); //wait data to come back
	}

	jint fill[100];
    char recivedChecksum = tx->returnData[commandLength];
    char calculatedChecksum = 0;
    calculatedChecksum ^= (int)commandLength;
    calculatedChecksum ^= (int)command;

	for (int i = 0; i < commandLength; i++) {
        fill[i] = (uint8_t)tx->returnData[i]; //cast recived data to jint[]
        calculatedChecksum ^= fill[i];
	}

    if (calculatedChecksum != recivedChecksum){
        return NULL;
    }

	jintArray result = env->NewIntArray(commandLength); //prep the reurn array

	env->SetIntArrayRegion(result, 0, commandLength, fill); //set data in jintArray
	return result;

	return NULL;

}

JNIEXPORT jint JNICALL Java_si_komp_quadcontroller_QuadConnector_mains(JNIEnv *env, jobject obj) {
	enable = true;
	if (enet_initialize() != 0) {
		return 1; //well that didn't go according to plan
	}

	ENetHost * client = enet_host_create(NULL, 10, CHANNAL_LIMIT, 0, 0); //create client

	ENetAddress address;
	enet_address_set_host(&address, "192.168.1.77");
	address.port = 10000;
	ENetPeer *peer = enet_host_connect(client, &address, CHANNAL_LIMIT, 0); //connect to server

	while (enable) {
		ENetEvent ev; //proces enet data
		int ret = enet_host_service(client, &ev, 0);
		if (ret > 0) {
			switch (ev.type) {
			case ENET_EVENT_TYPE_CONNECT:
				connected = true;
				break;
			case ENET_EVENT_TYPE_RECEIVE: {
				CommStuct* tx = &commsArray[ev.channelID];
				tx->returnDataSize = ev.packet->dataLength;

				for (int i = 0; i < tx->returnDataSize; i++) {
					tx->returnData[i] = *(ev.packet->data + i);
				}
				tx->isReturned = true;

				enet_packet_destroy(ev.packet); // destroy recived packet no relevant data will be recived here
				break;
			}
			case ENET_EVENT_TYPE_DISCONNECT:
				connected = false;
				peer = enet_host_connect(client, &address, CHANNAL_LIMIT, 0);
			}
		}

		if (connected) {
			while(posTxBufLock){
				usleep(1);
			}
			ENetPacket* posPacket = enet_packet_create(posTxBuf, 23, ENET_PACKET_FLAG_UNSEQUENCED | ENET_PACKET_FLAG_UNRELIABLE_FRAGMENT);
			enet_peer_send(peer, 0, posPacket);

			enet_host_flush(client);

			for (int i = 0; i < CHANNAL_LIMIT + 1; i++) {
				CommStuct* tx = &commsArray[i];
				if (tx->isTxRedy) {
					ENetPacket* posPacket = enet_packet_create(tx->data, tx->dataSize, ENET_PACKET_FLAG_RELIABLE);
					enet_peer_send(peer, tx->chanall, posPacket);
					enet_host_flush(client);
					tx->isTxRedy = false;
				}
			}
		}

		usleep(PACKET_DELAY);
	}
	return 1;
}

JNIEXPORT void JNICALL Java_si_komp_quadcontroller_QuadConnector_stopNet(JNIEnv *env, jobject obj) {
	enable = false; //exit the mains loop cleanly asap
}

//set the stick values
JNIEXPORT void JNICALL Java_si_komp_quadcontroller_QuadConnector_setValues(JNIEnv *env, jobject obj, jintArray data) {
	jint *body = env->GetIntArrayElements(data, 0);

	posTxBufLock = true;
	posTxBuf[0] = 0;
	posTxBuf[1] = '$';
	posTxBuf[2] = 'M';
	posTxBuf[3] = '<';
	posTxBuf[4] = 16; //payload size
	posTxBuf[5] = 200; //multiwii command

	//positions
	posTxBuf[6] = (body[0]) & 0xFF;
	posTxBuf[7] = (body[0] >> 8) & 0xFF;
	posTxBuf[8] = (body[1]) & 0xFF;
	posTxBuf[9] = (body[1] >> 8) & 0xFF;
	posTxBuf[10] = (body[2]) & 0xFF;
	posTxBuf[11] = (body[2] >> 8) & 0xFF;
	posTxBuf[12] = (body[3]) & 0xFF;
	posTxBuf[13] = (body[3] >> 8) & 0xFF;
	posTxBuf[14] = (body[4]) & 0xFF;
	posTxBuf[15] = (body[4] >> 8) & 0xFF;
	posTxBuf[16] = (body[5]) & 0xFF;
	posTxBuf[17] = (body[5] >> 8) & 0xFF;
	posTxBuf[18] = (body[6]) & 0xFF;
	posTxBuf[19] = (body[6] >> 8) & 0xFF;
	posTxBuf[20] = (body[7]) & 0xFF;
	posTxBuf[21] = (body[7] >> 8) & 0xFF;

	//calculate checksum
	char checksum = 0;
	for (int i = 4; i < 22; i++) {
		checksum ^= posTxBuf[i];
	}
	posTxBuf[22] = checksum;

	posTxBufLock = false;
	//release jni data
	env->ReleaseIntArrayElements(data, body, 0);
}
}

