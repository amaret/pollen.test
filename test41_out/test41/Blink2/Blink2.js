
/*
 * ======== MODULE test41.Blink2 ========
 */

var $$c = function() {
    const Blink2 = {};
    Blink2.Blink2 = Blink2
    Blink2.$name = 'test41.Blink2';
    Blink2.pollen$used = 0;
    Blink2.Led = $units['pollen.hardware.Led'];
    Blink2.pollen__reset = new $$Ref('test41_Blink2_pollen__reset__E');
    Blink2.pollen__shutdown = new $$Ref('test41_Blink2_pollen__shutdown__E');
    Blink2.pollen__run = new $$Ref('test41_Blink2_pollen__run__E');
    Blink2.targetInit = new $$Ref('test41_Blink2_targetInit__I');
    Blink2.$$hostInit = function() {
        var $$text = '';
        var $$v = 'amaret_local_A1';
        var $$s = $$bind($units['test41.Blink2'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['amaret.local.A1'].pollen$used = true;}


        return $$text;
    }
    Blink2.pollen__uses__ = function() {
        $$bind($units['amaret.local.Mcu'], 'pollen$used', true);
        $$bind($units['amaret.local.A1'], 'pollen$used', true);
        $$bind($units['pollen.hardware.Led'], 'pollen$used', true);
    }
    Blink2.$$privateInit = function() {
    }
    return Blink2;
}
var $$u = $$c();
$units['test41.Blink2'] = $$u;
$units.push($$u);

