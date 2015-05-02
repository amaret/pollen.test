
/*
 * ======== MODULE test79.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test79.TestProg';
    TestProg.pollen$used = 0;
    TestProg.Junk = $units['test79.Junk'];
    TestProg.Cls1 = $units['test79.Cls1'];
    TestProg.PrintImpl = $units['test79.PrintImpl'];
    TestProg.Nest$$id = 1;
    TestProg.Nest = function(cn) {
        this.$$id = TestProg.Nest$$id++;
        this.$$cname = cn ? cn : 'test79_TestProg_Nest__'+this.$$id+'__S';
        this.$$tname = 'test79_TestProg_Nest';
        this.$$uname = 'test79.TestProg';
        this.flag = true;
        this.aNum = 77;
    }
    TestProg.Nest.prototype = new $$Struct('test79.TestProg.Nest');
    TestProg.Nest.prototype.$$isAggFld = {};
    TestProg.Nest.prototype.$$isAggFld.flag = false;
    TestProg.Nest.prototype.$$isAggFld.aNum = false;
    TestProg.Nest.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    TestProg.Nest.prototype.$$privateInit = function() {
        this.flag = true;
        this.aNum = 77;
    }
    TestProg.Nest.prototype.$$hostInitLastPass = function() {
    }
    TestProg.foo = new $$Ref('test79_TestProg_foo__I');
    TestProg.getAge = new $$Ref('test79_TestProg_getAge__I');
    TestProg.pollen__run = new $$Ref('test79_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test79_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg.aNest = new TestProg.Nest('test79_TestProg_aNest__V'); TestProg.aNest.new_host();
        var $$v = 'test79_PrintImpl';
        var $$s = $$bind($units['test79.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test79.PrintImpl'].pollen$used = true;}


        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test79.Junk'], 'pollen$used', true);
        $$bind($units['test79.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.s1 = "Test this string";
        TestProg.u8 = 1;
        TestProg.u16 = 2;
        TestProg.u32 = 3;
        TestProg.i8 = 4;
        TestProg.i16 = 5;
        TestProg.i32 = 6;
        TestProg.pollenPrintProxy = 0;
    }
    return TestProg;
}
var $$u = $$c();
$units['test79.TestProg'] = $$u;
$units.push($$u);

