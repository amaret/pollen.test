
/*
 * ======== test13.EH ========
 */

var $$c = function() {
    const EH = {};
    EH.EH = EH
    EH.$name = 'test13.EH';
    EH.pollen$used = 0;
    EH.Y = $units['test13.Y'];
    EH.T = $units['test13.Y'];
    EH.pollen__uses__ = function() {
    }
    EH.$$privateInit = function() {
    }
    return EH;
}
var $$u = $$c();
$units['test13.EH'] = $$u;
$units.push($$u);

