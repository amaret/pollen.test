
/*
 * ======== MODULE test2.TT ========
 */

var $$c = function() {
    const TT = {};
    TT.TT = TT
    TT.$name = 'test2.TT';
    TT.pollen$used = 0;
    TT.Z = $units['test2.Y'];
    TT.targetInit = new $$Ref('test2_TT_targetInit__I');
    TT.lowValue = true;
    TT.get = function() {
        var $$text = '';
        var l;
        l = (TT.lowValue);
        if ((TT.lowValue)) {
            return(  5  );
        }
        else {
            return(  3  );
        }
        return $$text;
    }
    TT.$$hostInit = function() {
        var $$text = '';
        (TT.x) = TT.get();
        return $$text;
    }
    TT.pollen__uses__ = function() {
    }
    TT.$$privateInit = function() {
        TT.x = 1;
    }
    return TT;
}
var $$u = $$c();
$units['test2.TT'] = $$u;
$units.push($$u);

