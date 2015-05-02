
/*
 * ======== string literals ========
 */

static const char mcu_atmel_atmega328p_Uart__s__fileName[] = "Uart.p";
static const char mcu_atmel_atmega328p_Uart__s__0[] = "Uart";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void mcu_atmel_atmega328p_Uart_flush__E() {
    volatile uint8 dummy;
    dummy = 0;
    while (UCSR0A & (1 << RXC0)) {
        (dummy) = UDR0;
    }
}

uint8 mcu_atmel_atmega328p_Uart_get__E() {
    while (!(UCSR0A & (1 << RXC0))) {
    }
    return(  UDR0  );
}

void mcu_atmel_atmega328p_Uart_targetInit__I() {
    UBRR0H = (mcu_atmel_atmega328p_Uart_baudh__V);
    UBRR0L = (mcu_atmel_atmega328p_Uart_baudl__V);
    UCSR0B |= (1 << RXEN0) | (1 << TXEN0);

    UCSR0C |= (1 << UCSZ00) | (1 << UCSZ01);

}

void mcu_atmel_atmega328p_Uart_xsetBaud__E( uint32 baud ) {
    (mcu_atmel_atmega328p_Uart_baudRate__V) = (baud);
    UBRR0H = (((mcu_atmel_atmega328p_Atmega328p_getSystemFrequency__E() / ((mcu_atmel_atmega328p_Uart_baudRate__V) * 16)) - 1) >> 8);
    UBRR0L = (((mcu_atmel_atmega328p_Atmega328p_getSystemFrequency__E() / ((mcu_atmel_atmega328p_Uart_baudRate__V) * 16)) - 1));
}

void mcu_atmel_atmega328p_Uart_put__E( uint8 data ) {
    while (!(UCSR0A & (1 << UDRE0))) {
    }
    UDR0 = (data);
}

