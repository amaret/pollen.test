
/*
 * ======== MODULE test56.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test56.TestProg';
    TestProg.pollen$used = 0;
    TestProg.On1 = $units['test56.On1'];
    TestProg.On2 = $units['test56.On2'];
    TestProg.On3 = $units['test56.On3'];
    TestProg.On4 = $units['test56.On4'];
    TestProg.On5 = $units['test56.On5'];
    TestProg.PrintImpl = $units['test56.PrintImpl'];
    TestProg.pollen__run = new $$Ref('test56_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test56_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg.on_host_functions = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_host_functions__A', false); TestProg.on_host_functions.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on3_host_fref), (TestProg.on3_host_fref), (TestProg.on3_host_fref) ]));
        TestProg.on_functions = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_functions__A', false); TestProg.on_functions.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on1_fref), (TestProg.on2_fref), (TestProg.on3_fref) ]));
        TestProg.on_functions_proto = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_functions_proto__A', false); TestProg.on_functions_proto.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on1_fref), (TestProg.on2_fref), (TestProg.on3_fref) ]));
        TestProg.on_function_by_name = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_function_by_name__A', false); TestProg.on_function_by_name.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ ($units['test56.On1'].on), ($units['test56.On2'].on), ($units['test56.On3'].on), ($units['test56.On4'].on) ]));
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test56.On1'], 'pollen$used', true);
        $$bind($units['test56.On2'], 'pollen$used', true);
        $$bind($units['test56.On3'], 'pollen$used', true);
        $$bind($units['test56.On4'], 'pollen$used', true);
        $$bind($units['test56.On5'], 'pollen$used', true);
        $$bind($units['test56.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.on1_fref = new $$Ref('test56_On1_on__E');
        TestProg.on1_0_fref = new $$Ref('test56_On1_on_0__E');
        TestProg.on2_fref = new $$Ref('test56_On2_on__E');
        TestProg.on3_fref = new $$Ref('test56_On3_on__E');
        TestProg.on1_0_hfref = new $$Ref('test56_On1_on_0__E');
        TestProg.on3_host_fref = new $$Ref('test56_On3_on__E');
        TestProg.on1_0_fref_4 = new $$Ref('test56_On1_on_0__E');
var $$v = 'test56_PrintImpl';
        var $$s = $$bind($units['test56.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test56.PrintImpl'].pollen$used = true;}

        TestProg.on_functions = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_functions__A', false); TestProg.on_functions.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on1_fref), (TestProg.on2_fref), (TestProg.on3_fref) ]));
        TestProg.on_functions_proto = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_functions_proto__A', false); TestProg.on_functions_proto.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on1_fref), (TestProg.on2_fref), (TestProg.on3_fref) ]));
        TestProg.on_function_by_name = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_function_by_name__A', false); TestProg.on_function_by_name.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ ($units['test56.On1'].on), ($units['test56.On2'].on), ($units['test56.On3'].on), ($units['test56.On4'].on) ]));
    }
    return TestProg;
}
var $$u = $$c();
$units['test56.TestProg'] = $$u;
$units.push($$u);

