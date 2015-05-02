
/*
 * ======== MODULE atmel.atmega.Cpu ========
 */

var $$c = function() {
    const Cpu = {};
    Cpu.Cpu = Cpu
    Cpu.$name = 'atmel.atmega.Cpu';
    Cpu.pollen$used = 0;
    Cpu.reset = new $$Ref('atmel_atmega_Cpu_reset__E');
    Cpu.shutdown = new $$Ref('atmel_atmega_Cpu_shutdown__E');
    Cpu.wait = new $$Ref('atmel_atmega_Cpu_wait__E');
    Cpu.cycle = new $$Ref('atmel_atmega_Cpu_cycle__E');
    Cpu.getFrequency = new $$Ref('atmel_atmega_Cpu_getFrequency__E');
    Cpu.setFrequency = new $$Ref('atmel_atmega_Cpu_setFrequency__E');
    Cpu.targetInit = new $$Ref('atmel_atmega_Cpu_targetInit__I');
    Cpu.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Cpu.getFrequencyOnHost = function() {
        var $$text = '';
        return(  (Cpu.sysFreq)  );
        return $$text;
    }
    Cpu.setFrequencyOnHost = function( hz ) {
        var $$text = '';
        (Cpu.sysFreq) = (hz);
        (Cpu.ticksPerUs) = ((Cpu.sysFreq) / 1000000);
        $$printf("SysFreq = ", (Cpu.sysFreq), " Cpu.ticksPerUs is: ", (Cpu.ticksPerUs), "\n");
        return $$text;
    }
    Cpu.pollen__uses__ = function() {
    }
    Cpu.$$privateInit = function() {
        Cpu.sysFreq = 1000000;
        Cpu.ticksPerUs = 0;
    }
    return Cpu;
}
var $$u = $$c();
$units['atmel.atmega.Cpu'] = $$u;
$units.push($$u);

