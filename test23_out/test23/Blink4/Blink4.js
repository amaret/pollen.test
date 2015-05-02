
/*
 * ======== MODULE test23.Blink4 ========
 */

var $$c = function() {
    const Blink4 = {};
    Blink4.Blink4 = Blink4
    Blink4.$name = 'test23.Blink4';
    Blink4.pollen$used = 0;
    Blink4.Mcu = $units['atmel.atmega328.Mcu'];
    Blink4.PD0 = $units['atmel.atmega328.PD0'];
    Blink4.pollen__reset = new $$Ref('test23_Blink4_pollen__reset__E');
    Blink4.pollen__run = new $$Ref('test23_Blink4_pollen__run__E');
    Blink4.delaySome = new $$Ref('test23_Blink4_delaySome__I');
    Blink4.targetInit = new $$Ref('test23_Blink4_targetInit__I');
    Blink4.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink4.pollen__uses__ = function() {
        $$bind($units['atmel.atmega328.Mcu'], 'pollen$used', true);
        $$bind($units['atmel.atmega328.PD0'], 'pollen$used', true);
    }
    Blink4.$$privateInit = function() {
    }
    return Blink4;
}
var $$u = $$c();
$units['test23.Blink4'] = $$u;
$units.push($$u);

