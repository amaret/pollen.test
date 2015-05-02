
/*
 * ======== MODULE test97.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test97.Test';
    Test.pollen$used = 0;
    Test.PrintImpl = $units['test54.PrintImpl'];
    Test.Cls$$id = 1;
    Test.Cls = function(cn) {
        this.$$id = Test.Cls$$id++;
        this.$$cname = cn ? cn : 'test97_Test_Cls__'+this.$$id+'__S';
        this.$$tname = 'test97_Test_Cls';
        this.$$uname = 'test97.Test';
        this.i = 7;
    }
    Test.Cls.prototype = new $$Struct('test97.Test.Cls');
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
    Test.targetInit = new $$Ref('test97_Test_targetInit__I');
    Test.bar = new $$Ref('test97_Test_bar__E');
    Test.fun = new $$Ref('test97_Test_fun__E');
    Test.pollen__run = new $$Ref('test97_Test_pollen__run__E');
    Test.$$hostInit = function() {
        var $$text = '';
        Test.cls = 0;
        Test.host_cls = new Test.Cls('test97_Test_host_cls__V'); Test.host_cls.new_host();
        Test.host_cls2 = new Test.Cls('test97_Test_host_cls2__V'); Test.host_cls2.new_host();
        Test.host_cls3 = new Test.Cls('test97_Test_host_cls3__V'); Test.host_cls3.new_host();
        Test.arrClsTarg = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test97_Test_arrClsTarg__A', false);
        Test.arrClsHost = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test97_Test_arrClsHost__A', false); Test.arrClsHost.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test97.Test'].Cls().new_host(), new $units['test97.Test'].Cls().new_host(), new $units['test97.Test'].Cls().new_host() ]));
        Test.arrClsTargNoDim = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test97_Test_arrClsTargNoDim__A', false);
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test97.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

        Test.arrClsTarg = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test97_Test_arrClsTarg__A', false);
        Test.arrClsTargNoDim = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test97_Test_arrClsTargNoDim__A', false);
    }
    return Test;
}
var $$u = $$c();
$units['test97.Test'] = $$u;
$units.push($$u);

