
/*
 * ======== CLASS test1.Cls1 ========
 */

var $$c = function() {
    const Cls1 = {};
    Cls1.Cls1 = Cls1
    Cls1.$name = 'test1.Cls1';
    Cls1.pollen$used = 0;
    Cls1.Cls1$$id = 1;
    Cls1.Cls1 = function(cn) {
        this.$$id = Cls1.Cls1$$id++;
        this.$$cname = cn ? cn : 'test1_Cls1_Cls1__'+this.$$id+'__S';
        this.$$tname = 'test1_Cls1_Cls1';
        this.$$uname = 'test1.Cls1';
        this.red = 1;
        this.green = 0;
        this.blue = 7;
        this.blueInitialValue = 3;
    }
    Cls1.Cls1.prototype = new $$Struct('test1.Cls1.Cls1');
    Cls1.Cls1.prototype.$$isAggFld = {};
    Cls1.Cls1.prototype.$$isAggFld.red = false;
    Cls1.Cls1.prototype.$$isAggFld.green = false;
    Cls1.Cls1.prototype.$$isAggFld.blue = false;
    Cls1.Cls1.prototype.$$isAggFld.blueInitialValue = false;
    Cls1.Cls1.prototype.new_host = function( j ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                if ((this.blueInitialValue) == 3) {
            (this.blue) = (j);
        }
        else {
            (this.blue) = (this.blueInitialValue);
        }
        }
        this.$$hostInitLastPass();
        return this;
    }
    Cls1.pollen__uses__ = function() {
    }
    Cls1.Cls1.prototype.$$privateInit = function() {
        this.red = 1;
        this.green = 0;
        this.blue = 7;
        this.blueInitialValue = 9;
    }
    Cls1.Cls1.prototype.$$hostInitLastPass = function() {
    }
    return Cls1;
}
var $$u = $$c();
$units['test1.Cls1'] = $$u;
$units.push($$u);

