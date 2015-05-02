
/*
 * ======== prologue ========
 */

function $$alignof() {
	return arguments.length > 0 ? arguments[0][1] : 0
}

function $$printf() {
    var out = Packages.com.amaret.pollen.parser.ParseUnit.current().getOutputStream();

    var res = [];
    var result = "";

    for (var i = 0; i < arguments.length; i++) {
        var a = arguments[i]
        if (typeof a == 'number') {
            a = Math.round(a) == a ? java.lang.Long(a) : java.lang.Double(a)
        }
        else if (typeof a == 'object' && a != null) {
            a = a.toString()
        }
	result += a
    }
    res.push(result);
    out.printf.apply(out, res)
}
function debug_line(where, obj) {
        //$$printf("DBG:" + where + " for unit " + obj.$name + "\n")
}
function debug(where, obj) {
        
        //$$printf("DBG:" + where + " for unit " + obj.$name + "\n")

                // old:
        //var names = "";
        //for (var name in obj) {
        //      names += "   DBG:" + name + ": ";
        //      names += obj[name] + '\n';
        //
        //$$printf(names)
}

// obj is the unit
// sel is the field in unit being assigned to
// val is the assigned value
function $$bind( obj, sel, val ) {

    debug_line("entering $$bind ", obj)

    if (!('$$bound' in obj)) {
        obj.$$bound = {};
    }
    if (!obj.$$bound[sel]) {
        obj[sel] = val;
        obj.$$bound[sel] = true;
        debug_line("...in $$bind, set " + sel + " to " + val, obj)

    }
    debug_line("exiting $$bind ", obj)

    return obj[sel];
}

function $$sizeof() {
	var a0 = -1
	var sz = 0
	var d
	for (var i = 0; i < arguments.length; i++) {
		var ti = arguments[i]
		if (a0 == -1) {
			a0 = ti[1];
		}
        if ((d = sz % ti[1]) != 0) {
            sz += ti[1] - d;
        }
        sz += ti[0];
	}
    if ((d = sz % a0) != 0) {
        sz += a0 - d;
    }
    return sz
}

function $$Array( dim, baseD, cname, aggFlg ) {
    this.$$baseD = baseD;
    this.$$category = '$$Array';
    this.$$dim = dim
    this.$$elems = [];
    this.$$cname = cname
    this.$$aggFlg = aggFlg
    if (dim > 0) {
        for (var i = 0; i < dim; i++) {
            this.$$elems[i] = this.$$baseD(this.$$cname, i);
        }
    }
    this.$$len = this.$$elems.length
    this.$$virgin = (this.$$len == 0)
}

$$Array.prototype.$$assign = function( arr ) {
    var src = arr instanceof Array ? arr : arr instanceof $$Array ? arr.$$elems : [];
    var dst = this.$$elems;
    this.length = src.length;
    this.extend();
    for (var i = 0; i < this.$$len; i++) {
        if (i == src.length) break;
        if (this.$$aggFlg) {
            dst[i].$$assign(src[i]);
        }
        else {
            dst[i] = src[i];
        }
    }
    return this;
}

$$Array.prototype.extend = function() {
    if (this.$$dim < 0 && this.$$len > this.$$elems.length) {
        for (var k = this.$$elems.length; k < this.$$len; k++) {
            this.$$elems[k] = this.$$baseD(this.$$cname, k);
        }
    }
    this.$$virgin = false;
}
    

$$Array.prototype.get = function( idx ) {
    this.extend()
    return this.$$elems[idx];
}

$$Array.prototype.set = function ( idx, val ) {
    if (idx < 0 || idx >= this.$$len) {
        return undefined;
    }
    if (this.$$virgin) {
        this.extend();
    }
    return (this.$$elems[idx] = val);
}

$$Array.prototype.toString = function() {
    if (this.$$virgin && this.$$len > 0) {
        return '[...' + this.$$len + ']';
    }
    var res = '[';
    var sep = '';
    for (var i = 0; i < this.$$len; i++) {
        res += sep + this.$$elems[i].toString();
        sep = ",";
    }
    return res + ']';
}

$$Array.prototype.__defineGetter__('length', function() {
    return this.$$len;
})

$$Array.prototype.__defineSetter__('length', function( len ) {
    if (this.$$dim < 0 && len > this.$$len) {
        this.$$len = len;
    }
    return this.$$len;
})

$$Array.$$idx = 1

function $$Struct( qn ) {
    this.$$category = '$$Struct';
    this.$$qname = qn;
}

$$Struct.prototype.$$assign = function( str ) {
    for (var fld in this) {
        if (str[fld] === undefined) {
            continue;
        }
        var isAgg = this.$$isAggFld[fld];
        if (isAgg === false) {
            this[fld] = str[fld];
        }
        else if (isAgg === true) {
            this[fld].$$assign(str[fld]);
        }
    }
    return this
}

$$Struct.prototype.toString = function() {
    return "struct " + this.$$qname;
}

// used for functions
function $$Ref( t ) {
    this.$$category = '$$Ref';
    this.$$text = t;
}

function $$Struct( qn ) {
    this.$$category = '$$Struct';
    this.$$qname = qn;
}

$$Struct.prototype.$$assign = function( str ) {
    for (var fld in this) {
        if (str[fld] === undefined) {
            continue;
        }
        var isAgg = this.$$isAggFld[fld];
        if (isAgg === false) {
            this[fld] = str[fld];
        }
        else if (isAgg === true) {
            this[fld].$$assign(str[fld]);
        }
    }
    return this
}

$$Struct.prototype.toString = function() {
    return "struct " + this.$$qname;
}

// legacy, unused. 
// In Em, triggered by '&' Em operator.
$$Ref.prototype.toString = function() {
    return "&" + this.$$text;
}

const $units = [];

/*
 * ======== pollen.hardware.SleepWakeProtocol ========
 */

var $$c = function() {
    const SleepWakeProtocol = {};
    SleepWakeProtocol.SleepWakeProtocol = SleepWakeProtocol
    SleepWakeProtocol.$name = 'pollen.hardware.SleepWakeProtocol';
    SleepWakeProtocol.pollen$used = 0;
    SleepWakeProtocol.$$privateInit = function() {
    }
    return SleepWakeProtocol;
}
var $$u = $$c();
$units['pollen.hardware.SleepWakeProtocol'] = $$u;
$units.push($$u);


/*
 * ======== pollen.utils.DynamicMemoryProtocol ========
 */

var $$c = function() {
    const DynamicMemoryProtocol = {};
    DynamicMemoryProtocol.DynamicMemoryProtocol = DynamicMemoryProtocol
    DynamicMemoryProtocol.$name = 'pollen.utils.DynamicMemoryProtocol';
    DynamicMemoryProtocol.pollen$used = 0;
    DynamicMemoryProtocol.$$privateInit = function() {
    }
    return DynamicMemoryProtocol;
}
var $$u = $$c();
$units['pollen.utils.DynamicMemoryProtocol'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test62.ArrMod ========
 */

var $$c = function() {
    const ArrMod = {};
    ArrMod.ArrMod = ArrMod
    ArrMod.$name = 'test62.ArrMod';
    ArrMod.pollen$used = 0;
    ArrMod.targetInit = new $$Ref('test62_ArrMod_targetInit__I');
    ArrMod.$$hostInit = function() {
        var $$text = '';
        ArrMod.targBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_targBuff_sizeTarg__A', false);
        ArrMod.hostBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_hostBuff_sizeTarg__A', false);
        ArrMod.err_targBuff_sizeTarg = new $$Array((ArrMod.errsizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_targBuff_sizeTarg__A', false);
        ArrMod.err_hostBuff_sizeTarg = new $$Array((ArrMod.errsizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_hostBuff_sizeTarg__A', false);
        $$printf("hostInit ArrMod() (after privateInit, after preset Initializer):\n");
        $$printf(" sizeHost ", (ArrMod.sizeHost), "\n");
        $$printf("   init on dcln to 8\n");
        $$printf(" sizeTarg ", (ArrMod.sizeTarg), "\n");
        $$printf("   init on dcln to 6\n");
        $$printf(" errsizeHost ", (ArrMod.errsizeHost), "\n");
        $$printf("   init on dcln to 7\n");
        $$printf(" errsizeTarg ", (ArrMod.errsizeTarg), "\n");
        $$printf("   init on dcln to 5\n");
        return $$text;
    }
    ArrMod.sizes = function() {
        var $$text = '';
        $$printf("sizes ArrMod() (after privateInit, after preset Initializer):\n");
        $$printf(" sizeHost ", (ArrMod.sizeHost), "\n");
        $$printf("   init on dcln to 8\n");
        $$printf(" sizeTarg ", (ArrMod.sizeTarg), "\n");
        $$printf("   init on dcln to 6\n");
        $$printf(" errsizeHost ", (ArrMod.errsizeHost), "\n");
        $$printf("   init on dcln to 7\n");
        $$printf(" errsizeTarg ", (ArrMod.errsizeTarg), "\n");
        $$printf("   init on dcln to 5\n");
        return $$text;
    }
    ArrMod.pollen__uses__ = function() {
    }
    ArrMod.$$privateInit = function() {
        ArrMod.sizeHost = 8;
        ArrMod.sizeTarg = 6;
        ArrMod.errsizeHost = 7;
        ArrMod.errsizeTarg = 5;
        ArrMod.targBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_targBuff_sizeTarg__A', false);
        ArrMod.err_targBuff_sizeTarg = new $$Array((ArrMod.errsizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_targBuff_sizeTarg__A', false);
    }
    ArrMod.$$hostInitLastPass = function() {
        ArrMod.targBuff_sizeHost = new $$Array((ArrMod.sizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_targBuff_sizeHost__A', false);
        ArrMod.hostBuff_sizeHost = new $$Array((ArrMod.sizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_hostBuff_sizeHost__A', false);
        ArrMod.err_targBuff_sizeHost = new $$Array((ArrMod.errsizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_targBuff_sizeHost__A', false);
        ArrMod.err_hostBuff_sizeHost = new $$Array((ArrMod.errsizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_hostBuff_sizeHost__A', false);
    }
    return ArrMod;
}
var $$u = $$c();
$units['test62.ArrMod'] = $$u;
$units.push($$u);


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


/*
 * ======== COMPOSITION test62.ArrConfig ========
 */

var $$c = function() {
    const ArrConfig = {};
    ArrConfig.ArrConfig = ArrConfig
    ArrConfig.$name = 'test62.ArrConfig';
    ArrConfig.pollen$used = 0;
    ArrConfig.ArrMod = $units['test62.ArrMod'];
    ArrConfig.ArrCls = $units['test62.ArrCls'];
    ArrConfig.pollen__presets__ = function() {
        var $$text = '';
        $$printf("running ArrConfig() preset...\n");
        ($units['test62.ArrMod'].sizeHost) = 16;
        ($units['test62.ArrMod'].sizeTarg) = 20;
        ($units['test62.ArrMod'].errsizeHost) = ArrConfig.size();
        ($units['test62.ArrMod'].errsizeTarg) = ArrConfig.size();
        ($units['test62.ArrCls'].cls_sizeHost) = 24;
        ($units['test62.ArrCls'].cls_sizeTarg) = 28;
        ($units['test62.ArrCls'].err_cls_sizeHost) = ArrConfig.size();
        ($units['test62.ArrCls'].err_cls_sizeTarg) = ArrConfig.size();
        $$printf("DONE ArrConfig() preset...\n");
        return $$text;
    }
    ArrConfig.size = function() {
        var $$text = '';
        return(  16  );
        return $$text;
    }
    return ArrConfig;
}
var $$u = $$c();
$units['test62.ArrConfig'] = $$u;
$units.push($$u);


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


/*
 * ======== pollen.output.PrintProtocol ========
 */

var $$c = function() {
    const PrintProtocol = {};
    PrintProtocol.PrintProtocol = PrintProtocol
    PrintProtocol.$name = 'pollen.output.PrintProtocol';
    PrintProtocol.pollen$used = 0;
    PrintProtocol.$$privateInit = function() {
    }
    return PrintProtocol;
}
var $$u = $$c();
$units['pollen.output.PrintProtocol'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test61.PrintImpl ========
 */

var $$c = function() {
    const PrintImpl = {};
    PrintImpl.PrintImpl = PrintImpl
    PrintImpl.$name = 'test61.PrintImpl';
    PrintImpl.pollen$used = 0;
    PrintImpl.printBool = new $$Ref('test61_PrintImpl_printBool__E');
    PrintImpl.printInt = new $$Ref('test61_PrintImpl_printInt__E');
    PrintImpl.printReal = new $$Ref('test61_PrintImpl_printReal__E');
    PrintImpl.printUint = new $$Ref('test61_PrintImpl_printUint__E');
    PrintImpl.printStr = new $$Ref('test61_PrintImpl_printStr__E');
    PrintImpl.targetInit = new $$Ref('test61_PrintImpl_targetInit__I');
    PrintImpl.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    PrintImpl.pollen__uses__ = function() {
    }
    PrintImpl.$$privateInit = function() {
    }
    return PrintImpl;
}
var $$u = $$c();
$units['test61.PrintImpl'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test62.Test ========
 */

var $$c = function() {
    const Test = {};
    Test.Test = Test
    Test.$name = 'test62.Test';
    Test.pollen$used = 0;
    Test.ArrMod = $units['test62.ArrMod'];
    Test.ArrHostDim = $units['test62.ArrHostDim'];
    Test.ArrCls = $units['test62.ArrCls'];
    Test.PrintImpl = $units['test61.PrintImpl'];
    Test.pollen__run = new $$Ref('test62_Test_pollen__run__E');
    Test.targetInit = new $$Ref('test62_Test_targetInit__I');
    Test.$$hostInit = function() {
        var $$text = '';
        Test.ac = new $units['test62.ArrCls'].ArrCls('test62_Test_ac__V'); Test.ac.new_host();
        Test.cls = new $units['test62.ArrHostDim'].ClsHostDim('test62_Test_cls__V'); Test.cls.new_host();
        $units['test62.ArrMod'].sizes();
        $units['test62.ArrHostDim'].sizes();
        Test.cls.sizes();
        $units['test62.ArrHostDim'].sizes();
        Test.ac.sizes();
        return $$text;
    }
    Test.pollen__uses__ = function() {
        $$bind($units['test62.ArrMod'], 'pollen$used', true);
        $$bind($units['test62.ArrCls'], 'pollen$used', true);
        $$bind($units['test62.ArrHostDim'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    Test.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test62.Test'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return Test;
}
var $$u = $$c();
$units['test62.Test'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test62.Test'].pollen$used = true;

// note that the first loop runs twice. This was needed
// because a later occurring module used an earlier occurring
// module. Complex code may require more work to resolve 
// uses: could iterate the array until there is a pass where
// no new uses are discovered.
for (var i = $units.length - 1; i >= 0; i--) {
    var u = $units[i];
    if (u.pollen$used && 'pollen__uses__' in u) {
        debug_line("  pollen__uses__ ", u)
        u.pollen__uses__();
    }
}
for (var i = $units.length - 1; i >= 0; i--) {
    var u = $units[i];
    if (u.pollen$used && 'pollen__uses__' in u) {
        debug_line("  pollen__uses__ pass 2", u)
        u.pollen__uses__();
    }
}

for (var i = $units.length - 1; i >= 0; i--) {
    var u = $units[i];
    if ('$$privateInit' in u) {
        debug_line("  privateInit ", u)
        u.$$privateInit();
    }
}

for (var i = $units.length - 1; i >= 0; i--) {
    var u = $units[i];
    if ('pollen__presets__' in u) {
        debug_line("  pollen__presets ", u)
        u.pollen__presets__();
    }
}
// note that the order below calls main_unit hostInit last
// this causes the more top level composition initializers to 
// run last, thus taking precedence.
for (var i = 0; i < $units.length;  i++) {
//for (var i = $units.length - 1; i >= 0; i--) {
    var u = $units[i];
    if ('$$hostInit' in u) {
        debug_line("  HOST INIT ", u)
        u.$$hostInit();
    }
}
for (var i = $units.length - 1; i >= 0; i--) {
    var u = $units[i];
    if ('$$hostInitLastPass' in u) {
        debug_line("  HOST INIT LAST PASS ", u)
        u.$$hostInitLastPass();
    }
}
