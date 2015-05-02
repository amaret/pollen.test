
/*
 * ======== COMPOSITION mcu.atmel.atmega328p.Mcu ========
 */

var $$c = function() {
    const Mcu = {};
    Mcu.Mcu = Mcu
    Mcu.$name = 'mcu.atmel.atmega328p.Mcu';
    Mcu.pollen$used = 0;
    Mcu.Atmega328p = $units['mcu.atmel.atmega328p.Atmega328p'];
    Mcu.GlobalInterrupts = $units['mcu.atmel.atmega328p.GlobalInterrupts'];
    Mcu.TimerMilli8BitTimer0 = $units['mcu.atmel.atmega328p.TimerMilli8BitTimer0'];
    Mcu.Uart = $units['mcu.atmel.atmega328p.Uart'];
    Mcu.PB3 = $units['mcu.atmel.atmega328p.PB3'];
    Mcu.PB4 = $units['mcu.atmel.atmega328p.PB4'];
    Mcu.PB5 = $units['mcu.atmel.atmega328p.PB5'];
    Mcu.getSystemFrequency = function() {
        var $$text = '';
        return(  $units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency()  );
        return $$text;
    }
    Mcu.setSystemFrequency = function( hz ) {
        var $$text = '';
        $units['mcu.atmel.atmega328p.Atmega328p'].setSystemFrequency((hz));
        return $$text;
    }
    return Mcu;
}
var $$u = $$c();
$units['mcu.atmel.atmega328p.Mcu'] = $$u;
$units.push($$u);

