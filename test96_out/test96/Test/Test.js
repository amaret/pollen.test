
/*
 * ======== MODULE test96.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test96.Test';
    Test.pollen$used = 0;
    Test.PrintImpl = $units['test54.PrintImpl'];
    Test.Cls$$id = 1;
    Test.Cls = function(cn) {
        this.$$id = Test.Cls$$id++;
        this.$$cname = cn ? cn : 'test96_Test_Cls__'+this.$$id+'__S';
        this.$$tname = 'test96_Test_Cls';
        this.$$uname = 'test96.Test';
        this.i = 7;
    }
    Test.Cls.prototype = new $$Struct('test96.Test.Cls');
    Test.Cls.prototype.$$isAggFld = {};
    Test.Cls.prototype.$$isAggFld.i = false;
    Test.Cls.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        (this.i) = 1;
        this.$$hostInitLastPass();
        return this;
    }
    Test.Cls.prototype.$$privateInit = function() {
        this.i = 7;
    }
    Test.Cls.prototype.$$hostInitLastPass = function() {
    }
    Test.foo = new $$Ref('test96_Test_foo__E');
    Test.bar = new $$Ref('test96_Test_bar__E');
    Test.fun = new $$Ref('test96_Test_fun__E');
    Test.pollen__run = new $$Ref('test96_Test_pollen__run__E');
    Test.targetInit = new $$Ref('test96_Test_targetInit__I');
    Test.$$hostInit = function() {
        var $$text = '';
        Test.cls = 0;
        Test.host_cls = new Test.Cls('test96_Test_host_cls__V'); Test.host_cls.new_host();
        Test.host_cls2 = new Test.Cls('test96_Test_host_cls2__V'); Test.host_cls2.new_host();
        Test.host_cls3 = new Test.Cls('test96_Test_host_cls3__V'); Test.host_cls3.new_host();
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test96.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test;
}
var $$u = $$c();
$units['test96.Test'] = $$u;
$units.push($$u);

