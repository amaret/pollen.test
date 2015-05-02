
/*
 * ======== MODULE amaret.local.Mcu ========
 */

var $$c = function() {
    const Mcu = {};
    Mcu.Mcu = Mcu
    Mcu.$name = 'amaret.local.Mcu';
    Mcu.pollen$used = 0;
    Mcu.reset = new $$Ref('amaret_local_Mcu_reset__E');
    Mcu.shutdown = new $$Ref('amaret_local_Mcu_shutdown__E');
    Mcu.wait = new $$Ref('amaret_local_Mcu_wait__E');
    Mcu.cycle = new $$Ref('amaret_local_Mcu_cycle__E');
    Mcu.getFrequency = new $$Ref('amaret_local_Mcu_getFrequency__E');
    Mcu.setFrequency = new $$Ref('amaret_local_Mcu_setFrequency__E');
    Mcu.targetInit = new $$Ref('amaret_local_Mcu_targetInit__I');
    Mcu.getFrequencyOnHost = function() {
        var $$text = '';
        return(  (Mcu.sysFreq)  );
        return $$text;
    }
    Mcu.setFrequencyOnHost = function( hz ) {
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
$units['amaret.local.Mcu'] = $$u;
$units.push($$u);

