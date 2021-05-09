//ECE 385 USB Host Shield code
//based on Circuits-at-home USB Host code 1.x
//to be used for ECE 385 course materials
//Revised October 2020 - Zuofu Cheng

#include <stdio.h>
#include "system.h"
#include "altera_avalon_spi.h"
#include "altera_avalon_spi_regs.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include "usb_interface/GenericMacros.h"
#include "usb_interface/GenericTypeDefs.h"
#include "usb_interface/HID.h"
#include "usb_interface/MAX3421E.h"
#include "usb_interface/transfer.h"
#include "usb_interface/usb_ch9.h"
#include "usb_interface/USB.h"

extern HID_DEVICE hid_device;

static BYTE addr = 1; 				//hard-wired USB address
const char* const devclasses[] = { " Uninitialized", " HID Keyboard", " HID Mouse", " Mass storage" };

BYTE GetDriverandReport() {
	BYTE i;
	BYTE rcode;
	BYTE device = 0xFF;
	BYTE tmpbyte;

	DEV_RECORD* tpl_ptr;
	printf("Reached USB_STATE_RUNNING (0x40)\n");
	for (i = 1; i < USB_NUMDEVICES; i++) {
		tpl_ptr = GetDevtable(i);
		if (tpl_ptr->epinfo != NULL) {
			printf("Device: %d", i);
			printf("%s \n", devclasses[tpl_ptr->devclass]);
			device = tpl_ptr->devclass;
		}
	}
	//Query rate and protocol
	rcode = XferGetIdle(addr, 0, hid_device.interface, 0, &tmpbyte);
	if (rcode) {   //error handling
		printf("GetIdle Error. Error code: ");
		printf("%x \n", rcode);
	} else {
		printf("Update rate: ");
		printf("%x \n", tmpbyte);
	}
	printf("Protocol: ");
	rcode = XferGetProto(addr, 0, hid_device.interface, &tmpbyte);
	if (rcode) {   //error handling
		printf("GetProto Error. Error code ");
		printf("%x \n", rcode);
	} else {
		printf("%d \n", tmpbyte);
	}
	return device;
}

void setLED(int LED) {
	IOWR_ALTERA_AVALON_PIO_DATA(LEDS_PIO_BASE,
			(IORD_ALTERA_AVALON_PIO_DATA(LEDS_PIO_BASE) | (0x001 << LED)));
}

void clearLED(int LED) {
	IOWR_ALTERA_AVALON_PIO_DATA(LEDS_PIO_BASE,
			(IORD_ALTERA_AVALON_PIO_DATA(LEDS_PIO_BASE) & ~(0x001 << LED)));

}

void printSignedHex0(signed char value) {
	BYTE tens = 0;
	BYTE ones = 0;
	WORD pio_val = IORD_ALTERA_AVALON_PIO_DATA(HEX_DIGITS_PIO_BASE);
	if (value < 0) {
		setLED(11);
		value = -value;
	} else {
		clearLED(11);
	}
	//handled hundreds
	if (value / 100)
		setLED(13);
	else
		clearLED(13);

	value = value % 100;
	tens = value / 10;
	ones = value % 10;

	pio_val &= 0x00FF;
	pio_val |= (tens << 12);
	pio_val |= (ones << 8);

	IOWR_ALTERA_AVALON_PIO_DATA(HEX_DIGITS_PIO_BASE, pio_val);
}

void printSignedHex1(signed char value) {
	BYTE tens = 0;
	BYTE ones = 0;
	DWORD pio_val = IORD_ALTERA_AVALON_PIO_DATA(HEX_DIGITS_PIO_BASE);
	if (value < 0) {
		setLED(10);
		value = -value;
	} else {
		clearLED(10);
	}
	//handled hundreds
	if (value / 100)
		setLED(12);
	else
		clearLED(12);

	value = value % 100;
	tens = value / 10;
	ones = value % 10;
	tens = value / 10;
	ones = value % 10;

	pio_val &= 0xFF00;
	pio_val |= (tens << 4);
	pio_val |= (ones << 0);

	IOWR_ALTERA_AVALON_PIO_DATA(HEX_DIGITS_PIO_BASE, pio_val);
}

void setKeycode(WORD keycode)
{
	//IOWR_ALTERA_AVALON_PIO_DATA(0x8002000, keycode);
	IOWR_ALTERA_AVALON_PIO_DATA(KEYCODE_BASE, keycode);
}

void setMouseData(BOOT_MOUSE_REPORT* buf)
{
	IOWR_ALTERA_AVALON_PIO_DATA(X_DISPL_BASE, buf->Xdispl);
	IOWR_ALTERA_AVALON_PIO_DATA(Y_DISPL_BASE, buf->Ydispl);
	IOWR_ALTERA_AVALON_PIO_DATA(BUTTON_BASE, buf->button);
}

void readProbabilities(WORD* buf)
{
	for (int i = 0; i < 10; ++i)
		buf[i] = IORD_ALTERA_AVALON_PIO_DATA(0x80 + i*0x10);
}

void setProbabilites(WORD* buf)
{	
	for (int i = 0; i < 10; ++i){
		IOWR_ALTERA_AVALON_PIO_DATA(0x120 + i*0x10, buf[i]);
	}

}

int main() {
	BYTE rcode;
	BOOT_MOUSE_REPORT buf;		//USB mouse report
	BOOT_KBD_REPORT kbdbuf;

	CHAR XDISPL[2] = {0};
	CHAR YDISPL[2] = {0};
	int count = 0;

	BYTE runningdebugflag = 0;//flag to dump out a bunch of information when we first get to USB_STATE_RUNNING
	BYTE errorflag = 0; //flag once we get an error device so we don't keep dumping out state info
	BYTE device;
	WORD keycode;

	WORD fixedpoint[10];
	WORD floatingpoint[10];
	float probabilites[10];
	float normal;
	float value;
	BYTE tens, ones, tenth, hundredth;

	/*
	printf("all MAX3421E register values...\n");
	alt_u8 data[19];
	MAXbytes_rd(rUSBIRQ, 19, data);
	for (int i = 0; i < 19; i++)
		printf("M[ %d ] = %#02x \n", (rUSBIRQ >> 3) + i, data[i]);
	*/

	printf("initializing MAX3421E...\n");
	MAX3421E_init();
	printf("initializing USB...\n");
	USB_init();
	buf.Xdispl = 0;
	buf.Ydispl = 0;
	while (1) {
		if (count == 1)
			count = 0;
		else
			++count;
		// read probabilites from hardware and convert to floating point/send back to hardware
		readProbabilities(fixedpoint);
		normal = 0.0f;
		for (int i = 0; i < 10; ++i) {
			probabilites[i] = (float)fixedpoint[i] / 2048.0f;
			normal += probabilites[i];
		}
		for (int i = 0; i < 10; ++i) {
			value = probabilites[i] / normal;
			tens = (int)(value * 10.0f);
			ones = (int)(value * 100.0f) % 10;
			tenth =  (int)(value * 1000.0f) % 10;
			hundredth = (int)(value * 10000.0f) % 10;
			floatingpoint[i] = (tens << (4*3)) | (ones << (4*2)) | (tenth << (4*1)) | (hundredth);
		}
		setProbabilites(floatingpoint);

		printf(".");
		MAX3421E_Task();
		usleep(1000);
		USB_Task();
		//usleep (500000);
		setMouseData(&buf);
		buf.Xdispl = 0;
		buf.Ydispl = 0;
		if (GetUsbTaskState() == USB_STATE_RUNNING) {
			if (!runningdebugflag) {
				runningdebugflag = 1;
				setLED(9);
				device = GetDriverandReport();
			} else if (device == 1) {
				//run keyboard debug polling
				rcode = kbdPoll(&kbdbuf);
				if (rcode == hrNAK) {
					continue; //NAK means no new data
				} else if (rcode) {
					printf("Rcode: ");
					printf("%x \n", rcode);
					continue;
				}
				printf("keycodes: ");
				for (int i = 0; i < 6; i++) {
					printf("%x ", kbdbuf.keycode[i]);
				}
				setKeycode(kbdbuf.keycode[0]);
				printSignedHex0(kbdbuf.keycode[0]);
				printSignedHex1(kbdbuf.keycode[1]);
				printf("\n");
			}

			else if (device == 2) {
				rcode = mousePoll(&buf);
				XDISPL[0] = (CHAR)buf.Xdispl;
				YDISPL[0] = (CHAR)buf.Ydispl;
				SHORT X = 0;
				SHORT Y = 0;
				for (int i = 0; i < 1; ++i) {
					X += XDISPL[i];
					Y += YDISPL[i];
				}
				buf.Xdispl = (X / 4) & 0xff;
				buf.Ydispl = (Y / 4) & 0xff;
				if (rcode == hrNAK) {
					//NAK means no new data
					continue;
				} else if (rcode) {
					printf("Rcode: ");
					printf("%x \n", rcode);
					continue;
				}
				printf("X displacement: ");
				printf("%d ", (signed char) buf.Xdispl);
				printSignedHex0((signed char) buf.Xdispl);
				printf("Y displacement: ");
				printf("%d ", (signed char) buf.Ydispl);
				printSignedHex1((signed char) buf.Ydispl);
				printf("Buttons: ");
				printf("%x\n", buf.button);
				if (buf.button & 0x04)
					setLED(2);
				else
					clearLED(2);
				if (buf.button & 0x02)
					setLED(1);
				else
					clearLED(1);
				if (buf.button & 0x01)
					setLED(0);
				else
					clearLED(0);
			}
		} else if (GetUsbTaskState() == USB_STATE_ERROR) {
			if (!errorflag) {
				errorflag = 1;
				clearLED(9);
				printf("USB Error State\n");
				//print out string descriptor here
			}
		} else //not in USB running state
		{

			printf("USB task state: ");
			printf("%x\n", GetUsbTaskState());
			if (runningdebugflag) {	//previously running, reset USB hardware just to clear out any funky state, HS/FS etc
				runningdebugflag = 0;
				MAX3421E_init();
				USB_init();
			}
			errorflag = 0;
			clearLED(9);
		}
	}
	return 0;
}
