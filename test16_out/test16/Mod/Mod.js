
/*
 * ======== MODULE test16.Mod ========
 */

var $$c = function() {
    const Mod = {};
    Mod.Mod = Mod
    Mod.$name = 'test16.Mod';
    Mod.pollen$used = 0;
    Mod.foo = new $$Ref('test16_Mod_foo__I');
    Mod.bar = new $$Ref('test16_Mod_bar__I');
    Mod.targetInit = new $$Ref('test16_Mod_targetInit__I');
    Mod.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Mod.pollen__uses__ = function() {
    }
    Mod.$$privateInit = function() {
    }
    return Mod;
}
var $$u = $$c();
$units['test16.Mod'] = $$u;
$units.push($$u);

