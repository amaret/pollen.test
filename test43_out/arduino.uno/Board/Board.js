
/*
 * ======== COMPOSITION arduino.uno.Board ========
 */

var $$c = function() {
    const Board = {};
    Board.Board = Board
    Board.$name = 'arduino.uno.Board';
    Board.pollen$used = 0;
    Board.Led = $units['pollen.hardware.Led'];
    Board.$$hostInit = function() {
        var $$text = '';
        var $$v = 'atmel_atmega8_PB5';
        var $$s = $$bind($units['arduino.uno.Board'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['atmel.atmega8.PB5'].pollen$used = true;}


        return $$text;
    }
    return Board;
}
var $$u = $$c();
$units['arduino.uno.Board'] = $$u;
$units.push($$u);

