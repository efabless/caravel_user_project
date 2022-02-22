#include "uart_controls.h"

void writeSingleCharacterToUart(const char character) {
	if (character == '\n') {
		writeSingleCharacterToUart('\r');
	}
	while (reg_uart_txfull == 1) {};
	reg_uart_data = character;
}


void writeToUart(const char* string) {
	while (*string != '\0') {
		writeSingleCharacterToUart(*(string++));
	}
}
