
/*
 * ======== MODULE test34.TestMod ========
 */

var $$c = function() {
    const TestMod = {};
    TestMod.TestMod = TestMod
    TestMod.$name = 'test34.TestMod';
    TestMod.pollen$used = 0;
    TestMod.test = new $$Ref('test34_TestMod_test__E');
    TestMod.targetInit = new $$Ref('test34_TestMod_targetInit__I');
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
$units['test34.TestMod'] = $$u;
$units.push($$u);

