
/*
 * ======== MODULE test75.TestFcnRtn ========
 */

var $$c = function() {
    const TestFcnRtn = {};
    TestFcnRtn.TestFcnRtn = TestFcnRtn
    TestFcnRtn.$name = 'test75.TestFcnRtn';
    TestFcnRtn.pollen$used = 0;
    TestFcnRtn.Cls1 = $units['test75.Cls1'];
    TestFcnRtn.foo = new $$Ref('test75_TestFcnRtn_foo__E');
    TestFcnRtn.targetInit = new $$Ref('test75_TestFcnRtn_targetInit__I');
    TestFcnRtn.$$hostInit = function() {
        var $$text = '';
        TestFcnRtn.c1 = new $units['test75.Cls1'].Cls1('test75_TestFcnRtn_c1__V'); TestFcnRtn.c1.new_host();
        TestFcnRtn.c2 = 0;
        return $$text;
    }
    TestFcnRtn.pollen__uses__ = function() {
        $$bind($units['test75.Cls1'], 'pollen$used', true);
    }
    TestFcnRtn.$$privateInit = function() {
        TestFcnRtn.r1 = 0;
        TestFcnRtn.r2 = true;
    }
    return TestFcnRtn;
}
var $$u = $$c();
$units['test75.TestFcnRtn'] = $$u;
$units.push($$u);

