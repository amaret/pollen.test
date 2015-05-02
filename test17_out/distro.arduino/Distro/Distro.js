
/*
 * ======== COMPOSITION distro.arduino.Distro ========
 */

var $$c = function() {
    const Distro = {};
    Distro.Distro = Distro
    Distro.$name = 'distro.arduino.Distro';
    Distro.pollen$used = 0;
    Distro.$$hostInit = function() {
        var $$text = '';
        $units['pollen.events.Events'].bindGlobalInterrupts(($units['distro.arduino.Board']));
        $units['pollen.time.Time'].bindGlobalInterrupts(($units['distro.arduino.Board']));
        $units['pollen.time.Time'].bindTimerDriver(($units['distro.arduino.Board']));
        $units['mcu.atmel.atmega328p.Uart'].setBaud(57600);
        return $$text;
    }
    return Distro;
}
var $$u = $$c();
$units['distro.arduino.Distro'] = $$u;
$units.push($$u);

