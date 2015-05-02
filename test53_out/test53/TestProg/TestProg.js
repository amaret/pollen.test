
/*
 * ======== MODULE test53.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test53.TestProg';
    TestProg.pollen$used = 0;
    TestProg.Mod1 = $units['test53.Mod1'];
    TestProg.Nest$$id = 1;
    TestProg.Nest = function(cn) {
        this.$$id = TestProg.Nest$$id++;
        this.$$cname = cn ? cn : 'test53_TestProg_Nest__'+this.$$id+'__S';
        this.$$tname = 'test53_TestProg_Nest';
        this.$$uname = 'test53.TestProg';
    }
    TestProg.Nest.prototype = new $$Struct('test53.TestProg.Nest');
    TestProg.Nest.prototype.$$isAggFld = {};
    TestProg.Nest.prototype.$$isAggFld.arr1 = true;
    TestProg.Nest.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.arr1 = new $$Array(12, function($$cn,$$idx){ return 0;}, 'test53_TestProg_arr1__A', false); this.arr1.$$assign((new $$Array(12, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ]));
        this.$$hostInitLastPass();
        return this;
    }
    TestProg.Nest.prototype.$$privateInit = function() {
    }
    TestProg.Nest.prototype.$$hostInitLastPass = function() {
    }
    TestProg.pollen__run = new $$Ref('test53_TestProg_pollen__run__E');
    TestProg.fcnpeg = new $$Ref('test53_TestProg_fcnpeg__I');
    TestProg.targetInit = new $$Ref('test53_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg.n_host = new TestProg.Nest('test53_TestProg_n_host__V'); TestProg.n_host.new_host();
        TestProg.n1 = 0;
        TestProg.arr1 = new $$Array(12, function($$cn,$$idx){ return 0;}, 'test53_TestProg_arr1__A', false); TestProg.arr1.$$assign((new $$Array(12, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ]));
        TestProg.arrChk = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test53_TestProg_arrChk__A', false);
        TestProg.n = 0;
        (TestProg.n1) = (TestProg.n_host);
        (TestProg.myFlag) = true;
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test53.Mod1'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.myFlag = false;
        TestProg.myFlag2 = false;
var $$v = 'test53_Mod1';
        var $$s = $$bind($units['test53.TestProg'], 'm1', $$v);{ $$v.pollen$used = true;
        $units['test53.Mod1'].pollen$used = true;}

        TestProg.arrChk = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test53_TestProg_arrChk__A', false);
    }
    return TestProg;
}
var $$u = $$c();
$units['test53.TestProg'] = $$u;
$units.push($$u);

