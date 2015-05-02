
/*
 * ======== MODULE test1.BlinkMilli ========
 */

var $$c = function() {
    const BlinkMilli = {};
    BlinkMilli.BlinkMilli = BlinkMilli
    BlinkMilli.$name = 'test1.BlinkMilli';
    BlinkMilli.pollen$used = 0;
    BlinkMilli.GImod = $units['test1.GlobalInterrupts'];
    BlinkMilli.SwitchTest = $units['test1.SwitchTest'];
    BlinkMilli.Cls1 = $units['test1.Cls1'];
    BlinkMilli.Cls2 = $units['test1.Cls2'];
    BlinkMilli.Cls3 = $units['test1.Cls3'];
    BlinkMilli.ModFix = $units['test1.ModFix'];
    BlinkMilli.MoreArrays = $units['test1.MoreArrays'];
    BlinkMilli.ArrayAssign = $units['test1.ArrayAssign'];
    BlinkMilli.ShortClassAccessInModule = $units['test1.ShortClassAccessInModule'];
    BlinkMilli.led$$id = 1;
    BlinkMilli.led = function(cn) {
        this.$$id = BlinkMilli.led$$id++;
        this.$$cname = cn ? cn : 'test1_BlinkMilli_led__'+this.$$id+'__S';
        this.$$tname = 'test1_BlinkMilli_led';
        this.$$uname = 'test1.BlinkMilli';
        this.red = 1;
        this.green = 0;
        this.blue = 0;
    }
    BlinkMilli.led.prototype = new $$Struct('test1.BlinkMilli.led');
    BlinkMilli.led.prototype.$$isAggFld = {};
    BlinkMilli.led.prototype.$$isAggFld.red = false;
    BlinkMilli.led.prototype.$$isAggFld.green = false;
    BlinkMilli.led.prototype.$$isAggFld.blue = false;
    BlinkMilli.led.prototype.new_host = function( j ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                (this.blue) = (j);
        }
        this.$$hostInitLastPass();
        return this;
    }
    BlinkMilli.led.prototype.$$privateInit = function() {
        this.red = 1;
        this.green = 0;
        this.blue = 0;
    }
    BlinkMilli.led.prototype.$$hostInitLastPass = function() {
    }
    BlinkMilli.foobar = new $$Ref('test1_BlinkMilli_foobar__I');
    BlinkMilli.targetInit = new $$Ref('test1_BlinkMilli_targetInit__E');
    BlinkMilli.put = new $$Ref('test1_BlinkMilli_put__I');
    BlinkMilli.test_str = new $$Ref('test1_BlinkMilli_test_str__I');
    BlinkMilli.test = new $$Ref('test1_BlinkMilli_test__I');
    BlinkMilli.chkArray = new $$Ref('test1_BlinkMilli_chkArray__I');
    BlinkMilli.pollen__run = new $$Ref('test1_BlinkMilli_pollen__run__E');
    BlinkMilli.markUsed = new $$Ref('test1_BlinkMilli_markUsed__I');
    BlinkMilli.fooby = function() {
        var $$text = '';
        (BlinkMilli.myVar) = 3;
        return(  7  );
        return $$text;
    }
    BlinkMilli.$$hostInit = function() {
        var $$text = '';
        BlinkMilli.myVarArr = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_myVarArr__A', false); BlinkMilli.myVarArr.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ BlinkMilli.fooby(), BlinkMilli.fooby(), (BlinkMilli.myVar) ]));
        BlinkMilli.hll = new BlinkMilli.led('test1_BlinkMilli_hll__V'); BlinkMilli.hll.new_host(9);
        BlinkMilli.testNest = new $units['test1.Cls3'].Cls3('test1_BlinkMilli_testNest__V'); BlinkMilli.testNest.new_host();
        BlinkMilli.testcls2 = new $units['test1.Cls2'].Cls2('test1_BlinkMilli_testcls2__V'); BlinkMilli.testcls2.new_host();
        BlinkMilli.ledArr = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_ledArr__A', false); BlinkMilli.ledArr.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test1.BlinkMilli'].led().new_host(2), new $units['test1.BlinkMilli'].led().new_host(2) ]));
        BlinkMilli.leds = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_leds__A', false); BlinkMilli.leds.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        BlinkMilli.hostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_hostarr__A', false); BlinkMilli.hostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr__A', false); BlinkMilli.chkarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr2__A', false);
        BlinkMilli.chkarr3 = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr3__A', false); BlinkMilli.chkarr3.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1 ]));
        BlinkMilli.chkarr4 = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr4__A', false); BlinkMilli.chkarr4.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        BlinkMilli.hostarr2d = new $$Array(8, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_hostarr2d__A', false);
        BlinkMilli.chkarr5 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr5__A', false);
        BlinkMilli.chkarr6 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr6__A', false);
        BlinkMilli.ccc = new $units['test1.Cls1'].Cls1('test1_BlinkMilli_ccc__V'); BlinkMilli.ccc.new_host((BlinkMilli.initialBlue));
        (BlinkMilli.nonhostVarTest) = $units['test1.GlobalInterrupts'].getHostVar();
        BlinkMilli.bindGlobalInterrupts();
        $units['test1.GlobalInterrupts'].setHostVar(2);
        return $$text;
    }
    BlinkMilli.hput = function( i ) {
        var $$text = '';
        return $$text;
    }
    BlinkMilli.bindGlobalInterrupts = function() {
        var $$text = '';
        var nesthostarr;
        var i;
        var $$v = 'test1_GlobalInterrupts';
        var $$s = $$bind($units['test1.BlinkMilli'], 'gi', $$v);{ $$v.pollen$used = true;
        $units['test1.GlobalInterrupts'].pollen$used = true;}


        nesthostarr = (new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]);
        (BlinkMilli.hostarr).set(0, 0);
        (BlinkMilli.hostarr).set(1, 3);
        i = 0;
        (i) = (BlinkMilli.hostarr.get((i)++));
        BlinkMilli.hput((BlinkMilli.hostarr.get((i)++)));
        $units['test1.GlobalInterrupts'].setHostVar(7);
        return $$text;
    }
    BlinkMilli.pollen__uses__ = function() {
        $$bind($units['test1.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['test1.Cls1'], 'pollen$used', true);
        $$bind($units['test1.SwitchTest'], 'pollen$used', true);
        $$bind($units['test1.Cls2'], 'pollen$used', true);
        $$bind($units['test1.Cls3'], 'pollen$used', true);
        $$bind($units['test1.ModFix'], 'pollen$used', true);
        $$bind($units['test1.MoreArrays'], 'pollen$used', true);
        $$bind($units['test1.ArrayAssign'], 'pollen$used', true);
        $$bind($units['test1.ShortClassAccessInModule'], 'pollen$used', true);
    }
    BlinkMilli.$$privateInit = function() {
        BlinkMilli.myVar = 1;
        BlinkMilli.gi = 0;
        BlinkMilli.nonhostVarTest = 9;
        BlinkMilli.hostVarTest2 = 9;
        BlinkMilli.hostVarNotRefdInTarget = 3;
        BlinkMilli.hostVarRefdInTarget = 4;
        BlinkMilli.thing = "yy";
        BlinkMilli.initialBlue = 33;
        BlinkMilli.leds = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_leds__A', false); BlinkMilli.leds.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr__A', false); BlinkMilli.chkarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr2__A', false);
        BlinkMilli.chkarr3 = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr3__A', false); BlinkMilli.chkarr3.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1 ]));
        BlinkMilli.chkarr4 = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr4__A', false); BlinkMilli.chkarr4.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        BlinkMilli.chkarr6 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr6__A', false);
    }
    BlinkMilli.$$hostInitLastPass = function() {
        BlinkMilli.chkarr7 = new $$Array((BlinkMilli.hostVarTest2), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr7__A', false);
        BlinkMilli.chkarr8 = new $$Array((BlinkMilli.hostVarTest2), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr8__A', false);
    }
    return BlinkMilli;
}
var $$u = $$c();
$units['test1.BlinkMilli'] = $$u;
$units.push($$u);

