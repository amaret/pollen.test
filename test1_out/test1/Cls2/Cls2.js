
/*
 * ======== CLASS test1.Cls2 ========
 */

var $$c = function() {
    const Cls2 = {};
    Cls2.Cls2 = Cls2
    Cls2.$name = 'test1.Cls2';
    Cls2.pollen$used = 0;
    Cls2.Cls2$$id = 1;
    Cls2.Cls2 = function(cn) {
        this.$$id = Cls2.Cls2$$id++;
        this.$$cname = cn ? cn : 'test1_Cls2_Cls2__'+this.$$id+'__S';
        this.$$tname = 'test1_Cls2_Cls2';
        this.$$uname = 'test1.Cls2';
        this.us = 3;
        this.ticksPerUs = 100;
    }
    Cls2.Cls2.prototype = new $$Struct('test1.Cls2.Cls2');
    Cls2.Cls2.prototype.$$isAggFld = {};
    Cls2.Cls2.prototype.$$isAggFld.us = false;
    Cls2.Cls2.prototype.$$isAggFld.ticksPerUs = false;
    Cls2.Cls2.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Cls2.pollen__uses__ = function() {
    }
    Cls2.Cls2.prototype.$$privateInit = function() {
        this.us = 3;
        this.ticksPerUs = 100;
    }
    Cls2.Cls2.prototype.$$hostInitLastPass = function() {
    }
    return Cls2;
}
var $$u = $$c();
$units['test1.Cls2'] = $$u;
$units.push($$u);

