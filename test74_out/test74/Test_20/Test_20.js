
/*
 * ======== MODULE test74.Test_20 ========
 */

var $$c = function() {
    const Test_20 = {};
    Test_20.Test_20 = Test_20
    Test_20.$name = 'test74.Test_20';
    Test_20.pollen$used = 0;
    Test_20.TestClass = $units['test.virtual.TestClass'];
    Test_20.testHandler = new $$Ref('test74_Test_20_testHandler__I');
    Test_20.pollen__run = new $$Ref('test74_Test_20_pollen__run__E');
    Test_20.pollen__shutdown = new $$Ref('test74_Test_20_pollen__shutdown__E');
    Test_20.targetInit = new $$Ref('test74_Test_20_targetInit__I');
    Test_20.$$hostInit = function() {
        var $$text = '';
        Test_20.tc = new $units['test.virtual.TestClass'].TestClass('test74_Test_20_tc__V'); Test_20.tc.new_host((Test_20.testHandler));
        return $$text;
    }
    Test_20.pollen__uses__ = function() {
        $$bind($units['virtual.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['test.virtual.TestClass'], 'pollen$used', true);
    }
    Test_20.$$privateInit = function() {
    }
    return Test_20;
}
var $$u = $$c();
$units['test74.Test_20'] = $$u;
$units.push($$u);

