
/*
 * ======== MODULE test90.Test_03 ========
 */

var $$c = function() {
    const Test_03 = {};
    Test_03.Test_03 = Test_03
    Test_03.$name = 'test90.Test_03';
    Test_03.pollen$used = 0;
    Test_03.Timer = $units['pollen.time.Timer'];
    Test_03.PrintImpl = $units['test54.PrintImpl'];
    Test_03.tick = new $$Ref('test90_Test_03_tick__I');
    Test_03.pollen__run = new $$Ref('test90_Test_03_pollen__run__E');
    Test_03.targetInit = new $$Ref('test90_Test_03_targetInit__I');
    Test_03.$$hostInit = function() {
        var $$text = '';
        Test_03.t1 = new $units['pollen.time.Timer'].Timer('test90_Test_03_t1__V'); Test_03.t1.new_host((Test_03.tick));
        return $$text;
    }
    Test_03.pollen__uses__ = function() {
        $$bind($units['local.mcu.Cpu'], 'pollen$used', true);
        $$bind($units['local.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['local.mcu.TimerMilli'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin0'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin1'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin2'], 'pollen$used', true);
        $$bind($units['local.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['local.parts.ColorLed'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led0'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led1'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led2'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
        $$bind($units['localhost.Lifecycle'], 'pollen$used', true);
        $$bind($units['pollen.time.Timer'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_03.$$privateInit = function() {
        Test_03.count = 0;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test90.Test_03'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_03;
}
var $$u = $$c();
$units['test90.Test_03'] = $$u;
$units.push($$u);

