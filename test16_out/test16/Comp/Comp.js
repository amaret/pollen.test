
/*
 * ======== COMPOSITION test16.Comp ========
 */

var $$c = function() {
    const Comp = {};
    Comp.Comp = Comp
    Comp.$name = 'test16.Comp';
    Comp.pollen$used = 0;
    Comp.Mod = $units['test16.Mod'];
    return Comp;
}
var $$u = $$c();
$units['test16.Comp'] = $$u;
$units.push($$u);

