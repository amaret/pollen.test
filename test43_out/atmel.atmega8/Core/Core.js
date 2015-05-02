
/*
 * ======== MODULE atmel.atmega8.Core ========
 */

var $$c = function() {
    const Core = {};
    Core.Core = Core
    Core.$name = 'atmel.atmega8.Core';
    Core.pollen$used = 0;
    Core.reset = new $$Ref('atmel_atmega8_Core_reset__E');
    Core.shutdown = new $$Ref('atmel_atmega8_Core_shutdown__E');
    Core.wait = new $$Ref('atmel_atmega8_Core_wait__E');
    Core.cycle = new $$Ref('atmel_atmega8_Core_cycle__E');
    Core.getFrequency = new $$Ref('atmel_atmega8_Core_getFrequency__E');
    Core.setFrequency = new $$Ref('atmel_atmega8_Core_setFrequency__E');
    Core.targetInit = new $$Ref('atmel_atmega8_Core_targetInit__I');
    Core.getFrequencyOnHost = function() {
        var $$text = '';
        return(  (Core.sysFreq)  );
        return $$text;
    }
    Core.setFrequencyOnHost = function( hz ) {
        var $$text = '';
        (Core.sysFreq) = (hz);
        return $$text;
    }
    Core.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Core.pollen__uses__ = function() {
    }
    Core.$$privateInit = function() {
        Core.sysFreq = 0;
        Core.nops = 8;
    }
    return Core;
}
var $$u = $$c();
$units['atmel.atmega8.Core'] = $$u;
$units.push($$u);

