
/*
 * ======== MODULE test62.ArrHostDim ========
 */

var $$c = function() {
    const ArrHostDim = {};
    ArrHostDim.ArrHostDim = ArrHostDim
    ArrHostDim.$name = 'test62.ArrHostDim';
    ArrHostDim.pollen$used = 0;
    ArrHostDim.ClsHostDim$$id = 1;
    ArrHostDim.ClsHostDim = function(cn) {
        this.$$id = ArrHostDim.ClsHostDim$$id++;
        this.$$cname = cn ? cn : 'test62_ArrHostDim_ClsHostDim__'+this.$$id+'__S';
        this.$$tname = 'test62_ArrHostDim_ClsHostDim';
        this.$$uname = 'test62.ArrHostDim';
        this.sizeHost3 = 7;
    }
    ArrHostDim.ClsHostDim.prototype = new $$Struct('test62.ArrHostDim.ClsHostDim');
    ArrHostDim.ClsHostDim.prototype.$$isAggFld = {};
    ArrHostDim.ClsHostDim.prototype.$$isAggFld.targBuff_sizeHost3 = true;
    ArrHostDim.ClsHostDim.prototype.$$isAggFld.sizeHost3 = false;
    ArrHostDim.ClsHostDim.prototype.incSize = function( curSize ) {
        var $$text = '';
        return(  (curSize) + 5  );
        this.$$hostInitLastPass();
        return $$text;
    }
    ArrHostDim.ClsHostDim.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        $$printf("hostInit ClsHostDim() (after privateInit) :\n");
        $$printf(" sizeHost3 ", (this.sizeHost3), "\n");
        $$printf("   (should be 7)\n");
        (this.sizeHost3) = this.incSize((this.sizeHost3));
        (this.sizeHost3) = this.incSize((this.sizeHost3));
        $$printf("hostInit ClsHostDim() (after calling incSize) :\n");
        $$printf(" sizeHost3 ", (this.sizeHost3), "\n");
        $$printf("   (should be 17)\n");
        this.$$hostInitLastPass();
        return this;
    }
    ArrHostDim.ClsHostDim.prototype.sizes = function() {
        var $$text = '';
        $$printf("sizes ClsHostDim() (after privateInit, after incSize):\n");
        $$printf(" sizeHost3 ", (this.sizeHost3), "\n");
        this.$$hostInitLastPass();
        return $$text;
    }
    ArrHostDim.ClsHostDim.prototype.$$privateInit = function() {
        this.sizeHost3 = 7;
    }
    ArrHostDim.ClsHostDim.prototype.$$hostInitLastPass = function() {
        this.targBuff_sizeHost3 = new $$Array((this.sizeHost3), function($$cn,$$idx){ return 0;}, 'test62_ArrHostDim_targBuff_sizeHost3__A', false);
    }
    ArrHostDim.targetInit = new $$Ref('test62_ArrHostDim_targetInit__I');
    ArrHostDim.incSize = function( curSize ) {
        var $$text = '';
        return(  (curSize) + 4  );
        return $$text;
    }
    ArrHostDim.$$hostInit = function() {
        var $$text = '';
        ArrHostDim.cls = new ArrHostDim.ClsHostDim('test62_ArrHostDim_cls__V'); ArrHostDim.cls.new_host();
        $$printf("hostInit ArrHostDim() (after privateInit) :\n");
        $$printf(" sizeHost2 ", (ArrHostDim.sizeHost2), "\n");
        $$printf("   (should be 8)\n");
        (ArrHostDim.sizeHost2) = ArrHostDim.incSize((ArrHostDim.sizeHost2));
        (ArrHostDim.sizeHost2) = ArrHostDim.incSize((ArrHostDim.sizeHost2));
        $$printf("hostInit ArrHostDim() (after calling incSize) :\n");
        $$printf(" sizeHost2 ", (ArrHostDim.sizeHost2), "\n");
        $$printf("   (should be 16)\n");
        return $$text;
    }
    ArrHostDim.sizes = function() {
        var $$text = '';
        $$printf("sizes ArrHostDim() (after privateInit, after incSize):\n");
        $$printf(" sizeHost2 ", (ArrHostDim.sizeHost2), "\n");
        return $$text;
    }
    ArrHostDim.pollen__uses__ = function() {
    }
    ArrHostDim.$$privateInit = function() {
        ArrHostDim.sizeHost2 = 8;
    }
    ArrHostDim.$$hostInitLastPass = function() {
        ArrHostDim.targBuff_sizeHost2 = new $$Array((ArrHostDim.sizeHost2), function($$cn,$$idx){ return 0;}, 'test62_ArrHostDim_targBuff_sizeHost2__A', false);
    }
    return ArrHostDim;
}
var $$u = $$c();
$units['test62.ArrHostDim'] = $$u;
$units.push($$u);

