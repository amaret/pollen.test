
/*
 * ======== MODULE test17.TimerManagerTest ========
 */

var $$c = function() {
    const TimerManagerTest = {};
    TimerManagerTest.TimerManagerTest = TimerManagerTest
    TimerManagerTest.$name = 'test17.TimerManagerTest';
    TimerManagerTest.pollen$used = 0;
    TimerManagerTest.TimerManager = $units['pollen.time.TimerManager'];
    TimerManagerTest.pollen__run = new $$Ref('test17_TimerManagerTest_pollen__run__E');
    TimerManagerTest.targetInit = new $$Ref('test17_TimerManagerTest_targetInit__I');
    TimerManagerTest.$$hostInit = function() {
        var $$text = '';
        TimerManagerTest.t = new $units['pollen.time.TimerManager'].Timer('test17_TimerManagerTest_t__V'); TimerManagerTest.t.new_host();
        TimerManagerTest.t.init();
        return $$text;
    }
    TimerManagerTest.pollen__uses__ = function() {
        $$bind($units['mcu.atmel.atmega328p.Atmega328p'], 'pollen$used', true);
        $$bind($units['mcu.atmel.atmega.Timer0MatchA'], 'pollen$used', true);
        $$bind($units['mcu.atmel.atmega328p.Uart'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led'], 'pollen$used', true);
        $$bind($units['pollen.events.Dispatcher'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerMilli'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
    }
    TimerManagerTest.$$privateInit = function() {
    }
    return TimerManagerTest;
}
var $$u = $$c();
$units['test17.TimerManagerTest'] = $$u;
$units.push($$u);

