
/*
 * ======== CLASS test116.C1 ========
 */

var $$c = function() {
    const C1 = {};
    C1.C1 = C1
    C1.$name = 'test116.C1';
    C1.pollen$used = 0;
    C1.C1$$id = 1;
    C1.C1 = function(cn) {
        this.$$id = C1.C1$$id++;
        this.$$cname = cn ? cn : 'test116_C1_C1__'+this.$$id+'__S';
        this.$$tname = 'test116_C1_C1';
        this.$$uname = 'test116.C1';
        this.c = 0;
    }
    C1.C1.prototype = new $$Struct('test116.C1.C1');
    C1.C1.prototype.$$isAggFld = {};
    C1.C1.prototype.$$isAggFld.c = false;
    C1.C1.prototype.new_host = function( x ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                (this.c) = (x);
        }
        this.$$hostInitLastPass();
        return this;
    }
    C1.pollen__uses__ = function() {
    }
    C1.C1.prototype.$$privateInit = function() {
        this.c = 0;
    }
    C1.C1.prototype.$$hostInitLastPass = function() {
    }
    return C1;
}
var $$u = $$c();
$units['test116.C1'] = $$u;
$units.push($$u);

