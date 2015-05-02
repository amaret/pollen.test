
/*
 * ======== MODULE mcu.atmel.atmega328p.Uart ========
 */

var $$c = function() {
    const Uart = {};
    Uart.Uart = Uart
    Uart.$name = 'mcu.atmel.atmega328p.Uart';
    Uart.pollen$used = 0;
    Uart.Mcu = $units['mcu.atmel.atmega328p.Atmega328p'];
    Uart.targetInit = new $$Ref('mcu_atmel_atmega328p_Uart_targetInit__I');
    Uart.put = new $$Ref('mcu_atmel_atmega328p_Uart_put__E');
    Uart.get = new $$Ref('mcu_atmel_atmega328p_Uart_get__E');
    Uart.flush = new $$Ref('mcu_atmel_atmega328p_Uart_flush__E');
    Uart.xsetBaud = new $$Ref('mcu_atmel_atmega328p_Uart_xsetBaud__E');
    Uart.$$hostInit = function() {
        var $$text = '';
        (Uart.baudh) = ((($units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency() / ((Uart.baudRate) * 16)) - 1) >> 8);
        (Uart.baudl) = ((($units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency() / ((Uart.baudRate) * 16)) - 1));
        return $$text;
    }
    Uart.setBaud = function( baud ) {
        var $$text = '';
        (Uart.baudRate) = (baud);
        (Uart.baudh) = ((($units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency() / ((Uart.baudRate) * 16)) - 1) >> 8);
        (Uart.baudl) = ((($units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency() / ((Uart.baudRate) * 16)) - 1));
        return $$text;
    }
    Uart.pollen__uses__ = function() {
        $$bind($units['mcu.atmel.atmega328p.Atmega328p'], 'pollen$used', true);
    }
    Uart.$$privateInit = function() {
        Uart.baudRate = 9600;
        Uart.dataBits = 8;
        Uart.stopBits = 1;
        Uart.parity = 0;
        Uart.baudh = 0;
        Uart.baudl = 0;
    }
    return Uart;
}
var $$u = $$c();
$units['mcu.atmel.atmega328p.Uart'] = $$u;
$units.push($$u);

