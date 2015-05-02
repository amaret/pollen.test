
/*
 * ======== MODULE test73.Test_16 ========
 */

var $$c = function() {
    const Test_16 = {};
    Test_16.Test_16 = Test_16
    Test_16.$name = 'test73.Test_16';
    Test_16.pollen$used = 0;
    Test_16.Event = $units['pollen.event.Event'];
    Test_16.pollen__run = new $$Ref('test73_Test_16_pollen__run__E');
    Test_16.tick1 = new $$Ref('test73_Test_16_tick1__I');
    Test_16.tick2 = new $$Ref('test73_Test_16_tick2__I');
    Test_16.pollen__shutdown = new $$Ref('test73_Test_16_pollen__shutdown__E');
    Test_16.targetInit = new $$Ref('test73_Test_16_targetInit__I');
    Test_16.$$hostInit = function() {
        var $$text = '';
        Test_16.e1 = new $units['pollen.event.Event'].Event('test73_Test_16_e1__V');
        Test_16.e2 = new $units['pollen.event.Event'].Event('test73_Test_16_e2__V');
        (Test_16.e1) = new $units['pollen.event.Event'].Event().new_host((Test_16.tick1));
        (Test_16.e2) = new $units['pollen.event.Event'].Event().new_host((Test_16.tick2));
        return $$text;
    }
    Test_16.pollen__uses__ = function() {
        $$bind($units['virtual.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
    }
    Test_16.$$privateInit = function() {
    }
    return Test_16;
}
var $$u = $$c();
$units['test73.Test_16'] = $$u;
$units.push($$u);

