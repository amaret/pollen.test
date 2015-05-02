
/*
 * ======== MODULE local.mcu.Cpu ========
 */

var $$c = function() {
    const Cpu = {};
    Cpu.Cpu = Cpu
    Cpu.$name = 'local.mcu.Cpu';
    Cpu.pollen$used = 0;
    Cpu.reset = new $$Ref('local_mcu_Cpu_reset__E');
    Cpu.shutdown = new $$Ref('local_mcu_Cpu_shutdown__E');
    Cpu.wait = new $$Ref('local_mcu_Cpu_wait__E');
    Cpu.cycle = new $$Ref('local_mcu_Cpu_cycle__E');
    Cpu.getFrequency = new $$Ref('local_mcu_Cpu_getFrequency__E');
    Cpu.setFrequency = new $$Ref('local_mcu_Cpu_setFrequency__E');
    Cpu.targetInit = new $$Ref('local_mcu_Cpu_targetInit__I');
    Cpu.getFrequencyOnHost = function() {
        var $$text = '';
        return(  (Cpu.sysFreq)  );
        return $$text;
    }
    Cpu.setFrequencyOnHost = function( hz ) {
        var $$text = '';
        (Cpu.sysFreq) = (hz);
        return $$text;
    }
    Cpu.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Cpu.pollen__uses__ = function() {
    }
    Cpu.$$privateInit = function() {
        Cpu.sysFreq = 0;
    }
    return Cpu;
}
var $$u = $$c();
$units['local.mcu.Cpu'] = $$u;
$units.push($$u);

