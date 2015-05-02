
/*
 * ======== MODULE test81.ArrayReturn ========
 */

var $$c = function() {
    const ArrayReturn = {};
    ArrayReturn.ArrayReturn = ArrayReturn
    ArrayReturn.$name = 'test81.ArrayReturn';
    ArrayReturn.pollen$used = 0;
    ArrayReturn.bar = new $$Ref('test81_ArrayReturn_bar__I');
    ArrayReturn.bar2 = new $$Ref('test81_ArrayReturn_bar2__I');
    ArrayReturn.foobar = new $$Ref('test81_ArrayReturn_foobar__I');
    ArrayReturn.foo = new $$Ref('test81_ArrayReturn_foo__E');
    ArrayReturn.targetInit = new $$Ref('test81_ArrayReturn_targetInit__I');
    ArrayReturn.$$hostInit = function() {
        var $$text = '';
        ArrayReturn.bufNoDim = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_bufNoDim__A', false);
        ArrayReturn.buffer = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_buffer__A', false);
        ArrayReturn.test1 = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_test1__A', false); ArrayReturn.test1.$$assign((new $$Array(5, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4, 5 ]));
        ArrayReturn.test2 = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_test2__A', false); ArrayReturn.test2.$$assign((new $$Array(5, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ true, false, false, true, false ]));
        ArrayReturn.buffer2 = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_buffer2__A', false);
        return $$text;
    }
    ArrayReturn.pollen__uses__ = function() {
    }
    ArrayReturn.$$privateInit = function() {
        ArrayReturn.bufNoDim = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_bufNoDim__A', false);
        ArrayReturn.buffer = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_buffer__A', false);
        ArrayReturn.test1 = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_test1__A', false); ArrayReturn.test1.$$assign((new $$Array(5, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4, 5 ]));
        ArrayReturn.test2 = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_test2__A', false); ArrayReturn.test2.$$assign((new $$Array(5, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ true, false, false, true, false ]));
        ArrayReturn.buffer2 = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test81_ArrayReturn_buffer2__A', false);
    }
    return ArrayReturn;
}
var $$u = $$c();
$units['test81.ArrayReturn'] = $$u;
$units.push($$u);

