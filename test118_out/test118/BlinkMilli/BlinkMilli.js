
/*
 * ======== MODULE test118.BlinkMilli ========
 */

var $$c = function() {
    const BlinkMilli = {};
    BlinkMilli.BlinkMilli = BlinkMilli
    BlinkMilli.$name = 'test118.BlinkMilli';
    BlinkMilli.pollen$used = 0;
    BlinkMilli.PrintImpl = $units['test54.PrintImpl'];
    BlinkMilli.led$$id = 1;
    BlinkMilli.led = function(cn) {
        this.$$id = BlinkMilli.led$$id++;
        this.$$cname = cn ? cn : 'test118_BlinkMilli_led__'+this.$$id+'__S';
        this.$$tname = 'test118_BlinkMilli_led';
        this.$$uname = 'test118.BlinkMilli';
        this.red = 1;
        this.blue = 0;
    }
    BlinkMilli.led.prototype = new $$Struct('test118.BlinkMilli.led');
    BlinkMilli.led.prototype.$$isAggFld = {};
    BlinkMilli.led.prototype.$$isAggFld.red = false;
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
        this.blue = 0;
    }
    BlinkMilli.led.prototype.$$hostInitLastPass = function() {
    }
    BlinkMilli.foobar = new $$Ref('test118_BlinkMilli_foobar__I');
    BlinkMilli.targetInit = new $$Ref('test118_BlinkMilli_targetInit__E');
    BlinkMilli.test = new $$Ref('test118_BlinkMilli_test__I');
    BlinkMilli.chkArray = new $$Ref('test118_BlinkMilli_chkArray__I');
    BlinkMilli.pollen__run = new $$Ref('test118_BlinkMilli_pollen__run__E');
    BlinkMilli.$$hostInit = function() {
        var $$text = '';
        BlinkMilli.hll = new BlinkMilli.led('test118_BlinkMilli_hll__V'); BlinkMilli.hll.new_host(9);
        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.ledArr = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_ledArr__A', false); BlinkMilli.ledArr.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test118.BlinkMilli'].led().new_host(2), new $units['test118.BlinkMilli'].led().new_host(2) ]));
        BlinkMilli.leds = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_leds__A', false); BlinkMilli.leds.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        BlinkMilli.hostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_hostarr__A', false); BlinkMilli.hostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr__A', false); BlinkMilli.chkarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr2__A', false);
        BlinkMilli.chkarr3 = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr3__A', false); BlinkMilli.chkarr3.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1 ]));
        BlinkMilli.chkarr4 = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr4__A', false); BlinkMilli.chkarr4.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        BlinkMilli.chkarr5 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr5__A', false);
        BlinkMilli.chkarr6 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr6__A', false);
        BlinkMilli.bind();
        return $$text;
    }
    BlinkMilli.bind = function() {
        var $$text = '';
        var nestarr;
        nestarr = (new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]);
        (BlinkMilli.hostarr).set(0, 0);
        (BlinkMilli.hostarr).set(1, 3);
        return $$text;
    }
    BlinkMilli.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    BlinkMilli.$$privateInit = function() {
        BlinkMilli.nonhostVarTest = 9;
        BlinkMilli.hostVarTest2 = 9;
        BlinkMilli.initialBlue = 33;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test118.BlinkMilli'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.leds = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_leds__A', false); BlinkMilli.leds.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        BlinkMilli.chkarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr__A', false); BlinkMilli.chkarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr2__A', false);
        BlinkMilli.chkarr3 = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr3__A', false); BlinkMilli.chkarr3.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1 ]));
        BlinkMilli.chkarr4 = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr4__A', false); BlinkMilli.chkarr4.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        BlinkMilli.chkarr6 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr6__A', false);
    }
    BlinkMilli.$$hostInitLastPass = function() {
        BlinkMilli.chkarr7 = new $$Array((BlinkMilli.hostVarTest2), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr7__A', false);
        BlinkMilli.chkarr8 = new $$Array((BlinkMilli.hostVarTest2), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr8__A', false);
    }
    return BlinkMilli;
}
var $$u = $$c();
$units['test118.BlinkMilli'] = $$u;
$units.push($$u);

