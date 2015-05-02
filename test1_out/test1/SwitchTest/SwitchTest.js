
/*
 * ======== MODULE test1.SwitchTest ========
 */

var $$c = function() {
    const SwitchTest = {};
    SwitchTest.SwitchTest = SwitchTest
    SwitchTest.$name = 'test1.SwitchTest';
    SwitchTest.pollen$used = 0;
    SwitchTest.State_UNINITIALIZED = 0;
    SwitchTest.State_INITIALIZATION = 1;
    SwitchTest.State_ACTIVE = 2;
    SwitchTest.State_IDLE = 3;
    SwitchTest.State_ERROR = 4;
    SwitchTest.switch_test = new $$Ref('test1_SwitchTest_switch_test__E');
    SwitchTest.targetInit = new $$Ref('test1_SwitchTest_targetInit__I');
    SwitchTest.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    SwitchTest.pollen__uses__ = function() {
    }
    SwitchTest.$$privateInit = function() {
    }
    return SwitchTest;
}
var $$u = $$c();
$units['test1.SwitchTest'] = $$u;
$units.push($$u);

