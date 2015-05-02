
/*
 * ======== MODULE test1.ModFix ========
 */

var $$c = function() {
    const ModFix = {};
    ModFix.ModFix = ModFix
    ModFix.$name = 'test1.ModFix';
    ModFix.pollen$used = 0;
    ModFix.foo = new $$Ref('test1_ModFix_foo__I');
    ModFix.markUsed = new $$Ref('test1_ModFix_markUsed__E');
    ModFix.targetInit = new $$Ref('test1_ModFix_targetInit__I');
    ModFix.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    ModFix.pollen__uses__ = function() {
    }
    ModFix.$$privateInit = function() {
    }
    return ModFix;
}
var $$u = $$c();
$units['test1.ModFix'] = $$u;
$units.push($$u);

