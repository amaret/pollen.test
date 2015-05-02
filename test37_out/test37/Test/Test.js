
/*
 * ======== MODULE test37.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test37.Test';
    Test.pollen$used = 0;
    Test.Mod = $units['test37.Mod'];
    Test.targetInit = new $$Ref('test37_Test_targetInit__I');
    Test.pollen__run = new $$Ref('test37_Test_pollen__run__E');
    Test.pollen__shutdown = new $$Ref('test37_Test_pollen__shutdown__E');
    Test.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test37.Mod'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
    }
    return Test;
}
var $$u = $$c();
$units['test37.Test'] = $$u;
$units.push($$u);

