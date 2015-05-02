
/*
 * ======== MODULE test36.Blink3 ========
 */

var $$c = function() {
    const Blink3 = {};
    Blink3.Blink3 = Blink3
    Blink3.$name = 'test36.Blink3';
    Blink3.pollen$used = 0;
    Blink3.pollen__reset = new $$Ref('test36_Blink3_pollen__reset__E');
    Blink3.pollen__shutdown = new $$Ref('test36_Blink3_pollen__shutdown__E');
    Blink3.pollen__run = new $$Ref('test36_Blink3_pollen__run__E');
    Blink3.targetInit = new $$Ref('test36_Blink3_targetInit__I');
    Blink3.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink3.pollen__uses__ = function() {
        $$bind($units['amaret.local.Mcu'], 'pollen$used', true);
        $$bind($units['amaret.local.A1'], 'pollen$used', true);
        $$bind($units['pollen.hardware.Led'], 'pollen$used', true);
    }
    Blink3.$$privateInit = function() {
    }
    return Blink3;
}
var $$u = $$c();
$units['test36.Blink3'] = $$u;
$units.push($$u);

