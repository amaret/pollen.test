
/*
 * ======== MODULE test76.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test76.Test';
    Test.pollen$used = 0;
    Test.ArrNoDim = $units['test76.ArrNoDim'];
    Test.FcnArrParm = $units['test76.FcnArrParm'];
    Test.PrintImpl = $units['test54.PrintImpl'];
    Test.pollen__run = new $$Ref('test76_Test_pollen__run__E');
    Test.targetInit = new $$Ref('test76_Test_targetInit__I');
    Test.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test76.ArrNoDim'], 'pollen$used', true);
        $$bind($units['test76.FcnArrParm'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test76.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test;
}
var $$u = $$c();
$units['test76.Test'] = $$u;
$units.push($$u);

