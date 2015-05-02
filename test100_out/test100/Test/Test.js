
/*
 * ======== MODULE test100.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test100.Test';
    Test.pollen$used = 0;
    Test.PrintImpl = $units['test54.PrintImpl'];
    Test.Elem$$id = 1;
    Test.Elem = function(cn) {
        this.$$id = Test.Elem$$id++;
        this.$$cname = cn ? cn : 'test100_Test_Elem__'+this.$$id+'__S';
        this.$$tname = 'test100_Test_Elem';
        this.$$uname = 'test100.Test';
        this.el = 1;
    }
    Test.Elem.prototype = new $$Struct('test100.Test.Elem');
    Test.Elem.prototype.$$isAggFld = {};
    Test.Elem.prototype.$$isAggFld.el = false;
    Test.Elem.prototype.new_host = function( p ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                (this.el) = (p);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Test.Elem.prototype.$$privateInit = function() {
        this.el = 1;
    }
    Test.Elem.prototype.$$hostInitLastPass = function() {
    }
    Test.Cls$$id = 1;
    Test.Cls = function(cn) {
        this.$$id = Test.Cls$$id++;
        this.$$cname = cn ? cn : 'test100_Test_Cls__'+this.$$id+'__S';
        this.$$tname = 'test100_Test_Cls';
        this.$$uname = 'test100.Test';
        this.i = 7;
    }
    Test.Cls.prototype = new $$Struct('test100.Test.Cls');
    Test.Cls.prototype.$$isAggFld = {};
    Test.Cls.prototype.$$isAggFld.i = false;
    Test.Cls.prototype.$$isAggFld.localElemHost = true;
    Test.Cls.prototype.$$isAggFld.efld = false;
    Test.Cls.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.localElemHost = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test100_Test_localElemHost__A', false); this.localElemHost.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test100.Test'].Elem().new_host(2), new $units['test100.Test'].Elem().new_host(2), new $units['test100.Test'].Elem().new_host(2) ]));
        this.efld = new $units['test100.Test'].Elem('test100_Test_efld__V'); this.efld.new_host(3);
        (this.i) = 1;
        this.$$hostInitLastPass();
        return this;
    }
    Test.Cls.prototype.$$privateInit = function() {
        this.i = 7;
    }
    Test.Cls.prototype.$$hostInitLastPass = function() {
    }
    Test.foo = new $$Ref('test100_Test_foo__E');
    Test.targetInit = new $$Ref('test100_Test_targetInit__I');
    Test.pollen__run = new $$Ref('test100_Test_pollen__run__E');
    Test.$$hostInit = function() {
        var $$text = '';
        Test.cls = 0;
        Test.arrClsHost = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test100_Test_arrClsHost__A', false); Test.arrClsHost.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test100.Test'].Cls().new_host(), new $units['test100.Test'].Cls().new_host(), new $units['test100.Test'].Cls().new_host() ]));
        Test.arrClsTarg = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test100_Test_arrClsTarg__A', false); Test.arrClsTarg.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test100.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

        Test.arrClsTarg = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test100_Test_arrClsTarg__A', false); Test.arrClsTarg.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
    }
    return Test;
}
var $$u = $$c();
$units['test100.Test'] = $$u;
$units.push($$u);

