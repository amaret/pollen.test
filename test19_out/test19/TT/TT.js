
/*
 * ======== MODULE test19.TT ========
 */

var $$c = function() {
    const TT = {};
    TT.TT = TT
    TT.$name = 'test19.TT';
    TT.pollen$used = 0;
    TT.Z = $units['test19.Y'];
    TT.targetInit = new $$Ref('test19_TT_targetInit__I');
    TT.lowValue = true;
    TT.get = function() {
        var $$text = '';
        var l;
        l = (TT.lowValue);
        return(  $units['test19.Y'].get()  );
        return $$text;
    }
    TT.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TT.pollen__uses__ = function() {
        $$bind($units['test19.Y'], 'pollen$used', true);
    }
    TT.$$privateInit = function() {
    }
    return TT;
}
var $$u = $$c();
$units['test19.TT'] = $$u;
$units.push($$u);

