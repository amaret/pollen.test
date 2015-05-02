
/*
 * ======== MODULE test95.Arr ========
 */

var $$c = function() {
    const Arr = {};
    Arr.Arr = Arr
    Arr.$name = 'test95.Arr';
    Arr.pollen$used = 0;
    Arr.Cls$$id = 1;
    Arr.Cls = function(cn) {
        this.$$id = Arr.Cls$$id++;
        this.$$cname = cn ? cn : 'test95_Arr_Cls__'+this.$$id+'__S';
        this.$$tname = 'test95_Arr_Cls';
        this.$$uname = 'test95.Arr';
        this.clsV = 8;
    }
    Arr.Cls.prototype = new $$Struct('test95.Arr.Cls');
    Arr.Cls.prototype.$$isAggFld = {};
    Arr.Cls.prototype.$$isAggFld.clsV = false;
    Arr.Cls.prototype.new_host = function( i ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                (this.clsV) = (i);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Arr.Cls.prototype.$$privateInit = function() {
        this.clsV = 8;
    }
    Arr.Cls.prototype.$$hostInitLastPass = function() {
    }
    Arr.checkAccess = new $$Ref('test95_Arr_checkAccess__E');
    Arr.targetInit = new $$Ref('test95_Arr_targetInit__I');
    Arr.$$hostInit = function() {
        var $$text = '';
        Arr.clsVar = new Arr.Cls('test95_Arr_clsVar__V'); Arr.clsVar.new_host(3);
        Arr.hostBuff_clsObj = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test95_Arr_hostBuff_clsObj__A', false); Arr.hostBuff_clsObj.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test95.Arr'].Cls().new_host(2), new $units['test95.Arr'].Cls().new_host(4) ]));
        return $$text;
    }
    Arr.pollen__uses__ = function() {
    }
    Arr.$$privateInit = function() {
        Arr.sizeHost = 8;
    }
    Arr.$$hostInitLastPass = function() {
        Arr.targBuff_sizeHost = new $$Array((Arr.sizeHost), function($$cn,$$idx){ return 0;}, 'test95_Arr_targBuff_sizeHost__A', false); Arr.targBuff_sizeHost.$$assign((new $$Array((Arr.sizeHost), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1, 1, 1, 1, 1, 1 ]));
    }
    return Arr;
}
var $$u = $$c();
$units['test95.Arr'] = $$u;
$units.push($$u);

