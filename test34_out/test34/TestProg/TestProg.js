
/*
 * ======== MODULE test34.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test34.TestProg';
    TestProg.pollen$used = 0;
    TestProg.pollen__run = new $$Ref('test34_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test34_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test34.TestMod'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
    }
    return TestProg;
}
var $$u = $$c();
$units['test34.TestProg'] = $$u;
$units.push($$u);

