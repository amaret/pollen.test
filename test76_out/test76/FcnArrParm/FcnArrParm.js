
/*
 * ======== MODULE test76.FcnArrParm ========
 */

var $$c = function() {
    const FcnArrParm = {};
    FcnArrParm.FcnArrParm = FcnArrParm
    FcnArrParm.$name = 'test76.FcnArrParm';
    FcnArrParm.pollen$used = 0;
    FcnArrParm.foo = new $$Ref('test76_FcnArrParm_foo__E');
    FcnArrParm.bar_targ = new $$Ref('test76_FcnArrParm_bar_targ__E');
    FcnArrParm.bar_host = new $$Ref('test76_FcnArrParm_bar_host__E');
    FcnArrParm.targetInit = new $$Ref('test76_FcnArrParm_targetInit__I');
    FcnArrParm.$$hostInit = function() {
        var $$text = '';
        FcnArrParm.arrh = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test76_FcnArrParm_arrh__A', false); FcnArrParm.arrh.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 7, 7, 7 ]));
        FcnArrParm.arr = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test76_FcnArrParm_arr__A', false);
        return $$text;
    }
    FcnArrParm.pollen__uses__ = function() {
    }
    FcnArrParm.$$privateInit = function() {
        FcnArrParm.arr = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test76_FcnArrParm_arr__A', false);
    }
    return FcnArrParm;
}
var $$u = $$c();
$units['test76.FcnArrParm'] = $$u;
$units.push($$u);

