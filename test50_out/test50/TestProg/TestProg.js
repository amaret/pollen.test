
/*
 * ======== MODULE test50.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test50.TestProg';
    TestProg.pollen$used = 0;
    TestProg.Class1 = $units['test50.Class1'];
    TestProg.led$$id = 1;
    TestProg.led = function(cn) {
        this.$$id = TestProg.led$$id++;
        this.$$cname = cn ? cn : 'test50_TestProg_led__'+this.$$id+'__S';
        this.$$tname = 'test50_TestProg_led';
        this.$$uname = 'test50.TestProg';
        this.red = 1;
        this.green = 0;
        this.blue = 0;
    }
    TestProg.led.prototype = new $$Struct('test50.TestProg.led');
    TestProg.led.prototype.$$isAggFld = {};
    TestProg.led.prototype.$$isAggFld.red = false;
    TestProg.led.prototype.$$isAggFld.green = false;
    TestProg.led.prototype.$$isAggFld.blue = false;
    TestProg.led.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        (this.blue) = 7;
        this.$$hostInitLastPass();
        return this;
    }
    TestProg.led.prototype.fcnTest = function() {
        var $$text = '';
        this.$$hostInitLastPass();
        return $$text;
    }
    TestProg.led.prototype.fcnTest1 = function() {
        var $$text = '';
        this.fcnTest();
        this.$$hostInitLastPass();
        return $$text;
    }
    TestProg.led.prototype.$$privateInit = function() {
        this.red = 1;
        this.green = 0;
        this.blue = 0;
    }
    TestProg.led.prototype.$$hostInitLastPass = function() {
    }
    TestProg.test = new $$Ref('test50_TestProg_test__E');
    TestProg.targetInit = new $$Ref('test50_TestProg_targetInit__I');
    TestProg.pollen__run = new $$Ref('test50_TestProg_pollen__run__E');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg.hll = new TestProg.led('test50_TestProg_hll__V'); TestProg.hll.new_host();
        TestProg.leds = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test50_TestProg_leds__A', false); TestProg.leds.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test50.TestProg'].led().new_host(), new $units['test50.TestProg'].led().new_host() ]));
        TestProg.nums = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test50_TestProg_nums__A', false); TestProg.nums.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        TestProg.c_host = new $units['test50.Class1'].Class1('test50_TestProg_c_host__V'); TestProg.c_host.new_host();
        TestProg.j = new TestProg.led('test50_TestProg_j__V'); TestProg.j.new_host();
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test50.Class1'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.xx = 0;
    }
    return TestProg;
}
var $$u = $$c();
$units['test50.TestProg'] = $$u;
$units.push($$u);

