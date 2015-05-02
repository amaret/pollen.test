
/*
 * ======== MODULE test66.Test_08 ========
 */

var $$c = function() {
    const Test_08 = {};
    Test_08.Test_08 = Test_08
    Test_08.$name = 'test66.Test_08';
    Test_08.pollen$used = 0;
    Test_08.HandlerQueue = $units['pollen.data.HandlerQueue'];
    Test_08.Console = $units['virtual.mcu.ConsolePrint'];
    Test_08.PrintImpl = $units['test54.PrintImpl'];
    Test_08.pollen__run = new $$Ref('test66_Test_08_pollen__run__E');
    Test_08.tick1 = new $$Ref('test66_Test_08_tick1__I');
    Test_08.tick2 = new $$Ref('test66_Test_08_tick2__I');
    Test_08.tick3 = new $$Ref('test66_Test_08_tick3__I');
    Test_08.tick4 = new $$Ref('test66_Test_08_tick4__I');
    Test_08.tick5 = new $$Ref('test66_Test_08_tick5__I');
    Test_08.pollen__shutdown = new $$Ref('test66_Test_08_pollen__shutdown__E');
    Test_08.targetInit = new $$Ref('test66_Test_08_targetInit__I');
    Test_08.$$hostInit = function() {
        var $$text = '';
        Test_08.handlers = new $units['pollen.data.HandlerQueue'].HandlerQueue('test66_Test_08_handlers__V'); Test_08.handlers.new_host(5);
        return $$text;
    }
    Test_08.pollen__uses__ = function() {
        $$bind($units['pollen.data.HandlerQueue'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_08.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test66.Test_08'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_08;
}
var $$u = $$c();
$units['test66.Test_08'] = $$u;
$units.push($$u);

