
/*
 * ======== MODULE test2.BlinkMilli2 ========
 */

var $$c = function() {
    const BlinkMilli2 = {};
    BlinkMilli2.BlinkMilli2 = BlinkMilli2
    BlinkMilli2.$name = 'test2.BlinkMilli2';
    BlinkMilli2.pollen$used = 0;
    BlinkMilli2.HostChk = $units['test2.HostChk'];
    BlinkMilli2.TimerMilli = $units['pollen.time.TimerMilli'];
    BlinkMilli2.TT = $units['test2.TT'];
    BlinkMilli2.nestClass$$id = 1;
    BlinkMilli2.nestClass = function(cn) {
        this.$$id = BlinkMilli2.nestClass$$id++;
        this.$$cname = cn ? cn : 'test2_BlinkMilli2_nestClass__'+this.$$id+'__S';
        this.$$tname = 'test2_BlinkMilli2_nestClass';
        this.$$uname = 'test2.BlinkMilli2';
    }
    BlinkMilli2.nestClass.prototype = new $$Struct('test2.BlinkMilli2.nestClass');
    BlinkMilli2.nestClass.prototype.$$isAggFld = {};
    BlinkMilli2.nestClass.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    BlinkMilli2.nestClass.prototype.$$privateInit = function() {
    }
    BlinkMilli2.nestClass.prototype.$$hostInitLastPass = function() {
    }
    BlinkMilli2.State_UNINITIALIZED = 0;
    BlinkMilli2.State_INITIALIZATION = 1;
    BlinkMilli2.State_ACTIVE = 2;
    BlinkMilli2.State_IDLE = 3;
    BlinkMilli2.State_ERROR = 5;
    BlinkMilli2.switch_test = new $$Ref('test2_BlinkMilli2_switch_test__E');
    BlinkMilli2.foo = new $$Ref('test2_BlinkMilli2_foo__E');
    BlinkMilli2.bar = new $$Ref('test2_BlinkMilli2_bar__E');
    BlinkMilli2.pollen__run = new $$Ref('test2_BlinkMilli2_pollen__run__E');
    BlinkMilli2.pollen__reset = new $$Ref('test2_BlinkMilli2_pollen__reset__E');
    BlinkMilli2.targetInit = new $$Ref('test2_BlinkMilli2_targetInit__I');
    BlinkMilli2.toggle = function() {
        var $$text = '';
        var lowValue;
        lowValue = true;
        (BlinkMilli2.chk) = 2;
        (BlinkMilli2.chk2) = 3;
        $units['test2.TT'].get();
        return $$text;
    }
    BlinkMilli2.$$hostInit = function() {
        var $$text = '';
        BlinkMilli2.arr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test2_BlinkMilli2_arr__A', false); BlinkMilli2.arr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        return $$text;
    }
    BlinkMilli2.pollen__uses__ = function() {
        $$bind($units['test2.TT'], 'pollen$used', true);
    }
    BlinkMilli2.$$privateInit = function() {
        BlinkMilli2.chk = 3;
        BlinkMilli2.chk2 = 2;
        BlinkMilli2.gref = new $$Ref('pollen_interfaces_Led_toggle__I');
        BlinkMilli2.fref = new $$Ref('pollen_interfaces_Led_on__I');
    }
    return BlinkMilli2;
}
var $$u = $$c();
$units['test2.BlinkMilli2'] = $$u;
$units.push($$u);

