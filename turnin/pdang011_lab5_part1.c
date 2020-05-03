/*	Author: Patrick Dang
 *  Partner(s) Name: 
 *	Lab Section: 028
 *	Assignment: Lab #5  Exercise #1
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 *
 *	Video Link: https://drive.google.com/file/d/15ri0Y0H021Mg_3JogmOnuQBBd9VwWYrh/view?usp=sharing 
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF;
	DDRC = 0xFF; PORTC = 0x00;

	unsigned char fuelLevel = 0x00;
	unsigned char lowFuel = 0x00;
	unsigned char sensor;
   /* Insert your solution below */
    while (1) {
	sensor = ~PINA;
	
	lowFuel = (sensor <= 0x04) ? 0x40 : 0x00;

	if(sensor >= 0x0D){
		fuelLevel = 0x3F;
	}
	else if(sensor >= 0x0A){
		fuelLevel = 0x3E;
	}
	else if(sensor >= 0x07){
		fuelLevel = 0x3C;
	}
	else if(sensor >= 0x05){
		fuelLevel = 0x38;
	}
	else if(sensor >= 0x03){
		fuelLevel = 0x30;
	}
	else if(sensor >= 0x01){
		fuelLevel = 0x20;
	}
	else{
		fuelLevel = 0x00;
	}

	PORTC = fuelLevel | lowFuel;
    }
    return 1;
}
