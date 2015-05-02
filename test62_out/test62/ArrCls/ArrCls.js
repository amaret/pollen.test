
/*
 * ======== CLASS test62.ArrCls ========
 */

var $$c = function() {
    const ArrCls = {};
    ArrCls.ArrCls = ArrCls
    ArrCls.$name = 'test62.ArrCls';
    ArrCls.pollen$used = 0;
    ArrCls.ArrCls$$id = 1;
    ArrCls.ArrCls = function(cn) {
        this.$$id = ArrCls.ArrCls$$id++;
        this.$$cname = cn ? cn : 'test62_ArrCls_ArrCls__'+this.$$id+'__S';
        this.$$tname = 'test62_ArrCls_ArrCls';
        this.$$uname = 'test62.ArrCls';
        this.cls_sizeHost = 4;
        this.cls_sizeTarg = 2;
        this.err_cls_sizeHost = 1;
        this.err_cls_sizeTarg = 3;
    }
    ArrCls.ArrCls.prototype = new $$Struct('test62.ArrCls.ArrCls');
    ArrCls.ArrCls.prototype.$$isAggFld = {};
    ArrCls.ArrCls.prototype.$$isAggFld.cls_sizeHost = false;
    ArrCls.ArrCls.prototype.$$isAggFld.cls_sizeTarg = false;
    ArrCls.ArrCls.prototype.$$isAggFld.err_cls_sizeHost = false;
    ArrCls.ArrCls.prototype.$$isAggFld.err_cls_sizeTarg = false;
    ArrCls.ArrCls.prototype.$$isAggFld.targBuff_sizeHost = true;
    ArrCls.ArrCls.prototype.$$isAggFld.targBuff_sizeTarg = true;
    ArrCls.ArrCls.prototype.$$isAggFld.hostBuff_sizeHost = true;
    ArrCls.ArrCls.prototype.$$isAggFld.hostBuff_sizeTarg = true;
    ArrCls.ArrCls.prototype.$$isAggFld.err_targBuff_sizeHost = true;
    ArrCls.ArrCls.prototype.$$isAggFld.err_targBuff_sizeTarg = true;
    ArrCls.ArrCls.prototype.$$isAggFld.err_hostBuff_sizeHost = true;
    ArrCls.ArrCls.prototype.$$isAggFld.err_hostBuff_sizeTarg = true;
    ArrCls.ArrCls.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.targBuff_sizeTarg = new $$Array((this.cls_sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_targBuff_sizeTarg__A', false);
        this.hostBuff_sizeTarg = new $$Array((this.cls_sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_hostBuff_sizeTarg__A', false);
        this.err_targBuff_sizeTarg = new $$Array((this.err_cls_sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_err_targBuff_sizeTarg__A', false);
        this.err_hostBuff_sizeTarg = new $$Array((this.err_cls_sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_err_hostBuff_sizeTarg__A', false);
        $$printf("hostInit ArrCls() (after privateInit, before preset Initializer):\n");
        $$printf(" cls_sizeHost ", (this.cls_sizeHost), "\n");
        $$printf("   init on dcln to 4\n");
        $$printf(" cls_sizeTarg ", (this.cls_sizeTarg), "\n");
        $$printf("   init on dcln to 2\n");
        $$printf(" err_cls_sizeHost ", (this.err_cls_sizeHost), "\n");
        $$printf("   init on dcln to 4\n");
        $$printf(" err_cls_sizeTarg ", (this.err_cls_sizeTarg), "\n");
        $$printf("   init on dcln to 2\n");
        this.$$hostInitLastPass();
        return this;
    }
    ArrCls.ArrCls.prototype.sizes = function() {
        var $$text = '';
        $$printf("sizes ArrCls() (after privateInit, after preset Initializer):\n");
        $$printf(" cls_sizeHost ", (this.cls_sizeHost), "\n");
        $$printf("   init on dcln to 4\n");
        $$printf(" cls_sizeTarg ", (this.cls_sizeTarg), "\n");
        $$printf("   init on dcln to 2\n");
        $$printf(" err_cls_sizeHost ", (this.err_cls_sizeHost), "\n");
        $$printf("   init on dcln to 4\n");
        $$printf(" err_cls_sizeTarg ", (this.err_cls_sizeTarg), "\n");
        $$printf("   init on dcln to 2\n");
        this.$$hostInitLastPass();
        return $$text;
    }
    ArrCls.pollen__uses__ = function() {
    }
    ArrCls.ArrCls.prototype.$$privateInit = function() {
        this.cls_sizeHost = 24;
        this.cls_sizeTarg = 28;
        this.err_cls_sizeHost = 1;
        this.err_cls_sizeTarg = 3;
        this.targBuff_sizeTarg = new $$Array((this.cls_sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_targBuff_sizeTarg__A', false);
        this.err_targBuff_sizeTarg = new $$Array((this.err_cls_sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_err_targBuff_sizeTarg__A', false);
    }
    ArrCls.ArrCls.prototype.$$hostInitLastPass = function() {
        this.targBuff_sizeHost = new $$Array((this.cls_sizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_targBuff_sizeHost__A', false);
        this.hostBuff_sizeHost = new $$Array((this.cls_sizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_hostBuff_sizeHost__A', false);
        this.err_targBuff_sizeHost = new $$Array((this.err_cls_sizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_err_targBuff_sizeHost__A', false);
        this.err_hostBuff_sizeHost = new $$Array((this.err_cls_sizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrCls_err_hostBuff_sizeHost__A', false);
    }
    return ArrCls;
}
var $$u = $$c();
$units['test62.ArrCls'] = $$u;
$units.push($$u);

