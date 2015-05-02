
/*
 * ======== MODULE test1.ShortClassAccessInModule ========
 */

var $$c = function() {
    const ShortClassAccessInModule = {};
    ShortClassAccessInModule.ShortClassAccessInModule = ShortClassAccessInModule
    ShortClassAccessInModule.$name = 'test1.ShortClassAccessInModule';
    ShortClassAccessInModule.pollen$used = 0;
    ShortClassAccessInModule.Foo$$id = 1;
    ShortClassAccessInModule.Foo = function(cn) {
        this.$$id = ShortClassAccessInModule.Foo$$id++;
        this.$$cname = cn ? cn : 'test1_ShortClassAccessInModule_Foo__'+this.$$id+'__S';
        this.$$tname = 'test1_ShortClassAccessInModule_Foo';
        this.$$uname = 'test1.ShortClassAccessInModule';
        this.data = 0;
    }
    ShortClassAccessInModule.Foo.prototype = new $$Struct('test1.ShortClassAccessInModule.Foo');
    ShortClassAccessInModule.Foo.prototype.$$isAggFld = {};
    ShortClassAccessInModule.Foo.prototype.$$isAggFld.data = false;
    ShortClassAccessInModule.Foo.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    ShortClassAccessInModule.Foo.prototype.$$privateInit = function() {
        this.data = 0;
    }
    ShortClassAccessInModule.Foo.prototype.$$hostInitLastPass = function() {
    }
    ShortClassAccessInModule.markUsed = new $$Ref('test1_ShortClassAccessInModule_markUsed__E');
    ShortClassAccessInModule.targetInit = new $$Ref('test1_ShortClassAccessInModule_targetInit__I');
    ShortClassAccessInModule.RGBMatrixLed = function( rcolumn, rrow, gcolumn, grow, bcolumn, brow ) {
        var $$text = '';
        return $$text;
    }
    ShortClassAccessInModule.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    ShortClassAccessInModule.pollen__uses__ = function() {
    }
    ShortClassAccessInModule.$$privateInit = function() {
    }
    return ShortClassAccessInModule;
}
var $$u = $$c();
$units['test1.ShortClassAccessInModule'] = $$u;
$units.push($$u);

