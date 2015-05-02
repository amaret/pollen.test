
/*
 * ======== MODULE test72.Test_13 ========
 */

var $$c = function() {
    const Test_13 = {};
    Test_13.Test_13 = Test_13
    Test_13.$name = 'test72.Test_13';
    Test_13.pollen$used = 0;
    Test_13.Event = $units['pollen.event.Event'];
    Test_13.PrintImpl = $units['test54.PrintImpl'];
    Test_13.pollen__run = new $$Ref('test72_Test_13_pollen__run__E');
    Test_13.pollen__shutdown = new $$Ref('test72_Test_13_pollen__shutdown__E');
    Test_13.tick = new $$Ref('test72_Test_13_tick__I');
    Test_13.targetInit = new $$Ref('test72_Test_13_targetInit__I');
    Test_13.$$hostInit = function() {
        var $$text = '';
        Test_13.e = new $units['pollen.event.Event'].Event('test72_Test_13_e__V'); Test_13.e.new_host((Test_13.tick));
        return $$text;
    }
    Test_13.pollen__uses__ = function() {
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['pollen.event.Dispatcher'], 'pollen$used', true);
        $$bind($units['virtual.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_13.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test72.Test_13'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_13;
}
var $$u = $$c();
$units['test72.Test_13'] = $$u;
$units.push($$u);

