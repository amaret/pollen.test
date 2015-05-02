
/*
 * ======== MODULE test121.Test_01 ========
 */

var $$c = function() {
    const Test_01 = {};
    Test_01.Test_01 = Test_01
    Test_01.$name = 'test121.Test_01';
    Test_01.pollen$used = 0;
    Test_01.PrintImpl = $units['test54.PrintImpl'];
    Test_01.pollen__ready = new $$Ref('test121_Test_01_pollen__ready__E');
    Test_01.pollen__run = new $$Ref('test121_Test_01_pollen__run__E');
    Test_01.targetInit = new $$Ref('test121_Test_01_targetInit__I');
    Test_01.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test_01.pollen__uses__ = function() {
        $$bind($units['atmel.atmega.Cpu'], 'pollen$used', true);
        $$bind($units['atmel.atmega.PB4'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_01.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test121.Test_01'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_01;
}
var $$u = $$c();
$units['test121.Test_01'] = $$u;
$units.push($$u);

