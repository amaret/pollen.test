
/*
 * ======== MODULE test94.Mod1 ========
 */

var $$c = function() {
    const Mod1 = {};
    Mod1.Mod1 = Mod1
    Mod1.$name = 'test94.Mod1';
    Mod1.pollen$used = 0;
    Mod1.PrintImpl = $units['test54.PrintImpl'];
    Mod1.pollen__run = new $$Ref('test94_Mod1_pollen__run__E');
    Mod1.targetInit = new $$Ref('test94_Mod1_targetInit__I');
    Mod1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Mod1.pollen__uses__ = function() {
        $$bind($units['pollen.math.Absolute'], 'pollen$used', true);
        $$bind($units['pollen.math.FloorCeil'], 'pollen$used', true);
        $$bind($units['pollen.math.Random8'], 'pollen$used', true);
        $$bind($units['pollen.math.Random16'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Mod1.$$privateInit = function() {
        Mod1.i8 = -1;
        Mod1.i16 = 3;
        Mod1.i32 = -9999;
        Mod1.f1 = 1.3;
        Mod1.f2 = 0.0;
        Mod1.f3 = 123e4;
        Mod1.f4 = -7.5;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test94.Mod1'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Mod1;
}
var $$u = $$c();
$units['test94.Mod1'] = $$u;
$units.push($$u);

