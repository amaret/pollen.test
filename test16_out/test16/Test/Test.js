
/*
 * ======== MODULE test16.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test16.Test';
    Test.pollen$used = 0;
    Test.pollen__run = new $$Ref('test16_Test_pollen__run__E');
    Test.pollen__shutdown = new $$Ref('test16_Test_pollen__shutdown__E');
    Test.targetInit = new $$Ref('test16_Test_targetInit__I');
    Test.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test16.Mod'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
    }
    return Test;
}
var $$u = $$c();
$units['test16.Test'] = $$u;
$units.push($$u);

