
/*
 * ======== MODULE test58.IncArrTest ========
 */

var $$c = function() {
    const IncArrTest = {};
    IncArrTest.IncArrTest = IncArrTest
    IncArrTest.$name = 'test58.IncArrTest';
    IncArrTest.pollen$used = 0;
    IncArrTest.foo = new $$Ref('test58_IncArrTest_foo__E');
    IncArrTest.targetInit = new $$Ref('test58_IncArrTest_targetInit__I');
    IncArrTest.$$hostInit = function() {
        var $$text = '';
        IncArrTest.arr = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test58_IncArrTest_arr__A', false); IncArrTest.arr.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0 ]));
        return $$text;
    }
    IncArrTest.pollen__uses__ = function() {
    }
    IncArrTest.$$privateInit = function() {
        IncArrTest.arr = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test58_IncArrTest_arr__A', false); IncArrTest.arr.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0 ]));
    }
    return IncArrTest;
}
var $$u = $$c();
$units['test58.IncArrTest'] = $$u;
$units.push($$u);

