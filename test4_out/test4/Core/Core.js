
/*
 * ======== MODULE test4.Core ========
 */

var $$c = function() {
    const Core = {};
    Core.Core = Core
    Core.$name = 'test4.Core';
    Core.pollen$used = 0;
    Core.reset = new $$Ref('test4_Core_reset__E');
    Core.shutdown = new $$Ref('test4_Core_shutdown__E');
    Core.wait = new $$Ref('test4_Core_wait__E');
    Core.cycle = new $$Ref('test4_Core_cycle__E');
    Core.getFrequency = new $$Ref('test4_Core_getFrequency__E');
    Core.setFrequency = new $$Ref('test4_Core_setFrequency__E');
    Core.targetInit = new $$Ref('test4_Core_targetInit__I');
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
$units['test4.Core'] = $$u;
$units.push($$u);

