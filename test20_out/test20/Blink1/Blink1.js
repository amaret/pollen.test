
/*
 * ======== MODULE test20.Blink1 ========
 */

var $$c = function() {
    const Blink1 = {};
    Blink1.Blink1 = Blink1
    Blink1.$name = 'test20.Blink1';
    Blink1.pollen$used = 0;
    Blink1.Pin = $units['atmel.atmega328.PD0'];
    Blink1.pollen__reset = new $$Ref('test20_Blink1_pollen__reset__E');
    Blink1.pollen__run = new $$Ref('test20_Blink1_pollen__run__E');
    Blink1.delaySome = new $$Ref('test20_Blink1_delaySome__I');
    Blink1.targetInit = new $$Ref('test20_Blink1_targetInit__I');
    Blink1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink1.pollen__uses__ = function() {
        $$bind($units['atmel.atmega328.PD0'], 'pollen$used', true);
    }
    Blink1.$$privateInit = function() {
    }
    return Blink1;
}
var $$u = $$c();
$units['test20.Blink1'] = $$u;
$units.push($$u);

