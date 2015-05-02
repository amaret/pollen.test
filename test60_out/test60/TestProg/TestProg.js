
/*
 * ======== MODULE test60.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test60.TestProg';
    TestProg.pollen$used = 0;
    TestProg.PrintImpl = $units['test60.PrintImpl'];
    TestProg.pollen__run = new $$Ref('test60_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test60_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        var ss = null;
        (TestProg.test_freq) = $units['test60.Cpu'].getFreq();
        
        if ((TestProg.test_freq) == 6) {
            (ss) = "PASS";
        }
        else {
            (ss) = "FAIL";
        }
        $$printf("TestProg hostInit: ", (ss), "\n");
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test60.Cpu'], 'pollen$used', true);
        $$bind($units['test60.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.test_freq = 0;
var $$v = 'test60_PrintImpl';
        var $$s = $$bind($units['test60.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test60.PrintImpl'].pollen$used = true;}

    }
    return TestProg;
}
var $$u = $$c();
$units['test60.TestProg'] = $$u;
$units.push($$u);

