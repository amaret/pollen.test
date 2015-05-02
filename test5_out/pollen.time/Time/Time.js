
/*
 * ======== COMPOSITION pollen.time.Time ========
 */

var $$c = function() {
    const Time = {};
    Time.Time = Time
    Time.$name = 'pollen.time.Time';
    Time.pollen$used = 0;
    Time.TimerMilli = $units['pollen.time.TimerMilli'];
    Time.bindGlobalInterrupts = function( gi ) {
        var $$text = '';
        return $$text;
    }
    Time.bindTimerDriver = function( t ) {
        var $$text = '';
        $units['pollen.time.TimerMilli'].bindTimerDriver((t));
        return $$text;
    }
    return Time;
}
var $$u = $$c();
$units['pollen.time.Time'] = $$u;
$units.push($$u);

