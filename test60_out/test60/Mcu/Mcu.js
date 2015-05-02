
/*
 * ======== COMPOSITION test60.Mcu ========
 */

var $$c = function() {
    const Mcu = {};
    Mcu.Mcu = Mcu
    Mcu.$name = 'test60.Mcu';
    Mcu.pollen$used = 0;
    Mcu.Cpu = $units['test60.Cpu'];
    Mcu.Uart = $units['test60.Uart'];
    Mcu.pollen__presets__ = function() {
        var $$text = '';
        ($units['test60.Cpu'].freq) = 6;
        $$printf("Mcu presetInit, Cpu.freq set to 6\n");
        return $$text;
    }
    Mcu.$$hostInit = function() {
        var $$text = '';
        $units['test60.Cpu'].setFreq(7);
        $$printf("Mcu hostInit, Cpu.freq set to ", $units['test60.Cpu'].getFreq(), "\n");
        return $$text;
    }
    return Mcu;
}
var $$u = $$c();
$units['test60.Mcu'] = $$u;
$units.push($$u);

