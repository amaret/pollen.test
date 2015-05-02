
/*
 * ======== MODULE test64.TestFuncRefPass ========
 */

var $$c = function() {
    const TestFuncRefPass = {};
    TestFuncRefPass.TestFuncRefPass = TestFuncRefPass
    TestFuncRefPass.$name = 'test64.TestFuncRefPass';
    TestFuncRefPass.pollen$used = 0;
    TestFuncRefPass.FuncRefClass = $units['test64.FuncRefClass'];
    TestFuncRefPass.PrintImpl = $units['test61.PrintImpl'];
    TestFuncRefPass.pollen__run = new $$Ref('test64_TestFuncRefPass_pollen__run__E');
    TestFuncRefPass.foo = new $$Ref('test64_TestFuncRefPass_foo__I');
    TestFuncRefPass.pollen__shutdown = new $$Ref('test64_TestFuncRefPass_pollen__shutdown__E');
    TestFuncRefPass.targetInit = new $$Ref('test64_TestFuncRefPass_targetInit__I');
    TestFuncRefPass.$$hostInit = function() {
        var $$text = '';
        TestFuncRefPass.f = new $units['test64.FuncRefClass'].FuncRefClass('test64_TestFuncRefPass_f__V'); TestFuncRefPass.f.new_host((TestFuncRefPass.foo));
        return $$text;
    }
    TestFuncRefPass.pollen__uses__ = function() {
        $$bind($units['test64.FuncRefClass'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    TestFuncRefPass.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test64.TestFuncRefPass'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return TestFuncRefPass;
}
var $$u = $$c();
$units['test64.TestFuncRefPass'] = $$u;
$units.push($$u);

