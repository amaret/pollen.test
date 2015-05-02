
/*
 * ======== MODULE test99.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test99.Test';
    Test.pollen$used = 0;
    Test.PrintImpl = $units['test54.PrintImpl'];
    Test.Cls$$id = 1;
    Test.Cls = function(cn) {
        this.$$id = Test.Cls$$id++;
        this.$$cname = cn ? cn : 'test99_Test_Cls__'+this.$$id+'__S';
        this.$$tname = 'test99_Test_Cls';
        this.$$uname = 'test99.Test';
        this.i = 7;
    }
    Test.Cls.prototype = new $$Struct('test99.Test.Cls');
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
    Test.foo = new $$Ref('test99_Test_foo__E');
    Test.targetInit = new $$Ref('test99_Test_targetInit__I');
    Test.pollen__run = new $$Ref('test99_Test_pollen__run__E');
    Test.$$hostInit = function() {
        var $$text = '';
        Test.cls = 0;
        Test.arrClsHost = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test99_Test_arrClsHost__A', false); Test.arrClsHost.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test99.Test'].Cls().new_host(), new $units['test99.Test'].Cls().new_host(), new $units['test99.Test'].Cls().new_host() ]));
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test99.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test;
}
var $$u = $$c();
$units['test99.Test'] = $$u;
$units.push($$u);

