
/*
 * ======== MODULE test117.ArrayReturn ========
 */

var $$c = function() {
    const ArrayReturn = {};
    ArrayReturn.ArrayReturn = ArrayReturn
    ArrayReturn.$name = 'test117.ArrayReturn';
    ArrayReturn.pollen$used = 0;
    ArrayReturn.Cls1$$id = 1;
    ArrayReturn.Cls1 = function(cn) {
        this.$$id = ArrayReturn.Cls1$$id++;
        this.$$cname = cn ? cn : 'test117_ArrayReturn_Cls1__'+this.$$id+'__S';
        this.$$tname = 'test117_ArrayReturn_Cls1';
        this.$$uname = 'test117.ArrayReturn';
        this.cVar = 99;
    }
    ArrayReturn.Cls1.prototype = new $$Struct('test117.ArrayReturn.Cls1');
    ArrayReturn.Cls1.prototype.$$isAggFld = {};
    ArrayReturn.Cls1.prototype.$$isAggFld.cVar = false;
    ArrayReturn.Cls1.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    ArrayReturn.Cls1.prototype.$$privateInit = function() {
        this.cVar = 99;
    }
    ArrayReturn.Cls1.prototype.$$hostInitLastPass = function() {
    }
    ArrayReturn.foofoo1 = new $$Ref('test117_ArrayReturn_foofoo1__I');
    ArrayReturn.foofoo2 = new $$Ref('test117_ArrayReturn_foofoo2__I');
    ArrayReturn.bar = new $$Ref('test117_ArrayReturn_bar__E');
    ArrayReturn.targetInit = new $$Ref('test117_ArrayReturn_targetInit__I');
    ArrayReturn.$$hostInit = function() {
        var $$text = '';
        ArrayReturn.arrCls1Ref = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test117_ArrayReturn_arrCls1Ref__A', false); ArrayReturn.arrCls1Ref.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null ]));
        ArrayReturn.arrCls1Inst = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test117_ArrayReturn_arrCls1Inst__A', false); ArrayReturn.arrCls1Inst.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test117.ArrayReturn'].Cls1().new_host() ]));
        return $$text;
    }
    ArrayReturn.pollen__uses__ = function() {
    }
    ArrayReturn.$$privateInit = function() {
        ArrayReturn.arrCls1Ref = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test117_ArrayReturn_arrCls1Ref__A', false); ArrayReturn.arrCls1Ref.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null ]));
    }
    return ArrayReturn;
}
var $$u = $$c();
$units['test117.ArrayReturn'] = $$u;
$units.push($$u);

