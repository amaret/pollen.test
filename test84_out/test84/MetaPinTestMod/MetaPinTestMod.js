
/*
 * ======== MODULE test84.MetaPinTestMod ========
 */

var $$c = function() {
    const MetaPinTestMod = {};
    MetaPinTestMod.MetaPinTestMod = MetaPinTestMod
    MetaPinTestMod.$name = 'test84.MetaPinTestMod';
    MetaPinTestMod.pollen$used = 0;
    MetaPinTestMod.MPT1 = $units['test84.MPT1'];
    MetaPinTestMod.MPT2 = $units['test84.MPT2'];
    MetaPinTestMod.PrintImpl = $units['test61.PrintImpl'];
    MetaPinTestMod.pollen__run = new $$Ref('test84_MetaPinTestMod_pollen__run__E');
    MetaPinTestMod.pollen__shutdown = new $$Ref('test84_MetaPinTestMod_pollen__shutdown__E');
    MetaPinTestMod.targetInit = new $$Ref('test84_MetaPinTestMod_targetInit__I');
    MetaPinTestMod.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    MetaPinTestMod.pollen__uses__ = function() {
        $$bind($units['test84.MPT1'], 'pollen$used', true);
        $$bind($units['test84.MPT2'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    MetaPinTestMod.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test84.MetaPinTestMod'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return MetaPinTestMod;
}
var $$u = $$c();
$units['test84.MetaPinTestMod'] = $$u;
$units.push($$u);

