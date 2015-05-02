
/*
 * ======== MODULE test21.Blink2 ========
 */

var $$c = function() {
    const Blink2 = {};
    Blink2.Blink2 = Blink2
    Blink2.$name = 'test21.Blink2';
    Blink2.pollen$used = 0;
    Blink2.pollen__reset = new $$Ref('test21_Blink2_pollen__reset__E');
    Blink2.pollen__run = new $$Ref('test21_Blink2_pollen__run__E');
    Blink2.delaySome = new $$Ref('test21_Blink2_delaySome__I');
    Blink2.targetInit = new $$Ref('test21_Blink2_targetInit__I');
    Blink2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink2.pollen__uses__ = function() {
        $$bind($units['atmel.atmega328.Mcu'], 'pollen$used', true);
        $$bind($units['atmel.atmega328.PB5'], 'pollen$used', true);
    }
    Blink2.$$privateInit = function() {
    }
    return Blink2;
}
var $$u = $$c();
$units['test21.Blink2'] = $$u;
$units.push($$u);

