
/*
 * ======== MODULE test82.ArrayReturnErr ========
 */

var $$c = function() {
    const ArrayReturnErr = {};
    ArrayReturnErr.ArrayReturnErr = ArrayReturnErr
    ArrayReturnErr.$name = 'test82.ArrayReturnErr';
    ArrayReturnErr.pollen$used = 0;
    ArrayReturnErr.bar = new $$Ref('test82_ArrayReturnErr_bar__I');
    ArrayReturnErr.foobar = new $$Ref('test82_ArrayReturnErr_foobar__I');
    ArrayReturnErr.foo = new $$Ref('test82_ArrayReturnErr_foo__E');
    ArrayReturnErr.targetInit = new $$Ref('test82_ArrayReturnErr_targetInit__I');
    ArrayReturnErr.barHost = function() {
        var $$text = '';
        return(  (ArrayReturnErr.testHost)  );
        return $$text;
    }
    ArrayReturnErr.$$hostInit = function() {
        var $$text = '';
        ArrayReturnErr.bufNoDim = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_bufNoDim__A', false);
        ArrayReturnErr.buffer = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_buffer__A', false);
        ArrayReturnErr.test = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_test__A', false); ArrayReturnErr.test.$$assign((new $$Array(5, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4, 5 ]));
        ArrayReturnErr.errbuff = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_errbuff__A', false);
        ArrayReturnErr.errbuff2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_errbuff2__A', false);
        ArrayReturnErr.testHost = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_testHost__A', false); ArrayReturnErr.testHost.$$assign((new $$Array(5, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4, 5 ]));
        ArrayReturnErr.bufNoDimHost = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_bufNoDimHost__A', false);
        
        (ArrayReturnErr.bufNoDimHost) = ArrayReturnErr.barHost();
        $$printf("Note an array without dimension can be used at host time, eg: \"", (ArrayReturnErr.bufNoDimHost.get(0)), "\" but it will not exit host phase initialized\n");
        return $$text;
    }
    ArrayReturnErr.pollen__uses__ = function() {
    }
    ArrayReturnErr.$$privateInit = function() {
        ArrayReturnErr.bufNoDim = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_bufNoDim__A', false);
        ArrayReturnErr.buffer = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_buffer__A', false);
        ArrayReturnErr.test = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_test__A', false); ArrayReturnErr.test.$$assign((new $$Array(5, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4, 5 ]));
        ArrayReturnErr.errbuff = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_errbuff__A', false);
        ArrayReturnErr.errbuff2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_errbuff2__A', false);
        ArrayReturnErr.bufNoDimHost = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test82_ArrayReturnErr_bufNoDimHost__A', false);
    }
    return ArrayReturnErr;
}
var $$u = $$c();
$units['test82.ArrayReturnErr'] = $$u;
$units.push($$u);

