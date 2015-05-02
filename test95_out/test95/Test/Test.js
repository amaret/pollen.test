
/*
 * ======== MODULE test95.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test95.Test';
    Test.pollen$used = 0;
    Test.ArrMod = $units['test95.ArrMod'];
    Test.Arr = $units['test95.Arr'];
    Test.ArrCls = $units['test95.ArrCls'];
    Test.PrintImpl = $units['test54.PrintImpl'];
    Test.pollen__run = new $$Ref('test95_Test_pollen__run__E');
    Test.targetInit = new $$Ref('test95_Test_targetInit__I');
    Test.$$hostInit = function() {
        var $$text = '';
        Test.host_cls = new $units['test95.Arr'].Cls('test95_Test_host_cls__V'); Test.host_cls.new_host(/* ?? null expr ?? */);
        Test.cls = 0;
        Test.arr = new $$Array(8, function($$cn,$$idx){ return 0;}, 'test95_Test_arr__A', false);
        (Test.Test_i) = (Test.Test_i) / 3;
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test95.ArrMod'], 'pollen$used', true);
        $$bind($units['test95.Arr'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
        Test.Test_i = 4;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test95.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

        Test.arr = new $$Array(8, function($$cn,$$idx){ return 0;}, 'test95_Test_arr__A', false);
    }
    return Test;
}
var $$u = $$c();
$units['test95.Test'] = $$u;
$units.push($$u);

