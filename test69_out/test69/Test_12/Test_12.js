
/*
 * ======== MODULE test69.Test_12 ========
 */

var $$c = function() {
    const Test_12 = {};
    Test_12.Test_12 = Test_12
    Test_12.$name = 'test69.Test_12';
    Test_12.pollen$used = 0;
    Test_12.Events = $units['pollen.event.Events'];
    Test_12.CP = $units['virtual.mcu.ConsolePrint'];
    Test_12.PrintImpl = $units['test54.PrintImpl'];
    Test_12.pollen__run = new $$Ref('test69_Test_12_pollen__run__E');
    Test_12.tick = new $$Ref('test69_Test_12_tick__I');
    Test_12.pollen__shutdown = new $$Ref('test69_Test_12_pollen__shutdown__E');
    Test_12.targetInit = new $$Ref('test69_Test_12_targetInit__I');
    Test_12.$$hostInit = function() {
        var $$text = '';
        Test_12.e = new $units['pollen.event.Events'].Event('test69_Test_12_e__V');
        (Test_12.e) = new $units['pollen.event.Events'].Event().new_host((Test_12.tick));
        return $$text;
    }
    Test_12.pollen__uses__ = function() {
        $$bind($units['pollen.event.Events'], 'pollen$used', true);
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_12.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test69.Test_12'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_12;
}
var $$u = $$c();
$units['test69.Test_12'] = $$u;
$units.push($$u);

