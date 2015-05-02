
/*
 * ======== COMPOSITION amaret.local.LocalMcu ========
 */

var $$c = function() {
    const LocalMcu = {};
    LocalMcu.LocalMcu = LocalMcu
    LocalMcu.$name = 'amaret.local.LocalMcu';
    LocalMcu.pollen$used = 0;
    LocalMcu.Mcu = $units['amaret.local.Mcu'];
    LocalMcu.A1 = $units['amaret.local.A1'];
    return LocalMcu;
}
var $$u = $$c();
$units['amaret.local.LocalMcu'] = $$u;
$units.push($$u);

