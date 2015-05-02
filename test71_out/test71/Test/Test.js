
/*
 * ======== MODULE test71.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test71.Test';
    Test.pollen$used = 0;
    Test.Dispatcher = $units['test71.Dispatcher'];
    Test.PrintImpl = $units['test61.PrintImpl'];
    Test.pollen__run = new $$Ref('test71_Test_pollen__run__E');
    Test.pollen__shutdown = new $$Ref('test71_Test_pollen__shutdown__E');
    Test.targetInit = new $$Ref('test71_Test_targetInit__I');
    Test.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test71.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return Test;
}
var $$u = $$c();
$units['test71.Test'] = $$u;
$units.push($$u);

