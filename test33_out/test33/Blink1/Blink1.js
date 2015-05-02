
/*
 * ======== MODULE test33.Blink1 ========
 */

var $$c = function() {
    const Blink1 = {};
    Blink1.Blink1 = Blink1
    Blink1.$name = 'test33.Blink1';
    Blink1.pollen$used = 0;
    Blink1.Mcu = $units['amaret.local.Mcu'];
    Blink1.A1 = $units['amaret.local.A1'];
    Blink1.pollen__reset = new $$Ref('test33_Blink1_pollen__reset__E');
    Blink1.pollen__run = new $$Ref('test33_Blink1_pollen__run__E');
    Blink1.pollen__shutdown = new $$Ref('test33_Blink1_pollen__shutdown__E');
    Blink1.targetInit = new $$Ref('test33_Blink1_targetInit__I');
    Blink1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink1.pollen__uses__ = function() {
        $$bind($units['amaret.local.Mcu'], 'pollen$used', true);
        $$bind($units['amaret.local.A1'], 'pollen$used', true);
    }
    Blink1.$$privateInit = function() {
    }
    return Blink1;
}
var $$u = $$c();
$units['test33.Blink1'] = $$u;
$units.push($$u);

