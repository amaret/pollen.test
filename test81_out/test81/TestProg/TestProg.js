
/*
 * ======== MODULE test81.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test81.TestProg';
    TestProg.pollen$used = 0;
    TestProg.ArrayReturn = $units['test81.ArrayReturn'];
    TestProg.PrintImpl = $units['test61.PrintImpl'];
    TestProg.pollen__run = new $$Ref('test81_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test81_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test81.ArrayReturn'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test81.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return TestProg;
}
var $$u = $$c();
$units['test81.TestProg'] = $$u;
$units.push($$u);

