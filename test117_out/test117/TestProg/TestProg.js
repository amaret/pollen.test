
/*
 * ======== MODULE test117.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test117.TestProg';
    TestProg.pollen$used = 0;
    TestProg.ArrayReturn = $units['test117.ArrayReturn'];
    TestProg.PrintImpl = $units['test54.PrintImpl'];
    TestProg.pollen__run = new $$Ref('test117_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test117_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test117.ArrayReturn'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test117.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return TestProg;
}
var $$u = $$c();
$units['test117.TestProg'] = $$u;
$units.push($$u);

