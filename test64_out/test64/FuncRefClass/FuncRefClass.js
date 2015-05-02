
/*
 * ======== CLASS test64.FuncRefClass ========
 */

var $$c = function() {
    const FuncRefClass = {};
    FuncRefClass.FuncRefClass = FuncRefClass
    FuncRefClass.$name = 'test64.FuncRefClass';
    FuncRefClass.pollen$used = 0;
    FuncRefClass.FuncRefClass$$id = 1;
    FuncRefClass.FuncRefClass = function(cn) {
        this.$$id = FuncRefClass.FuncRefClass$$id++;
        this.$$cname = cn ? cn : 'test64_FuncRefClass_FuncRefClass__'+this.$$id+'__S';
        this.$$tname = 'test64_FuncRefClass_FuncRefClass';
        this.$$uname = 'test64.FuncRefClass';
        this.myHandler = 0;
    }
    FuncRefClass.FuncRefClass.prototype = new $$Struct('test64.FuncRefClass.FuncRefClass');
    FuncRefClass.FuncRefClass.prototype.$$isAggFld = {};
    FuncRefClass.FuncRefClass.prototype.$$isAggFld.myHandler = false;
    FuncRefClass.FuncRefClass.prototype.new_host = function( h ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                this.myHandler = (h);
        }
        this.$$hostInitLastPass();
        return this;
    }
    FuncRefClass.FuncRefClass.prototype.setHandlerOnHost = function( h ) {
        var $$text = '';
        this.myHandler = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    FuncRefClass.pollen__uses__ = function() {
    }
    FuncRefClass.FuncRefClass.prototype.$$privateInit = function() {
    }
    FuncRefClass.FuncRefClass.prototype.$$hostInitLastPass = function() {
    }
    return FuncRefClass;
}
var $$u = $$c();
$units['test64.FuncRefClass'] = $$u;
$units.push($$u);

