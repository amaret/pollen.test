
/*
 * ======== MODULE test22.Blink3 ========
 */

var $$c = function() {
    const Blink3 = {};
    Blink3.Blink3 = Blink3
    Blink3.$name = 'test22.Blink3';
    Blink3.pollen$used = 0;
    Blink3.pollen__reset = new $$Ref('test22_Blink3_pollen__reset__E');
    Blink3.pollen__run = new $$Ref('test22_Blink3_pollen__run__E');
    Blink3.delaySome = new $$Ref('test22_Blink3_delaySome__I');
    Blink3.targetInit = new $$Ref('test22_Blink3_targetInit__I');
    Blink3.$$hostInit = function() {
        var $$text = '';
        var $$v = 'atmel_atmega328_PD0';
        var $$s = $$bind($units['test22.Blink3'], 'pin', $$v);{ $$v.pollen$used = true;
        $units['atmel.atmega328.PD0'].pollen$used = true;}


        return $$text;
    }
    Blink3.pollen__uses__ = function() {
        $$bind($units['atmel.atmega328.Mcu'], 'pollen$used', true);
        $$bind($units['atmel.atmega328.PD0'], 'pollen$used', true);
    }
    Blink3.$$privateInit = function() {
        Blink3.pin = 0;
    }
    return Blink3;
}
var $$u = $$c();
$units['test22.Blink3'] = $$u;
$units.push($$u);

