
/*
 * ======== MODULE test95.ArrMod ========
 */

var $$c = function() {
    const ArrMod = {};
    ArrMod.ArrMod = ArrMod
    ArrMod.$name = 'test95.ArrMod';
    ArrMod.pollen$used = 0;
    ArrMod.foo = new $$Ref('test95_ArrMod_foo__E');
    ArrMod.targetInit = new $$Ref('test95_ArrMod_targetInit__I');
    ArrMod.$$hostInit = function() {
        var $$text = '';
        ArrMod.targBuff_nosize = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test95_ArrMod_targBuff_nosize__A', false); ArrMod.targBuff_nosize.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3 ]));
        ArrMod.targBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test95_ArrMod_targBuff_sizeTarg__A', false);
        ArrMod.hostBuff_noSize = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test95_ArrMod_hostBuff_noSize__A', false); ArrMod.hostBuff_noSize.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3 ]));
        ArrMod.hostBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test95_ArrMod_hostBuff_sizeTarg__A', false);
        ArrMod.hostBuff_sizeConst = new $$Array(7, function($$cn,$$idx){ return 0;}, 'test95_ArrMod_hostBuff_sizeConst__A', false); ArrMod.hostBuff_sizeConst.$$assign((new $$Array(7, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 1, 2, 3, 4 ]));
        ArrMod.hostBuff_sizeConst2 = new $$Array(7, function($$cn,$$idx){ return 0;}, 'test95_ArrMod_hostBuff_sizeConst2__A', false); ArrMod.hostBuff_sizeConst2.$$assign((new $$Array(7, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 3, 3, 3, 3, 3, 3, 3 ]));
        return $$text;
    }
    ArrMod.pollen__uses__ = function() {
    }
    ArrMod.$$privateInit = function() {
        ArrMod.sizeHost = 8;
        ArrMod.sizeTarg = 6;
        ArrMod.targBuff_nosize = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test95_ArrMod_targBuff_nosize__A', false); ArrMod.targBuff_nosize.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3 ]));
        ArrMod.targBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test95_ArrMod_targBuff_sizeTarg__A', false);
    }
    ArrMod.$$hostInitLastPass = function() {
        ArrMod.targBuff_sizeHost = new $$Array((ArrMod.sizeHost), function($$cn,$$idx){ return 0;}, 'test95_ArrMod_targBuff_sizeHost__A', false);
        ArrMod.hostBuff_sizeHost = new $$Array((ArrMod.sizeHost), function($$cn,$$idx){ return 0;}, 'test95_ArrMod_hostBuff_sizeHost__A', false);
    }
    return ArrMod;
}
var $$u = $$c();
$units['test95.ArrMod'] = $$u;
$units.push($$u);

