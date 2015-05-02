
/*
 * ======== MODULE test93.Mod1 ========
 */

var $$c = function() {
    const Mod1 = {};
    Mod1.Mod1 = Mod1
    Mod1.$name = 'test93.Mod1';
    Mod1.pollen$used = 0;
    Mod1.Text = $units['pollen.text.Text'];
    Mod1.PrintImpl = $units['test54.PrintImpl'];
    Mod1.test_strncmp = new $$Ref('test93_Mod1_test_strncmp__I');
    Mod1.test_strcmp = new $$Ref('test93_Mod1_test_strcmp__I');
    Mod1.test_strlen = new $$Ref('test93_Mod1_test_strlen__I');
    Mod1.pollen__run = new $$Ref('test93_Mod1_pollen__run__E');
    Mod1.targetInit = new $$Ref('test93_Mod1_targetInit__I');
    Mod1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Mod1.pollen__uses__ = function() {
        $$bind($units['pollen.text.Text'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Mod1.$$privateInit = function() {
        Mod1.s1 = "xxx1";
        Mod1.s2 = "xyz1";
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test93.Mod1'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Mod1;
}
var $$u = $$c();
$units['test93.Mod1'] = $$u;
$units.push($$u);

