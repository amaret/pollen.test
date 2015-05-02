
/*
 * ======== MODULE atmel.atmega328.Mcu ========
 */

var $$c = function() {
    const Mcu = {};
    Mcu.Mcu = Mcu
    Mcu.$name = 'atmel.atmega328.Mcu';
    Mcu.pollen$used = 0;
    Mcu.reset = new $$Ref('atmel_atmega328_Mcu_reset__E');
    Mcu.shutdown = new $$Ref('atmel_atmega328_Mcu_shutdown__E');
    Mcu.wait = new $$Ref('atmel_atmega328_Mcu_wait__E');
    Mcu.cycle = new $$Ref('atmel_atmega328_Mcu_cycle__E');
    Mcu.frequency = new $$Ref('atmel_atmega328_Mcu_frequency__E');
    Mcu.frequency = new $$Ref('frequency');
    Mcu.targetInit = new $$Ref('atmel_atmega328_Mcu_targetInit__I');
    Mcu.frequency = function() {
        var $$text = '';
        return(  (Mcu.sysFreq)  );
        return $$text;
    }
    Mcu.frequency = function( hz ) {
        var $$text = '';
        (Mcu.sysFreq) = (hz);
        return $$text;
    }
    Mcu.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Mcu.pollen__uses__ = function() {
    }
    Mcu.$$privateInit = function() {
        Mcu.sysFreq = 0;
    }
    return Mcu;
}
var $$u = $$c();
$units['atmel.atmega328.Mcu'] = $$u;
$units.push($$u);

