
/*
 * ======== imports ========
 */

#ifndef mcu_atmel_atmega328p_Atmega328p__M
#define mcu_atmel_atmega328p_Atmega328p__M
#include "../../mcu.atmel.atmega328p/Atmega328p/Atmega328p.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test17_TimerManagerTest_pollen__reset__E();
void test17_TimerManagerTest_pollen__ready__E();
void test17_TimerManagerTest_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct mcu_atmel_atmega328p_Uart_ mcu_atmel_atmega328p_Uart;

/*
 * ======== struct module definition (unit Uart) ========
 */

struct mcu_atmel_atmega328p_Uart_ {
    uint32 baudRate;
};
typedef struct mcu_atmel_atmega328p_Uart_ mcu_atmel_atmega328p_Uart_;

/*
 * ======== host variables (unit Uart) ========
 */

typedef uint8 mcu_atmel_atmega328p_Uart_dataBits__TYPE;
extern const mcu_atmel_atmega328p_Uart_dataBits__TYPE mcu_atmel_atmega328p_Uart_dataBits__V;
typedef uint8 mcu_atmel_atmega328p_Uart_stopBits__TYPE;
extern const mcu_atmel_atmega328p_Uart_stopBits__TYPE mcu_atmel_atmega328p_Uart_stopBits__V;
typedef uint8 mcu_atmel_atmega328p_Uart_parity__TYPE;
extern const mcu_atmel_atmega328p_Uart_parity__TYPE mcu_atmel_atmega328p_Uart_parity__V;
typedef uint8 mcu_atmel_atmega328p_Uart_baudh__TYPE;
extern const mcu_atmel_atmega328p_Uart_baudh__TYPE mcu_atmel_atmega328p_Uart_baudh__V;
typedef uint8 mcu_atmel_atmega328p_Uart_baudl__TYPE;
extern const mcu_atmel_atmega328p_Uart_baudl__TYPE mcu_atmel_atmega328p_Uart_baudl__V;

/*
 * ======== function members (unit Uart) ========
 */

extern void mcu_atmel_atmega328p_Uart_flush__E();
extern uint8 mcu_atmel_atmega328p_Uart_get__E();
extern void mcu_atmel_atmega328p_Uart_targetInit__I();
extern void mcu_atmel_atmega328p_Uart_xsetBaud__E( uint32 baud );
extern void mcu_atmel_atmega328p_Uart_put__E( uint8 data );


/*
 * ======== data members (unit Uart) ========
 */

#define mcu_atmel_atmega328p_Uart_baudRate__V mcu_atmel_atmega328p_Uart.baudRate
