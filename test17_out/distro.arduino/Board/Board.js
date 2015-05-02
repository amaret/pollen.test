
/*
 * ======== COMPOSITION distro.arduino.Board ========
 */

var $$c = function() {
    const Board = {};
    Board.Board = Board
    Board.$name = 'distro.arduino.Board';
    Board.pollen$used = 0;
    Board.Led = $units['pollen.parts.Led'];
    Board.$$hostInit = function() {
        var $$text = '';
        $units['mcu.atmel.atmega328p.Mcu'].setSystemFrequency(16000000);
        $units['pollen.parts.Led'].bindPin(($units['mcu.atmel.atmega328p.Mcu']));
        return $$text;
    }
    return Board;
}
var $$u = $$c();
$units['distro.arduino.Board'] = $$u;
$units.push($$u);

