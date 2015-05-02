
/*
 * ======== CLASS test75.Cls1 ========
 */

var $$c = function() {
    const Cls1 = {};
    Cls1.Cls1 = Cls1
    Cls1.$name = 'test75.Cls1';
    Cls1.pollen$used = 0;
    Cls1.Cls1$$id = 1;
    Cls1.Cls1 = function(cn) {
        this.$$id = Cls1.Cls1$$id++;
        this.$$cname = cn ? cn : 'test75_Cls1_Cls1__'+this.$$id+'__S';
        this.$$tname = 'test75_Cls1_Cls1';
        this.$$uname = 'test75.Cls1';
        this.fld = 7;
    }
    Cls1.Cls1.prototype = new $$Struct('test75.Cls1.Cls1');
    Cls1.Cls1.prototype.$$isAggFld = {};
    Cls1.Cls1.prototype.$$isAggFld.fld = false;
    Cls1.Cls1.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Cls1.pollen__uses__ = function() {
    }
    Cls1.Cls1.prototype.$$privateInit = function() {
        this.fld = 7;
    }
    Cls1.Cls1.prototype.$$hostInitLastPass = function() {
    }
    return Cls1;
}
var $$u = $$c();
$units['test75.Cls1'] = $$u;
$units.push($$u);

