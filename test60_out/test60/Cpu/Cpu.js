
/*
 * ======== MODULE test60.Cpu ========
 */

var $$c = function() {
    const Cpu = {};
    Cpu.Cpu = Cpu
    Cpu.$name = 'test60.Cpu';
    Cpu.pollen$used = 0;
    Cpu.targetInit = new $$Ref('test60_Cpu_targetInit__I');
    Cpu.getFreq = function() {
        var $$text = '';
        return(  (Cpu.freq)  );
        return $$text;
    }
    Cpu.setFreq = function( f ) {
        var $$text = '';
        ;
        return $$text;
    }
    Cpu.$$hostInit = function() {
        var $$text = '';
        $$printf("Cpu hostInit: freq ", (Cpu.freq), "\n");
        return $$text;
    }
    Cpu.pollen__uses__ = function() {
    }
    Cpu.$$privateInit = function() {
        Cpu.freq = 0;
    }
    return Cpu;
}
var $$u = $$c();
$units['test60.Cpu'] = $$u;
$units.push($$u);

