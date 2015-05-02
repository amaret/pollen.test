
/*
 * ======== COMPOSITION atmel.atmega.ATmega168 ========
 */

var $$c = function() {
    const ATmega168 = {};
    ATmega168.ATmega168 = ATmega168
    ATmega168.$name = 'atmel.atmega.ATmega168';
    ATmega168.pollen$used = 0;
    ATmega168.Cpu = $units['atmel.atmega.Cpu'];
    ATmega168.GlobalInterrupts = $units['atmel.atmega.GlobalInterrupts'];
    ATmega168.PB0 = $units['atmel.atmega.PB0'];
    ATmega168.PB1 = $units['atmel.atmega.PB1'];
    ATmega168.PB2 = $units['atmel.atmega.PB2'];
    ATmega168.PB3 = $units['atmel.atmega.PB3'];
    ATmega168.PB4 = $units['atmel.atmega.PB4'];
    ATmega168.PB5 = $units['atmel.atmega.PB5'];
    ATmega168.PD0 = $units['atmel.atmega.PD0'];
    ATmega168.PD1 = $units['atmel.atmega.PD1'];
    ATmega168.PD2 = $units['atmel.atmega.PD2'];
    ATmega168.PD3 = $units['atmel.atmega.PD3'];
    ATmega168.PD4 = $units['atmel.atmega.PD4'];
    ATmega168.PD5 = $units['atmel.atmega.PD5'];
    ATmega168.PD6 = $units['atmel.atmega.PD6'];
    ATmega168.PD7 = $units['atmel.atmega.PD7'];
    ATmega168.Timer0OverflowInterrupt = $units['atmel.atmega.Timer0OverflowInterrupt'];
    ATmega168.Timer1MatchAInterrupt = $units['atmel.atmega.Timer1MatchAInterrupt'];
    ATmega168.$$hostInit = function() {
        var $$text = '';
        $units['atmel.atmega.Cpu'].setFrequencyOnHost(16000000);
        return $$text;
    }
    return ATmega168;
}
var $$u = $$c();
$units['atmel.atmega.ATmega168'] = $$u;
$units.push($$u);

