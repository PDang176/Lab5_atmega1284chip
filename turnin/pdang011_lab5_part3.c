/*	Author: Patrick Dang
 *  Partner(s) Name: 
 *	Lab Section: 028
 *	Assignment: Lab #5  Exercise #3
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 *
 * 	Video Link: https://drive.google.com/file/d/15xy95S_1Xu1IdeD3RpohRFRzIeGlcrwg/view?usp=sharing 
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

enum States{Start, Wait_Press, Wait_Release} state;

unsigned char lights[6] = {0x00, 0x15, 0x2A, 0x38, 0x07, 0x3F};
unsigned char i;
unsigned char button;

void Tick(){
	//Transitions
	switch(state){
		case Start:
			i = 0;
			PORTB = lights[i];
			state = Wait_Press;
			break;
		case Wait_Press:
			button = ~PINA & 0x01;
			if(button){
				state = Wait_Release;
				i = (i < 5) ? i + 1 : 0;
				PORTB = lights[i];
			}
			else{
				state = Wait_Press;
			}
			break;
		case Wait_Release:
			button = ~PINA * 0x01;
			state = (button) ? Wait_Release : Wait_Press;
			break;
		default:
			state = Start;
			break;
	}
	
	//State Actions
	switch(state){
		case Start:
                case Wait_Press:
                case Wait_Release:
                default:
			break;
	}
}

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF;
	DDRB = 0xFF; PORTB = 0x00;

	state = Start;
	
   /* Insert your solution below */
    	while(1) {
		Tick();
	}
    	return 1;
}
