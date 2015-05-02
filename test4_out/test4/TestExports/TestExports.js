
/*
 * ======== MODULE test4.TestExports ========
 */

var $$c = function() {
    const TestExports = {};
    TestExports.TestExports = TestExports
    TestExports.$name = 'test4.TestExports';
    TestExports.pollen$used = 0;
    TestExports.foo = new $$Ref('test4_TestExports_foo__I');
    TestExports.pollen__run = new $$Ref('test4_TestExports_pollen__run__E');
    TestExports.enable = new $$Ref('test4_TestExports_enable__I');
    TestExports.targetInit = new $$Ref('test4_TestExports_targetInit__I');
    TestExports.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TestExports.pollen__uses__ = function() {
        $$bind($units['test4.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['test4.OtherInterrupts'], 'pollen$used', true);
        $$bind($units['test4.Core'], 'pollen$used', true);
    }
    TestExports.$$privateInit = function() {
    }
    return TestExports;
}
var $$u = $$c();
$units['test4.TestExports'] = $$u;
$units.push($$u);

