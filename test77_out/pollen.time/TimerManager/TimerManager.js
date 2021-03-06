
/*
 * ======== MODULE pollen.time.TimerManager ========
 */

var $$c = function() {
    const TimerManager = {};
    TimerManager.TimerManager = TimerManager
    TimerManager.$name = 'pollen.time.TimerManager';
    TimerManager.pollen$used = 0;
    TimerManager.Timer = $units['pollen.time.Timer'];
    TimerManager.TimerMilli = $units['virtual.mcu.TimerMilli'];
    TimerManager.targetInit = new $$Ref('pollen_time_TimerManager_targetInit__I');
    TimerManager.addTimer = new $$Ref('pollen_time_TimerManager_addTimer__E');
    TimerManager.start = new $$Ref('pollen_time_TimerManager_start__E');
    TimerManager.stop = new $$Ref('pollen_time_TimerManager_stop__E');
    TimerManager.isActive = new $$Ref('pollen_time_TimerManager_isActive__E');
    TimerManager.tickISR = new $$Ref('pollen_time_TimerManager_tickISR__I');
    TimerManager.$$hostInit = function() {
        var $$text = '';
        var $$v = 'virtual_mcu_TimerMilli';
        var $$s = $$bind($units['pollen.time.TimerManager'], 'HwTimer', $$v);{ $$v.pollen$used = true;
        $units['virtual.mcu.TimerMilli'].pollen$used = true;}


        $units['virtual.mcu.TimerMilli'].setHandlerOnHost((TimerManager.tickISR));
        $$printf("in host constr numMsTimers= ", (TimerManager.numMsTimers));
        return $$text;
    }
    TimerManager.registerTimerOnHost = function( t ) {
        var $$text = '';
        (TimerManager.numMsTimers) = (TimerManager.numMsTimers) + 1;
        $$printf("TimerManager registering milli timer (total=", (TimerManager.numMsTimers), ")\n");
        return $$text;
    }
    TimerManager.pollen__uses__ = function() {
        $$bind($units['pollen.time.Timer'], 'pollen$used', true);
        $$bind($units['virtual.mcu.TimerMilli'], 'pollen$used', true);
    }
    TimerManager.$$privateInit = function() {
        TimerManager.HwTimer = 0;
        TimerManager.numMsTimers = 0;
    }
    TimerManager.$$hostInitLastPass = function() {
        TimerManager.msTimers = new $$Array((TimerManager.numMsTimers), function($$cn,$$idx){ return 0;}, 'pollen_time_TimerManager_msTimers__A', false); TimerManager.msTimers.$$assign((new $$Array((TimerManager.numMsTimers), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null ]));
    }
    return TimerManager;
}
var $$u = $$c();
$units['pollen.time.TimerManager'] = $$u;
$units.push($$u);

