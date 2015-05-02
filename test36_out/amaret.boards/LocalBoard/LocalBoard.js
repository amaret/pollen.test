
/*
 * ======== COMPOSITION amaret.boards.LocalBoard ========
 */

var $$c = function() {
    const LocalBoard = {};
    LocalBoard.LocalBoard = LocalBoard
    LocalBoard.$name = 'amaret.boards.LocalBoard';
    LocalBoard.pollen$used = 0;
    LocalBoard.Led = $units['pollen.hardware.Led'];
    LocalBoard.$$hostInit = function() {
        var $$text = '';
        var $$v = 'amaret_local_A1';
        var $$s = $$bind($units['amaret.boards.LocalBoard'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['amaret.local.A1'].pollen$used = true;}


        return $$text;
    }
    return LocalBoard;
}
var $$u = $$c();
$units['amaret.boards.LocalBoard'] = $$u;
$units.push($$u);

