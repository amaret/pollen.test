
/*
 * ======== MODULE test77.Test_21 ========
 */

var $$c = function() {
    const Test_21 = {};
    Test_21.Test_21 = Test_21
    Test_21.$name = 'test77.Test_21';
    Test_21.pollen$used = 0;
    Test_21.Timer = $units['pollen.time.Timer'];
    Test_21.tick1 = new $$Ref('test77_Test_21_tick1__I');
    Test_21.tick2 = new $$Ref('test77_Test_21_tick2__I');
    Test_21.tick3 = new $$Ref('test77_Test_21_tick3__I');
    Test_21.pollen__run = new $$Ref('test77_Test_21_pollen__run__E');
    Test_21.pollen__shutdown = new $$Ref('test77_Test_21_pollen__shutdown__E');
    Test_21.targetInit = new $$Ref('test77_Test_21_targetInit__I');
    Test_21.$$hostInit = function() {
        var $$text = '';
        Test_21.t1 = new $units['pollen.time.Timer'].Timer('test77_Test_21_t1__V'); Test_21.t1.new_host((Test_21.tick1));
        Test_21.t2 = new $units['pollen.time.Timer'].Timer('test77_Test_21_t2__V'); Test_21.t2.new_host((Test_21.tick2));
        Test_21.t3 = new $units['pollen.time.Timer'].Timer('test77_Test_21_t3__V'); Test_21.t3.new_host((Test_21.tick3));
        return $$text;
    }
    Test_21.pollen__uses__ = function() {
        $$bind($units['virtual.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['virtual.mcu.TimerMilli'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['pollen.time.Timer'], 'pollen$used', true);
    }
    Test_21.$$privateInit = function() {
    }
    return Test_21;
}
var $$u = $$c();
$units['test77.Test_21'] = $$u;
$units.push($$u);

