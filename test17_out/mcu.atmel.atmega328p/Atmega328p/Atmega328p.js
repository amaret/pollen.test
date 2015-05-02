
/*
 * ======== MODULE mcu.atmel.atmega328p.Atmega328p ========
 */

var $$c = function() {
    const Atmega328p = {};
    Atmega328p.Atmega328p = Atmega328p
    Atmega328p.$name = 'mcu.atmel.atmega328p.Atmega328p';
    Atmega328p.pollen$used = 0;
    Atmega328p.reset = new $$Ref('mcu_atmel_atmega328p_Atmega328p_reset__E');
    Atmega328p.shutdown = new $$Ref('mcu_atmel_atmega328p_Atmega328p_shutdown__E');
    Atmega328p.wait = new $$Ref('mcu_atmel_atmega328p_Atmega328p_wait__E');
    Atmega328p.nop = new $$Ref('mcu_atmel_atmega328p_Atmega328p_nop__E');
    Atmega328p.getSystemFrequency = new $$Ref('mcu_atmel_atmega328p_Atmega328p_getSystemFrequency__E');
    Atmega328p.setSystemFrequency = new $$Ref('mcu_atmel_atmega328p_Atmega328p_setSystemFrequency__E');
    Atmega328p.targetInit = new $$Ref('mcu_atmel_atmega328p_Atmega328p_targetInit__I');
    Atmega328p.getSystemFrequency = function() {
        var $$text = '';
        return(  Atmega328p.sysFreq  );
        return $$text;
    }
    Atmega328p.setSystemFrequency = function( hz ) {
        var $$text = '';
        Atmega328p.sysFreq = (hz);
        return $$text;
    }
    Atmega328p.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Atmega328p.pollen__uses__ = function() {
    }
    Atmega328p.$$privateInit = function() {
        Atmega328p.sysFreq = 0;
    }
    return Atmega328p;
}
var $$u = $$c();
$units['mcu.atmel.atmega328p.Atmega328p'] = $$u;
$units.push($$u);

