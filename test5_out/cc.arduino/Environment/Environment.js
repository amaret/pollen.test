
/*
 * ======== COMPOSITION cc.arduino.Environment ========
 */

var $$c = function() {
    const Environment = {};
    Environment.Environment = Environment
    Environment.$name = 'cc.arduino.Environment';
    Environment.pollen$used = 0;
    Environment.$$hostInit = function() {
        var $$text = '';
        $units['pollen.events.Events'].bindGlobalInterrupts(($units['cc.arduino.Duemilanove']));
        $units['pollen.time.Time'].bindGlobalInterrupts(($units['cc.arduino.Duemilanove']));
        $units['pollen.time.Time'].bindTimerDriver(($units['cc.arduino.Duemilanove']));
        return $$text;
    }
    return Environment;
}
var $$u = $$c();
$units['cc.arduino.Environment'] = $$u;
$units.push($$u);

