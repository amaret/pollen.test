
/*
 * ======== MODULE test53.Mod1 ========
 */

var $$c = function() {
    const Mod1 = {};
    Mod1.Mod1 = Mod1
    Mod1.$name = 'test53.Mod1';
    Mod1.pollen$used = 0;
    Mod1.foo = new $$Ref('test53_Mod1_foo__E');
    Mod1.targetInit = new $$Ref('test53_Mod1_targetInit__I');
    Mod1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Mod1.pollen__uses__ = function() {
    }
    Mod1.$$privateInit = function() {
    }
    return Mod1;
}
var $$u = $$c();
$units['test53.Mod1'] = $$u;
$units.push($$u);

