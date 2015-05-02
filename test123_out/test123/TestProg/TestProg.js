
/*
 * ======== MODULE test123.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test123.TestProg';
    TestProg.pollen$used = 0;
    TestProg.PrintImpl = $units['test54.PrintImpl'];
    TestProg.pollen__run = new $$Ref('test123_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test123_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg._arr_u8 = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test123_TestProg__arr_u8__A', false); TestProg._arr_u8.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 1, 2, 3 ]));
        TestProg.arr_u8 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test123_TestProg_arr_u8__A', false);
        TestProg.arr_u16 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test123_TestProg_arr_u16__A', false);
        TestProg.arr_u32 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test123_TestProg_arr_u32__A', false);
        TestProg._arr_b = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test123_TestProg__arr_b__A', false); TestProg._arr_b.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ true ]));
        TestProg.arr_b = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test123_TestProg_arr_b__A', false);
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test123.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

        TestProg._arr_u8 = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test123_TestProg__arr_u8__A', false); TestProg._arr_u8.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 1, 2, 3 ]));
        TestProg.arr_u8 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test123_TestProg_arr_u8__A', false);
        TestProg.arr_u16 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test123_TestProg_arr_u16__A', false);
        TestProg.arr_u32 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test123_TestProg_arr_u32__A', false);
        TestProg._arr_b = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test123_TestProg__arr_b__A', false); TestProg._arr_b.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ true ]));
        TestProg.arr_b = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test123_TestProg_arr_b__A', false);
    }
    return TestProg;
}
var $$u = $$c();
$units['test123.TestProg'] = $$u;
$units.push($$u);

