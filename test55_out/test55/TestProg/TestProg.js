
/*
 * ======== MODULE test55.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test55.TestProg';
    TestProg.pollen$used = 0;
    TestProg.PrintImpl = $units['test55.PrintImpl'];
    TestProg.Nest$$id = 1;
    TestProg.Nest = function(cn) {
        this.$$id = TestProg.Nest$$id++;
        this.$$cname = cn ? cn : 'test55_TestProg_Nest__'+this.$$id+'__S';
        this.$$tname = 'test55_TestProg_Nest';
        this.$$uname = 'test55.TestProg';
    }
    TestProg.Nest.prototype = new $$Struct('test55.TestProg.Nest');
    TestProg.Nest.prototype.$$isAggFld = {};
    TestProg.Nest.prototype.$$isAggFld.nest_arr1 = true;
    TestProg.Nest.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.nest_arr1 = new $$Array(12, function($$cn,$$idx){ return 0;}, 'test55_TestProg_nest_arr1__A', false); this.nest_arr1.$$assign((new $$Array(12, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ]));
        this.$$hostInitLastPass();
        return this;
    }
    TestProg.Nest.prototype.$$privateInit = function() {
    }
    TestProg.Nest.prototype.$$hostInitLastPass = function() {
    }
    TestProg.pollen__run = new $$Ref('test55_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test55_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg.arr1 = new $$Array(12, function($$cn,$$idx){ return 0;}, 'test55_TestProg_arr1__A', false); TestProg.arr1.$$assign((new $$Array(12, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ]));
        TestProg.n_host = new TestProg.Nest('test55_TestProg_n_host__V'); TestProg.n_host.new_host();
        TestProg.n1 = 0;
        TestProg.n = 0;
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test55.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.ALIGN_8BIT = 1;
        TestProg.ALIGN_16BIT = 2;
        TestProg.ALIGN_32BIT = 4;
var $$v = 'test55_PrintImpl';
        var $$s = $$bind($units['test55.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test55.PrintImpl'].pollen$used = true;}

    }
    return TestProg;
}
var $$u = $$c();
$units['test55.TestProg'] = $$u;
$units.push($$u);

