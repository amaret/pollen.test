
/*
 * ======== MODULE test120.Mod ========
 */

var $$c = function() {
    const Mod = {};
    Mod.Mod = Mod
    Mod.$name = 'test120.Mod';
    Mod.pollen$used = 0;
    Mod.PrintImpl = $units['test54.PrintImpl'];
    Mod.foo = new $$Ref('test120_Mod_foo__I');
    Mod.bar = new $$Ref('test120_Mod_bar__I');
    Mod.targetInit = new $$Ref('test120_Mod_targetInit__I');
    Mod.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Mod.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Mod.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test120.Mod'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Mod;
}
var $$u = $$c();
$units['test120.Mod'] = $$u;
$units.push($$u);

