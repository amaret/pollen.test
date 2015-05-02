
/*
 * ======== MODULE test1.MoreArrays ========
 */

var $$c = function() {
    const MoreArrays = {};
    MoreArrays.MoreArrays = MoreArrays
    MoreArrays.$name = 'test1.MoreArrays';
    MoreArrays.pollen$used = 0;
    MoreArrays.LittleBit$$id = 1;
    MoreArrays.LittleBit = function(cn) {
        this.$$id = MoreArrays.LittleBit$$id++;
        this.$$cname = cn ? cn : 'test1_MoreArrays_LittleBit__'+this.$$id+'__S';
        this.$$tname = 'test1_MoreArrays_LittleBit';
        this.$$uname = 'test1.MoreArrays';
        this.ii = 2;
        this.f = true;
    }
    MoreArrays.LittleBit.prototype = new $$Struct('test1.MoreArrays.LittleBit');
    MoreArrays.LittleBit.prototype.$$isAggFld = {};
    MoreArrays.LittleBit.prototype.$$isAggFld.ii = false;
    MoreArrays.LittleBit.prototype.$$isAggFld.f = false;
    MoreArrays.LittleBit.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    MoreArrays.LittleBit.prototype.$$privateInit = function() {
        this.ii = 2;
        this.f = true;
    }
    MoreArrays.LittleBit.prototype.$$hostInitLastPass = function() {
    }
    MoreArrays.foo = new $$Ref('test1_MoreArrays_foo__E');
    MoreArrays.recieve = new $$Ref('test1_MoreArrays_recieve__I');
    MoreArrays.markUsed = new $$Ref('test1_MoreArrays_markUsed__E');
    MoreArrays.targetInit = new $$Ref('test1_MoreArrays_targetInit__I');
    MoreArrays.chkHostPrint = function() {
        var $$text = '';
        $$printf("test host (javascript) print:\n");
        $$printf("hello! Test a host print with a number: ", (MoreArrays.LEN));
        $$printf((MoreArrays.LEN));
        $$printf("\n");
        $$printf(4.4, " is a real literal.\n");
        $$printf("Now an object: ", (MoreArrays.lf));
        $$printf("\n");
        $$printf("And bool: ", (MoreArrays.lf.f), "\n");
        return $$text;
    }
    MoreArrays.$$hostInit = function() {
        var $$text = '';
        MoreArrays.lf = new MoreArrays.LittleBit('test1_MoreArrays_lf__V'); MoreArrays.lf.new_host();
        MoreArrays.chkHostPrint();
        return $$text;
    }
    MoreArrays.pollen__uses__ = function() {
    }
    MoreArrays.$$privateInit = function() {
        MoreArrays.LEN = 3;
        MoreArrays.len2 = 3;
    }
    MoreArrays.$$hostInitLastPass = function() {
        MoreArrays.arr = new $$Array((MoreArrays.LEN), function($$cn,$$idx){ return 0;}, 'test1_MoreArrays_arr__A', false);
        MoreArrays.arr2 = new $$Array((MoreArrays.len2), function($$cn,$$idx){ return 0;}, 'test1_MoreArrays_arr2__A', false);
    }
    return MoreArrays;
}
var $$u = $$c();
$units['test1.MoreArrays'] = $$u;
$units.push($$u);

