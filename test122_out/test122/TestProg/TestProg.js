
/*
 * ======== MODULE test122.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test122.TestProg';
    TestProg.pollen$used = 0;
    TestProg.SleepWakeImpl = $units['test122.SleepWakeImpl'];
    TestProg.DynMemImpl = $units['test122.DynMemImpl'];
    TestProg.Module1 = $units['test122.Module1'];
    TestProg.PrintImpl = $units['test54.PrintImpl'];
    TestProg.bar = new $$Ref('test122_TestProg_bar__I');
    TestProg.pollen__run = new $$Ref('test122_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test122_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        var $$v = 'test122_SleepWakeImpl';
        var $$s = $$bind($units['test122.TestProg'], 'pollenSleepWakeProxy', $$v);{ $$v.pollen$used = true;
        $units['test122.SleepWakeImpl'].pollen$used = true;}


        var $$v = 'test122_DynMemImpl';
        var $$s = $$bind($units['test122.TestProg'], 'pollenDynamicMemoryProxy', $$v);{ $$v.pollen$used = true;
        $units['test122.DynMemImpl'].pollen$used = true;}


        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test122.SleepWakeImpl'], 'pollen$used', true);
        $$bind($units['test122.DynMemImpl'], 'pollen$used', true);
        $$bind($units['test122.Module1'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
var $$v = 'test122_Module1';
        var $$s = $$bind($units['test122.TestProg'], 'proto1', $$v);{ $$v.pollen$used = true;
        $units['test122.Module1'].pollen$used = true;}

var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test122.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

        TestProg.pollenSleepWakeProxy = 0;
        TestProg.pollenDynamicMemoryProxy = 0;
    }
    return TestProg;
}
var $$u = $$c();
$units['test122.TestProg'] = $$u;
$units.push($$u);

