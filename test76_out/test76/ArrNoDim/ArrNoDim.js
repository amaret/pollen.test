
/*
 * ======== MODULE test76.ArrNoDim ========
 */

var $$c = function() {
    const ArrNoDim = {};
    ArrNoDim.ArrNoDim = ArrNoDim
    ArrNoDim.$name = 'test76.ArrNoDim';
    ArrNoDim.pollen$used = 0;
    ArrNoDim.foo = new $$Ref('test76_ArrNoDim_foo__E');
    ArrNoDim.targetInit = new $$Ref('test76_ArrNoDim_targetInit__I');
    ArrNoDim.$$hostInit = function() {
        var $$text = '';
        ArrNoDim.arrh = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test76_ArrNoDim_arrh__A', false); ArrNoDim.arrh.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 7, 7, 7 ]));
        ArrNoDim.arr = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test76_ArrNoDim_arr__A', false);
        return $$text;
    }
    ArrNoDim.pollen__uses__ = function() {
    }
    ArrNoDim.$$privateInit = function() {
        ArrNoDim.arr = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test76_ArrNoDim_arr__A', false);
    }
    return ArrNoDim;
}
var $$u = $$c();
$units['test76.ArrNoDim'] = $$u;
$units.push($$u);

