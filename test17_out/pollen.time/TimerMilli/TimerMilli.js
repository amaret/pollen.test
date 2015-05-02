
/*
 * ======== MODULE pollen.time.TimerMilli ========
 */

var $$c = function() {
    const TimerMilli = {};
    TimerMilli.TimerMilli = TimerMilli
    TimerMilli.$name = 'pollen.time.TimerMilli';
    TimerMilli.pollen$used = 0;
    TimerMilli.targetInit = new $$Ref('pollen_time_TimerMilli_targetInit__I');
    TimerMilli.start = new $$Ref('pollen_time_TimerMilli_start__E');
    TimerMilli.stop = new $$Ref('pollen_time_TimerMilli_stop__E');
    TimerMilli.running = new $$Ref('pollen_time_TimerMilli_running__E');
    TimerMilli.timerTick = new $$Ref('pollen_time_TimerMilli_timerTick__E');
    TimerMilli.bindTimerDriver = function( td ) {
        var $$text = '';
        TimerMilli.timer = (td);
        return $$text;
    }
    TimerMilli.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TimerMilli.pollen__uses__ = function() {
    }
    TimerMilli.$$privateInit = function() {
        TimerMilli.timer = 0;
        TimerMilli.count = 0;
        TimerMilli.duration = 0;
        TimerMilli.repeat = true;
        TimerMilli.clientTick = 0;
    }
    return TimerMilli;
}
var $$u = $$c();
$units['pollen.time.TimerMilli'] = $$u;
$units.push($$u);

