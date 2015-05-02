
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
 * ======== CLASS test1.Cls1 ========
 */

var $$c = function() {
    const Cls1 = {};
    Cls1.Cls1 = Cls1
    Cls1.$name = 'test1.Cls1';
    Cls1.pollen$used = 0;
    Cls1.Cls1$$id = 1;
    Cls1.Cls1 = function(cn) {
        this.$$id = Cls1.Cls1$$id++;
        this.$$cname = cn ? cn : 'test1_Cls1_Cls1__'+this.$$id+'__S';
        this.$$tname = 'test1_Cls1_Cls1';
        this.$$uname = 'test1.Cls1';
        this.red = 1;
        this.green = 0;
        this.blue = 7;
        this.blueInitialValue = 3;
    }
    Cls1.Cls1.prototype = new $$Struct('test1.Cls1.Cls1');
    Cls1.Cls1.prototype.$$isAggFld = {};
    Cls1.Cls1.prototype.$$isAggFld.red = false;
    Cls1.Cls1.prototype.$$isAggFld.green = false;
    Cls1.Cls1.prototype.$$isAggFld.blue = false;
    Cls1.Cls1.prototype.$$isAggFld.blueInitialValue = false;
    Cls1.Cls1.prototype.new_host = function( j ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                if ((this.blueInitialValue) == 3) {
            (this.blue) = (j);
        }
        else {
            (this.blue) = (this.blueInitialValue);
        }
        }
        this.$$hostInitLastPass();
        return this;
    }
    Cls1.pollen__uses__ = function() {
    }
    Cls1.Cls1.prototype.$$privateInit = function() {
        this.red = 1;
        this.green = 0;
        this.blue = 7;
        this.blueInitialValue = 9;
    }
    Cls1.Cls1.prototype.$$hostInitLastPass = function() {
    }
    return Cls1;
}
var $$u = $$c();
$units['test1.Cls1'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION test1.ComposPreset ========
 */

var $$c = function() {
    const ComposPreset = {};
    ComposPreset.ComposPreset = ComposPreset
    ComposPreset.$name = 'test1.ComposPreset';
    ComposPreset.pollen$used = 0;
    ComposPreset.Cls1 = $units['test1.Cls1'];
    ComposPreset.pollen__presets__ = function() {
        var $$text = '';
        ($units['test1.Cls1'].blueInitialValue) = 9;
        return $$text;
    }
    ComposPreset.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    return ComposPreset;
}
var $$u = $$c();
$units['test1.ComposPreset'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test1.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'test1.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.disable = new $$Ref('test1_GlobalInterrupts_disable__E');
    GlobalInterrupts.enable = new $$Ref('test1_GlobalInterrupts_enable__E');
    GlobalInterrupts.markUsed = new $$Ref('test1_GlobalInterrupts_markUsed__E');
    GlobalInterrupts.targetInit = new $$Ref('test1_GlobalInterrupts_targetInit__I');
    GlobalInterrupts.GlobalInterupts = function() {
        var $$text = '';
        (GlobalInterrupts.hostVar) = 3;
        return $$text;
    }
    GlobalInterrupts.getHostVar = function() {
        var $$text = '';
        return(  (GlobalInterrupts.hostVar)  );
        return $$text;
    }
    GlobalInterrupts.setHostVar = function( n ) {
        var $$text = '';
        (GlobalInterrupts.hostVar) = (n);
        return $$text;
    }
    GlobalInterrupts.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    GlobalInterrupts.pollen__uses__ = function() {
        $$bind($units['test1.Cls1'], 'pollen$used', true);
    }
    GlobalInterrupts.$$privateInit = function() {
        GlobalInterrupts.hostVar = 4;
        GlobalInterrupts.giVar = 0;
    }
    return GlobalInterrupts;
}
var $$u = $$c();
$units['test1.GlobalInterrupts'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test1.SwitchTest ========
 */

var $$c = function() {
    const SwitchTest = {};
    SwitchTest.SwitchTest = SwitchTest
    SwitchTest.$name = 'test1.SwitchTest';
    SwitchTest.pollen$used = 0;
    SwitchTest.State_UNINITIALIZED = 0;
    SwitchTest.State_INITIALIZATION = 1;
    SwitchTest.State_ACTIVE = 2;
    SwitchTest.State_IDLE = 3;
    SwitchTest.State_ERROR = 4;
    SwitchTest.switch_test = new $$Ref('test1_SwitchTest_switch_test__E');
    SwitchTest.targetInit = new $$Ref('test1_SwitchTest_targetInit__I');
    SwitchTest.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    SwitchTest.pollen__uses__ = function() {
    }
    SwitchTest.$$privateInit = function() {
    }
    return SwitchTest;
}
var $$u = $$c();
$units['test1.SwitchTest'] = $$u;
$units.push($$u);


/*
 * ======== CLASS test1.Cls2 ========
 */

var $$c = function() {
    const Cls2 = {};
    Cls2.Cls2 = Cls2
    Cls2.$name = 'test1.Cls2';
    Cls2.pollen$used = 0;
    Cls2.Cls2$$id = 1;
    Cls2.Cls2 = function(cn) {
        this.$$id = Cls2.Cls2$$id++;
        this.$$cname = cn ? cn : 'test1_Cls2_Cls2__'+this.$$id+'__S';
        this.$$tname = 'test1_Cls2_Cls2';
        this.$$uname = 'test1.Cls2';
        this.us = 3;
        this.ticksPerUs = 100;
    }
    Cls2.Cls2.prototype = new $$Struct('test1.Cls2.Cls2');
    Cls2.Cls2.prototype.$$isAggFld = {};
    Cls2.Cls2.prototype.$$isAggFld.us = false;
    Cls2.Cls2.prototype.$$isAggFld.ticksPerUs = false;
    Cls2.Cls2.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Cls2.pollen__uses__ = function() {
    }
    Cls2.Cls2.prototype.$$privateInit = function() {
        this.us = 3;
        this.ticksPerUs = 100;
    }
    Cls2.Cls2.prototype.$$hostInitLastPass = function() {
    }
    return Cls2;
}
var $$u = $$c();
$units['test1.Cls2'] = $$u;
$units.push($$u);


/*
 * ======== CLASS test1.Cls3 ========
 */

var $$c = function() {
    const Cls3 = {};
    Cls3.Cls3 = Cls3
    Cls3.$name = 'test1.Cls3';
    Cls3.pollen$used = 0;
    Cls3.GImod = $units['test1.GlobalInterrupts'];
    Cls3.Cls2 = $units['test1.Cls2'];
    Cls3.Cls4$$id = 1;
    Cls3.Cls4 = function(cn) {
        this.$$id = Cls3.Cls4$$id++;
        this.$$cname = cn ? cn : 'test1_Cls3_Cls4__'+this.$$id+'__S';
        this.$$tname = 'test1_Cls3_Cls4';
        this.$$uname = 'test1.Cls3';
        this.i = 7;
        this.gi_class_nest = 0;
    }
    Cls3.Cls4.prototype = new $$Struct('test1.Cls3.Cls4');
    Cls3.Cls4.prototype.$$isAggFld = {};
    Cls3.Cls4.prototype.$$isAggFld.i = false;
    Cls3.Cls4.prototype.$$isAggFld.gi_class_nest = false;
    Cls3.Cls4.prototype.new_host = function( p ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                (this.i) = (p);
                var $$v = 'test1_GlobalInterrupts';
        var $$s = $$bind($units['test1.Cls3'], 'Cls4.gi_class_nest', $$v);{ $$v.pollen$used = true;
        $units['test1.GlobalInterrupts'].pollen$used = true;}


        }
        this.$$hostInitLastPass();
        return this;
    }
    Cls3.Cls4.prototype.$$privateInit = function() {
        this.i = 7;
        this.gi_class_nest = 0;
    }
    Cls3.Cls4.prototype.$$hostInitLastPass = function() {
    }
    Cls3.Cls3$$id = 1;
    Cls3.Cls3 = function(cn) {
        this.$$id = Cls3.Cls3$$id++;
        this.$$cname = cn ? cn : 'test1_Cls3_Cls3__'+this.$$id+'__S';
        this.$$tname = 'test1_Cls3_Cls3';
        this.$$uname = 'test1.Cls3';
        this.gi_class = 0;
    }
    Cls3.Cls3.prototype = new $$Struct('test1.Cls3.Cls3');
    Cls3.Cls3.prototype.$$isAggFld = {};
    Cls3.Cls3.prototype.$$isAggFld.gi_class = false;
    Cls3.Cls3.prototype.$$isAggFld.c1 = false;
    Cls3.Cls3.prototype.$$isAggFld.c2 = false;
    Cls3.Cls3.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.c1 = new $units['test1.Cls3'].Cls4('test1_Cls3_c1__V'); this.c1.new_host(3);
        this.c2 = new $units['test1.Cls2'].Cls2('test1_Cls3_c2__V');
        (this.c2) = new $units['test1.Cls2'].Cls2().new_host();
        var $$v = 'test1_GlobalInterrupts';
        var $$s = $$bind($units['test1.Cls3'], 'gi_class', $$v);{ $$v.pollen$used = true;
        $units['test1.GlobalInterrupts'].pollen$used = true;}


        this.$$hostInitLastPass();
        return this;
    }
    Cls3.pollen__uses__ = function() {
        $$bind($units['test1.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['test1.Cls2'], 'pollen$used', true);
    }
    Cls3.Cls3.prototype.$$privateInit = function() {
        this.gi_class = 0;
    }
    Cls3.Cls3.prototype.$$hostInitLastPass = function() {
    }
    return Cls3;
}
var $$u = $$c();
$units['test1.Cls3'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test1.ModFix ========
 */

var $$c = function() {
    const ModFix = {};
    ModFix.ModFix = ModFix
    ModFix.$name = 'test1.ModFix';
    ModFix.pollen$used = 0;
    ModFix.foo = new $$Ref('test1_ModFix_foo__I');
    ModFix.markUsed = new $$Ref('test1_ModFix_markUsed__E');
    ModFix.targetInit = new $$Ref('test1_ModFix_targetInit__I');
    ModFix.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    ModFix.pollen__uses__ = function() {
    }
    ModFix.$$privateInit = function() {
    }
    return ModFix;
}
var $$u = $$c();
$units['test1.ModFix'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test1.MoreArrays ========
 */

var $$c = function() {
    const MoreArrays = {};
    MoreArrays.MoreArrays = MoreArrays
    MoreArrays.$name = 'test1.MoreArrays';
    MoreArrays.pollen$used = 0;
    MoreArrays.LittleBit$$id = 1;
    MoreArrays.LittleBit = function(cn) {
        this.$$id = MoreArrays.LittleBit$$id++;
        this.$$cname = cn ? cn : 'test1_MoreArrays_LittleBit__'+this.$$id+'__S';
        this.$$tname = 'test1_MoreArrays_LittleBit';
        this.$$uname = 'test1.MoreArrays';
        this.ii = 2;
        this.f = true;
    }
    MoreArrays.LittleBit.prototype = new $$Struct('test1.MoreArrays.LittleBit');
    MoreArrays.LittleBit.prototype.$$isAggFld = {};
    MoreArrays.LittleBit.prototype.$$isAggFld.ii = false;
    MoreArrays.LittleBit.prototype.$$isAggFld.f = false;
    MoreArrays.LittleBit.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    MoreArrays.LittleBit.prototype.$$privateInit = function() {
        this.ii = 2;
        this.f = true;
    }
    MoreArrays.LittleBit.prototype.$$hostInitLastPass = function() {
    }
    MoreArrays.foo = new $$Ref('test1_MoreArrays_foo__E');
    MoreArrays.recieve = new $$Ref('test1_MoreArrays_recieve__I');
    MoreArrays.markUsed = new $$Ref('test1_MoreArrays_markUsed__E');
    MoreArrays.targetInit = new $$Ref('test1_MoreArrays_targetInit__I');
    MoreArrays.chkHostPrint = function() {
        var $$text = '';
        $$printf("test host (javascript) print:\n");
        $$printf("hello! Test a host print with a number: ", (MoreArrays.LEN));
        $$printf((MoreArrays.LEN));
        $$printf("\n");
        $$printf(4.4, " is a real literal.\n");
        $$printf("Now an object: ", (MoreArrays.lf));
        $$printf("\n");
        $$printf("And bool: ", (MoreArrays.lf.f), "\n");
        return $$text;
    }
    MoreArrays.$$hostInit = function() {
        var $$text = '';
        MoreArrays.lf = new MoreArrays.LittleBit('test1_MoreArrays_lf__V'); MoreArrays.lf.new_host();
        MoreArrays.chkHostPrint();
        return $$text;
    }
    MoreArrays.pollen__uses__ = function() {
    }
    MoreArrays.$$privateInit = function() {
        MoreArrays.LEN = 3;
        MoreArrays.len2 = 3;
    }
    MoreArrays.$$hostInitLastPass = function() {
        MoreArrays.arr = new $$Array((MoreArrays.LEN), function($$cn,$$idx){ return 0;}, 'test1_MoreArrays_arr__A', false);
        MoreArrays.arr2 = new $$Array((MoreArrays.len2), function($$cn,$$idx){ return 0;}, 'test1_MoreArrays_arr2__A', false);
    }
    return MoreArrays;
}
var $$u = $$c();
$units['test1.MoreArrays'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test1.ArrayAssign ========
 */

var $$c = function() {
    const ArrayAssign = {};
    ArrayAssign.ArrayAssign = ArrayAssign
    ArrayAssign.$name = 'test1.ArrayAssign';
    ArrayAssign.pollen$used = 0;
    ArrayAssign.bar = new $$Ref('test1_ArrayAssign_bar__I');
    ArrayAssign.foo = new $$Ref('test1_ArrayAssign_foo__I');
    ArrayAssign.pollen__run = new $$Ref('test1_ArrayAssign_pollen__run__E');
    ArrayAssign.markUsed = new $$Ref('test1_ArrayAssign_markUsed__E');
    ArrayAssign.targetInit = new $$Ref('test1_ArrayAssign_targetInit__I');
    ArrayAssign.$$hostInit = function() {
        var $$text = '';
        ArrayAssign.buffer = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test1_ArrayAssign_buffer__A', false);
        return $$text;
    }
    ArrayAssign.pollen__uses__ = function() {
    }
    ArrayAssign.$$privateInit = function() {
        ArrayAssign.buffer = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test1_ArrayAssign_buffer__A', false);
    }
    return ArrayAssign;
}
var $$u = $$c();
$units['test1.ArrayAssign'] = $$u;
$units.push($$u);


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


/*
 * ======== MODULE test1.BlinkMilli ========
 */

var $$c = function() {
    const BlinkMilli = {};
    BlinkMilli.BlinkMilli = BlinkMilli
    BlinkMilli.$name = 'test1.BlinkMilli';
    BlinkMilli.pollen$used = 0;
    BlinkMilli.GImod = $units['test1.GlobalInterrupts'];
    BlinkMilli.SwitchTest = $units['test1.SwitchTest'];
    BlinkMilli.Cls1 = $units['test1.Cls1'];
    BlinkMilli.Cls2 = $units['test1.Cls2'];
    BlinkMilli.Cls3 = $units['test1.Cls3'];
    BlinkMilli.ModFix = $units['test1.ModFix'];
    BlinkMilli.MoreArrays = $units['test1.MoreArrays'];
    BlinkMilli.ArrayAssign = $units['test1.ArrayAssign'];
    BlinkMilli.ShortClassAccessInModule = $units['test1.ShortClassAccessInModule'];
    BlinkMilli.led$$id = 1;
    BlinkMilli.led = function(cn) {
        this.$$id = BlinkMilli.led$$id++;
        this.$$cname = cn ? cn : 'test1_BlinkMilli_led__'+this.$$id+'__S';
        this.$$tname = 'test1_BlinkMilli_led';
        this.$$uname = 'test1.BlinkMilli';
        this.red = 1;
        this.green = 0;
        this.blue = 0;
    }
    BlinkMilli.led.prototype = new $$Struct('test1.BlinkMilli.led');
    BlinkMilli.led.prototype.$$isAggFld = {};
    BlinkMilli.led.prototype.$$isAggFld.red = false;
    BlinkMilli.led.prototype.$$isAggFld.green = false;
    BlinkMilli.led.prototype.$$isAggFld.blue = false;
    BlinkMilli.led.prototype.new_host = function( j ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                (this.blue) = (j);
        }
        this.$$hostInitLastPass();
        return this;
    }
    BlinkMilli.led.prototype.$$privateInit = function() {
        this.red = 1;
        this.green = 0;
        this.blue = 0;
    }
    BlinkMilli.led.prototype.$$hostInitLastPass = function() {
    }
    BlinkMilli.foobar = new $$Ref('test1_BlinkMilli_foobar__I');
    BlinkMilli.targetInit = new $$Ref('test1_BlinkMilli_targetInit__E');
    BlinkMilli.put = new $$Ref('test1_BlinkMilli_put__I');
    BlinkMilli.test_str = new $$Ref('test1_BlinkMilli_test_str__I');
    BlinkMilli.test = new $$Ref('test1_BlinkMilli_test__I');
    BlinkMilli.chkArray = new $$Ref('test1_BlinkMilli_chkArray__I');
    BlinkMilli.pollen__run = new $$Ref('test1_BlinkMilli_pollen__run__E');
    BlinkMilli.markUsed = new $$Ref('test1_BlinkMilli_markUsed__I');
    BlinkMilli.fooby = function() {
        var $$text = '';
        (BlinkMilli.myVar) = 3;
        return(  7  );
        return $$text;
    }
    BlinkMilli.$$hostInit = function() {
        var $$text = '';
        BlinkMilli.myVarArr = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_myVarArr__A', false); BlinkMilli.myVarArr.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ BlinkMilli.fooby(), BlinkMilli.fooby(), (BlinkMilli.myVar) ]));
        BlinkMilli.hll = new BlinkMilli.led('test1_BlinkMilli_hll__V'); BlinkMilli.hll.new_host(9);
        BlinkMilli.testNest = new $units['test1.Cls3'].Cls3('test1_BlinkMilli_testNest__V'); BlinkMilli.testNest.new_host();
        BlinkMilli.testcls2 = new $units['test1.Cls2'].Cls2('test1_BlinkMilli_testcls2__V'); BlinkMilli.testcls2.new_host();
        BlinkMilli.ledArr = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_ledArr__A', false); BlinkMilli.ledArr.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test1.BlinkMilli'].led().new_host(2), new $units['test1.BlinkMilli'].led().new_host(2) ]));
        BlinkMilli.leds = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_leds__A', false); BlinkMilli.leds.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        BlinkMilli.hostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_hostarr__A', false); BlinkMilli.hostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr__A', false); BlinkMilli.chkarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr2__A', false);
        BlinkMilli.chkarr3 = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr3__A', false); BlinkMilli.chkarr3.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1 ]));
        BlinkMilli.chkarr4 = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr4__A', false); BlinkMilli.chkarr4.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        BlinkMilli.hostarr2d = new $$Array(8, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_hostarr2d__A', false);
        BlinkMilli.chkarr5 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr5__A', false);
        BlinkMilli.chkarr6 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr6__A', false);
        BlinkMilli.ccc = new $units['test1.Cls1'].Cls1('test1_BlinkMilli_ccc__V'); BlinkMilli.ccc.new_host((BlinkMilli.initialBlue));
        (BlinkMilli.nonhostVarTest) = $units['test1.GlobalInterrupts'].getHostVar();
        BlinkMilli.bindGlobalInterrupts();
        $units['test1.GlobalInterrupts'].setHostVar(2);
        return $$text;
    }
    BlinkMilli.hput = function( i ) {
        var $$text = '';
        return $$text;
    }
    BlinkMilli.bindGlobalInterrupts = function() {
        var $$text = '';
        var nesthostarr;
        var i;
        var $$v = 'test1_GlobalInterrupts';
        var $$s = $$bind($units['test1.BlinkMilli'], 'gi', $$v);{ $$v.pollen$used = true;
        $units['test1.GlobalInterrupts'].pollen$used = true;}


        nesthostarr = (new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]);
        (BlinkMilli.hostarr).set(0, 0);
        (BlinkMilli.hostarr).set(1, 3);
        i = 0;
        (i) = (BlinkMilli.hostarr.get((i)++));
        BlinkMilli.hput((BlinkMilli.hostarr.get((i)++)));
        $units['test1.GlobalInterrupts'].setHostVar(7);
        return $$text;
    }
    BlinkMilli.pollen__uses__ = function() {
        $$bind($units['test1.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['test1.Cls1'], 'pollen$used', true);
        $$bind($units['test1.SwitchTest'], 'pollen$used', true);
        $$bind($units['test1.Cls2'], 'pollen$used', true);
        $$bind($units['test1.Cls3'], 'pollen$used', true);
        $$bind($units['test1.ModFix'], 'pollen$used', true);
        $$bind($units['test1.MoreArrays'], 'pollen$used', true);
        $$bind($units['test1.ArrayAssign'], 'pollen$used', true);
        $$bind($units['test1.ShortClassAccessInModule'], 'pollen$used', true);
    }
    BlinkMilli.$$privateInit = function() {
        BlinkMilli.myVar = 1;
        BlinkMilli.gi = 0;
        BlinkMilli.nonhostVarTest = 9;
        BlinkMilli.hostVarTest2 = 9;
        BlinkMilli.hostVarNotRefdInTarget = 3;
        BlinkMilli.hostVarRefdInTarget = 4;
        BlinkMilli.thing = "yy";
        BlinkMilli.initialBlue = 33;
        BlinkMilli.leds = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_leds__A', false); BlinkMilli.leds.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr__A', false); BlinkMilli.chkarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr2__A', false);
        BlinkMilli.chkarr3 = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr3__A', false); BlinkMilli.chkarr3.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1 ]));
        BlinkMilli.chkarr4 = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr4__A', false); BlinkMilli.chkarr4.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        BlinkMilli.chkarr6 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr6__A', false);
    }
    BlinkMilli.$$hostInitLastPass = function() {
        BlinkMilli.chkarr7 = new $$Array((BlinkMilli.hostVarTest2), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr7__A', false);
        BlinkMilli.chkarr8 = new $$Array((BlinkMilli.hostVarTest2), function($$cn,$$idx){ return 0;}, 'test1_BlinkMilli_chkarr8__A', false);
    }
    return BlinkMilli;
}
var $$u = $$c();
$units['test1.BlinkMilli'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test1.BlinkMilli'].pollen$used = true;

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
