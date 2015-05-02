
/*
 * ======== CLASS test50.Class1 ========
 */

var $$c = function() {
    const Class1 = {};
    Class1.Class1 = Class1
    Class1.$name = 'test50.Class1';
    Class1.pollen$used = 0;
    Class1.Class1$$id = 1;
    Class1.Class1 = function(cn) {
        this.$$id = Class1.Class1$$id++;
        this.$$cname = cn ? cn : 'test50_Class1_Class1__'+this.$$id+'__S';
        this.$$tname = 'test50_Class1_Class1';
        this.$$uname = 'test50.Class1';
        this.z = 7;
        this.x = 7;
    }
    Class1.Class1.prototype = new $$Struct('test50.Class1.Class1');
    Class1.Class1.prototype.$$isAggFld = {};
    Class1.Class1.prototype.$$isAggFld.z = false;
    Class1.Class1.prototype.$$isAggFld.x = false;
    Class1.Class1.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        (this.z) = 2;
        this.classMethod();
        this.$$hostInitLastPass();
        return this;
    }
    Class1.Class1.prototype.classMethod = function() {
        var $$text = '';
        (this.z) = 3;
        this.$$hostInitLastPass();
        return $$text;
    }
    Class1.pollen__uses__ = function() {
    }
    Class1.Class1.prototype.$$privateInit = function() {
        this.z = 7;
        this.x = 7;
    }
    Class1.Class1.prototype.$$hostInitLastPass = function() {
    }
    return Class1;
}
var $$u = $$c();
$units['test50.Class1'] = $$u;
$units.push($$u);

