
/*
 * ======== MODULE test75.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test75.Test';
    Test.pollen$used = 0;
    Test.TestFcnRtn = $units['test75.TestFcnRtn'];
    Test.PrintImpl = $units['test54.PrintImpl'];
    Test.pollen__run = new $$Ref('test75_Test_pollen__run__E');
    Test.targetInit = new $$Ref('test75_Test_targetInit__I');
    Test.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test75.TestFcnRtn'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test75.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test;
}
var $$u = $$c();
$units['test75.Test'] = $$u;
$units.push($$u);

