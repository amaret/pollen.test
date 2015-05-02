
/*
 * ======== CLASS pollen.time.Timer ========
 */

var $$c = function() {
    const Timer = {};
    Timer.Timer = Timer
    Timer.$name = 'pollen.time.Timer';
    Timer.pollen$used = 0;
    Timer.Event = $units['pollen.event.Event'];
    Timer.TimerManager = $units['pollen.time.TimerManager'];
    Timer.Timer$$id = 1;
    Timer.Timer = function(cn) {
        this.$$id = Timer.Timer$$id++;
        this.$$cname = cn ? cn : 'pollen_time_Timer_Timer__'+this.$$id+'__S';
        this.$$tname = 'pollen_time_Timer_Timer';
        this.$$uname = 'pollen.time.Timer';
        this.active = false;
        this.periodic = false;
        this.duration = 0;
        this.tickCount = 0;
    }
    Timer.Timer.prototype = new $$Struct('pollen.time.Timer.Timer');
    Timer.Timer.prototype.$$isAggFld = {};
    Timer.Timer.prototype.$$isAggFld.tickEvent = false;
    Timer.Timer.prototype.$$isAggFld.active = false;
    Timer.Timer.prototype.$$isAggFld.periodic = false;
    Timer.Timer.prototype.$$isAggFld.duration = false;
    Timer.Timer.prototype.$$isAggFld.tickCount = false;
    Timer.Timer.prototype.new_host = function( h ) {
        var $$text = '';
        this.$$privateInit();
        this.tickEvent = new $units['pollen.event.Event'].Event('pollen_time_Timer_tickEvent__V');
        if (arguments.length == 1) {
                (this.tickEvent) = new $units['pollen.event.Event'].Event().new_host((h));
                $units['pollen.time.TimerManager'].registerTimerOnHost(this);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Timer.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
    }
    Timer.Timer.prototype.$$privateInit = function() {
        this.active = false;
        this.periodic = false;
        this.duration = 0;
        this.tickCount = 0;
    }
    Timer.Timer.prototype.$$hostInitLastPass = function() {
    }
    return Timer;
}
var $$u = $$c();
$units['pollen.time.Timer'] = $$u;
$units.push($$u);

