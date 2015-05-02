
/*
 * ======== MODULE test62.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test62.Test';
    Test.pollen$used = 0;
    Test.ArrMod = $units['test62.ArrMod'];
    Test.ArrHostDim = $units['test62.ArrHostDim'];
    Test.ArrCls = $units['test62.ArrCls'];
    Test.PrintImpl = $units['test61.PrintImpl'];
    Test.pollen__run = new $$Ref('test62_Test_pollen__run__E');
    Test.targetInit = new $$Ref('test62_Test_targetInit__I');
    Test.$$hostInit = function() {
        var $$text = '';
        Test.ac = new $units['test62.ArrCls'].ArrCls('test62_Test_ac__V'); Test.ac.new_host();
        Test.cls = new $units['test62.ArrHostDim'].ClsHostDim('test62_Test_cls__V'); Test.cls.new_host();
        $units['test62.ArrMod'].sizes();
        $units['test62.ArrHostDim'].sizes();
        Test.cls.sizes();
        $units['test62.ArrHostDim'].sizes();
        Test.ac.sizes();
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test62.ArrMod'], 'pollen$used', true);
        $$bind($units['test62.ArrCls'], 'pollen$used', true);
        $$bind($units['test62.ArrHostDim'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test62.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return Test;
}
var $$u = $$c();
$units['test62.Test'] = $$u;
$units.push($$u);

