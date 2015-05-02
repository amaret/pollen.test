
/*
 * ======== MODULE virtual.mcu.TimerMilli ========
 */

var $$c = function() {
    const TimerMilli = {};
    TimerMilli.TimerMilli = TimerMilli
    TimerMilli.$name = 'virtual.mcu.TimerMilli';
    TimerMilli.pollen$used = 0;
    TimerMilli.targetInit = new $$Ref('virtual_mcu_TimerMilli_targetInit__I');
    TimerMilli.setHandler = new $$Ref('virtual_mcu_TimerMilli_setHandler__E');
    TimerMilli.start = new $$Ref('virtual_mcu_TimerMilli_start__E');
    TimerMilli.stop = new $$Ref('virtual_mcu_TimerMilli_stop__E');
    TimerMilli.isRunning = new $$Ref('virtual_mcu_TimerMilli_isRunning__E');
    TimerMilli.resetTimer = new $$Ref('virtual_mcu_TimerMilli_resetTimer__I');
    TimerMilli.sigAlarm = new $$Ref('virtual_mcu_TimerMilli_sigAlarm__I');
    TimerMilli.setHandlerOnHost = function( h ) {
        var $$text = '';
        (TimerMilli.tickHandler) = (h);
        $$printf("Virtual Hardware Timer Milli setHandlerOnHost()\n");
        return $$text;
    }
    TimerMilli.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TimerMilli.pollen__uses__ = function() {
    }
    TimerMilli.$$privateInit = function() {
        TimerMilli.repeat = false;
    }
    return TimerMilli;
}
var $$u = $$c();
$units['virtual.mcu.TimerMilli'] = $$u;
$units.push($$u);

