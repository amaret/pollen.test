
/*
 * ======== MODULE pollen.time.TimerManager ========
 */

var $$c = function() {
    const TimerManager = {};
    TimerManager.TimerManager = TimerManager
    TimerManager.$name = 'pollen.time.TimerManager';
    TimerManager.pollen$used = 0;
    TimerManager.Event = $units['pollen.events.Event'];
    TimerManager.Timer$$id = 1;
    TimerManager.Timer = function(cn) {
        this.$$id = TimerManager.Timer$$id++;
        this.$$cname = cn ? cn : 'pollen_time_TimerManager_Timer__'+this.$$id+'__S';
        this.$$tname = 'pollen_time_TimerManager_Timer';
        this.$$uname = 'pollen.time.TimerManager';
        this.id = 0;
        this.duration = 0;
        this.elapsed = 0;
        this.repeat = 0;
    }
    TimerManager.Timer.prototype = new $$Struct('pollen.time.TimerManager.Timer');
    TimerManager.Timer.prototype.$$isAggFld = {};
    TimerManager.Timer.prototype.$$isAggFld.id = false;
    TimerManager.Timer.prototype.$$isAggFld.expired = false;
    TimerManager.Timer.prototype.$$isAggFld.duration = false;
    TimerManager.Timer.prototype.$$isAggFld.elapsed = false;
    TimerManager.Timer.prototype.$$isAggFld.repeat = false;
    TimerManager.Timer.prototype.init = function() {
        var $$text = '';
        (this.id) = (TimerManager.numTimers);
        (TimerManager.numTimers)++;
        (this.repeat) = false;
        $$printf("\nTIMER INIT");
        this.$$hostInitLastPass();
        return $$text;
    }
    TimerManager.Timer.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.expired = 0;
        this.$$hostInitLastPass();
        return this;
    }
    TimerManager.Timer.prototype.$$privateInit = function() {
        this.id = 0;
        this.duration = 0;
        this.elapsed = 0;
        this.repeat = 0;
    }
    TimerManager.Timer.prototype.$$hostInitLastPass = function() {
    }
    TimerManager.timerISR = new $$Ref('pollen_time_TimerManager_timerISR__I');
    TimerManager.targetInit = new $$Ref('pollen_time_TimerManager_targetInit__I');
    TimerManager.bindGlobalInterrupts = function( gi ) {
        var $$text = '';
        var $$v = 'pollen_interfaces_GlobalInterrupts';
        var $$s = $$bind($units['pollen.time.TimerManager'], 'gint', $$v);if ($$v && $$v == $$s) $$v.pollen$used = true;

        return $$text;
    }
    TimerManager.bindTimerDriver = function( t ) {
        var $$text = '';
        var $$v = 'pollen_interfaces_TimerDriver';
        var $$s = $$bind($units['pollen.time.TimerManager'], 'hw_timer', $$v);if ($$v && $$v == $$s) $$v.pollen$used = true;

        return $$text;
    }
    TimerManager.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TimerManager.pollen__uses__ = function() {
        $$bind($units['pollen.events.Dispatcher'], 'pollen$used', true);
        $$bind($units['pollen.events.Event'], 'pollen$used', true);
    }
    TimerManager.$$privateInit = function() {
        TimerManager.gint = 0;
        TimerManager.hw_timer = 0;
        TimerManager.numTimers = 0;
    }
    TimerManager.$$hostInitLastPass = function() {
        TimerManager.timers = new $$Array((TimerManager.numTimers), function($$cn,$$idx){obj = new TimerManager.Timer(); obj.new_host(); return obj;}, 'pollen_time_TimerManager_timers__A', false);
    }
    return TimerManager;
}
var $$u = $$c();
$units['pollen.time.TimerManager'] = $$u;
$units.push($$u);

