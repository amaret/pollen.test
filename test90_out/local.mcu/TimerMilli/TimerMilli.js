
/*
 * ======== MODULE local.mcu.TimerMilli ========
 */

var $$c = function() {
    const TimerMilli = {};
    TimerMilli.TimerMilli = TimerMilli
    TimerMilli.$name = 'local.mcu.TimerMilli';
    TimerMilli.pollen$used = 0;
    TimerMilli.targetInit = new $$Ref('local_mcu_TimerMilli_targetInit__I');
    TimerMilli.setHandler = new $$Ref('local_mcu_TimerMilli_setHandler__E');
    TimerMilli.start = new $$Ref('local_mcu_TimerMilli_start__E');
    TimerMilli.stop = new $$Ref('local_mcu_TimerMilli_stop__E');
    TimerMilli.isRunning = new $$Ref('local_mcu_TimerMilli_isRunning__E');
    TimerMilli.resetTimer = new $$Ref('local_mcu_TimerMilli_resetTimer__I');
    TimerMilli.sigAlarm = new $$Ref('local_mcu_TimerMilli_sigAlarm__I');
    TimerMilli.setHandlerOnHost = function( h ) {
        var $$text = '';
        (TimerMilli.tickHandler) = (h);
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
$units['local.mcu.TimerMilli'] = $$u;
$units.push($$u);

