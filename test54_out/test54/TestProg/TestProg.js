
/*
 * ======== MODULE test54.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test54.TestProg';
    TestProg.pollen$used = 0;
    TestProg.Junk = $units['test54.Junk'];
    TestProg.PrintImpl = $units['test54.PrintImpl'];
    TestProg.Nest$$id = 1;
    TestProg.Nest = function(cn) {
        this.$$id = TestProg.Nest$$id++;
        this.$$cname = cn ? cn : 'test54_TestProg_Nest__'+this.$$id+'__S';
        this.$$tname = 'test54_TestProg_Nest';
        this.$$uname = 'test54.TestProg';
        this.flag = true;
        this.aNum = 77;
    }
    TestProg.Nest.prototype = new $$Struct('test54.TestProg.Nest');
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
    TestProg.pollen__run = new $$Ref('test54_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test54_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg.aNest = new TestProg.Nest('test54_TestProg_aNest__V'); TestProg.aNest.new_host();
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test54.Junk'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.s1 = "Test this string";
        TestProg.u8 = 1;
        TestProg.u16 = 2;
        TestProg.u32 = 3;
        TestProg.i8 = 4;
        TestProg.i16 = 5;
        TestProg.i32 = 6;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test54.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return TestProg;
}
var $$u = $$c();
$units['test54.TestProg'] = $$u;
$units.push($$u);

