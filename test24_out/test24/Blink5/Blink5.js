
/*
 * ======== MODULE test24.Blink5 ========
 */

var $$c = function() {
    const Blink5 = {};
    Blink5.Blink5 = Blink5
    Blink5.$name = 'test24.Blink5';
    Blink5.pollen$used = 0;
    Blink5.Mcu = $units['atmel.atmega328.Mcu'];
    Blink5.PD0 = $units['atmel.atmega328.PD0'];
    Blink5.pollen__reset = new $$Ref('test24_Blink5_pollen__reset__E');
    Blink5.pollen__run = new $$Ref('test24_Blink5_pollen__run__E');
    Blink5.delaySome = new $$Ref('test24_Blink5_delaySome__I');
    Blink5.targetInit = new $$Ref('test24_Blink5_targetInit__I');
    Blink5.$$hostInit = function() {
        var $$text = '';
        var $$v = 'atmel_atmega328_PD0';
        var $$s = $$bind($units['test24.Blink5'], 'pin', $$v);{ $$v.pollen$used = true;
        $units['atmel.atmega328.PD0'].pollen$used = true;}


        return $$text;
    }
    Blink5.pollen__uses__ = function() {
        $$bind($units['atmel.atmega328.Mcu'], 'pollen$used', true);
        $$bind($units['atmel.atmega328.PD0'], 'pollen$used', true);
    }
    Blink5.$$privateInit = function() {
        Blink5.pin = 0;
    }
    return Blink5;
}
var $$u = $$c();
$units['test24.Blink5'] = $$u;
$units.push($$u);

