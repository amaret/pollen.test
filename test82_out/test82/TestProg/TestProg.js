
/*
 * ======== MODULE test82.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test82.TestProg';
    TestProg.pollen$used = 0;
    TestProg.ArrayReturnErr = $units['test82.ArrayReturnErr'];
    TestProg.PrintImpl = $units['test61.PrintImpl'];
    TestProg.pollen__run = new $$Ref('test82_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test82_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test82.ArrayReturnErr'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test82.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return TestProg;
}
var $$u = $$c();
$units['test82.TestProg'] = $$u;
$units.push($$u);

