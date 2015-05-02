
/*
 * ======== MODULE test42.TestMod ========
 */

var $$c = function() {
    const TestMod = {};
    TestMod.TestMod = TestMod
    TestMod.$name = 'test42.TestMod';
    TestMod.pollen$used = 0;
    TestMod.test = new $$Ref('test42_TestMod_test__E');
    TestMod.targetInit = new $$Ref('test42_TestMod_targetInit__I');
    TestMod.testOnHost = function() {
        var $$text = '';
        return $$text;
    }
    TestMod.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TestMod.pollen__uses__ = function() {
    }
    TestMod.$$privateInit = function() {
    }
    return TestMod;
}
var $$u = $$c();
$units['test42.TestMod'] = $$u;
$units.push($$u);

