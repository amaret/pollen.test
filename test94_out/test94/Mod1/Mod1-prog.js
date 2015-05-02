
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
 * ======== MODULE pollen.math.Absolute ========
 */

var $$c = function() {
    const Absolute = {};
    Absolute.Absolute = Absolute
    Absolute.$name = 'pollen.math.Absolute';
    Absolute.pollen$used = 0;
    Absolute.abs8 = new $$Ref('pollen_math_Absolute_abs8__E');
    Absolute.abs16 = new $$Ref('pollen_math_Absolute_abs16__E');
    Absolute.abs32 = new $$Ref('pollen_math_Absolute_abs32__E');
    Absolute.targetInit = new $$Ref('pollen_math_Absolute_targetInit__I');
    Absolute.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Absolute.pollen__uses__ = function() {
    }
    Absolute.$$privateInit = function() {
    }
    return Absolute;
}
var $$u = $$c();
$units['pollen.math.Absolute'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.math.FloorCeil ========
 */

var $$c = function() {
    const FloorCeil = {};
    FloorCeil.FloorCeil = FloorCeil
    FloorCeil.$name = 'pollen.math.FloorCeil';
    FloorCeil.pollen$used = 0;
    FloorCeil.ceildivU8 = new $$Ref('pollen_math_FloorCeil_ceildivU8__E');
    FloorCeil.ceildivU16 = new $$Ref('pollen_math_FloorCeil_ceildivU16__E');
    FloorCeil.floor = new $$Ref('pollen_math_FloorCeil_floor__E');
    FloorCeil.ceil = new $$Ref('pollen_math_FloorCeil_ceil__E');
    FloorCeil.targetInit = new $$Ref('pollen_math_FloorCeil_targetInit__I');
    FloorCeil.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    FloorCeil.pollen__uses__ = function() {
    }
    FloorCeil.$$privateInit = function() {
    }
    return FloorCeil;
}
var $$u = $$c();
$units['pollen.math.FloorCeil'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.math.Random8 ========
 */

var $$c = function() {
    const Random8 = {};
    Random8.Random8 = Random8
    Random8.$name = 'pollen.math.Random8';
    Random8.pollen$used = 0;
    Random8.srand8 = new $$Ref('pollen_math_Random8_srand8__E');
    Random8.rand8 = new $$Ref('pollen_math_Random8_rand8__E');
    Random8.rand8f = new $$Ref('pollen_math_Random8_rand8f__E');
    Random8.targetInit = new $$Ref('pollen_math_Random8_targetInit__I');
    Random8.$$hostInit = function() {
        var $$text = '';
        (Random8.seed) = 0xAC;
        (Random8.lfsr) = (Random8.seed);
        (Random8.period) = 0;
        return $$text;
    }
    Random8.pollen__uses__ = function() {
    }
    Random8.$$privateInit = function() {
        Random8.seed = 0xAC;
        Random8.lfsr = (Random8.seed);
        Random8.period = 0;
    }
    return Random8;
}
var $$u = $$c();
$units['pollen.math.Random8'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.math.Random16 ========
 */

var $$c = function() {
    const Random16 = {};
    Random16.Random16 = Random16
    Random16.$name = 'pollen.math.Random16';
    Random16.pollen$used = 0;
    Random16.srand16 = new $$Ref('pollen_math_Random16_srand16__E');
    Random16.rand16 = new $$Ref('pollen_math_Random16_rand16__E');
    Random16.rand16f = new $$Ref('pollen_math_Random16_rand16f__E');
    Random16.targetInit = new $$Ref('pollen_math_Random16_targetInit__I');
    Random16.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Random16.pollen__uses__ = function() {
    }
    Random16.$$privateInit = function() {
        Random16.seed = 0xACE1;
        Random16.lfsr = (Random16.seed);
        Random16.period = 0;
    }
    return Random16;
}
var $$u = $$c();
$units['pollen.math.Random16'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION pollen.math.Math ========
 */

var $$c = function() {
    const Math = {};
    Math.Math = Math
    Math.$name = 'pollen.math.Math';
    Math.pollen$used = 0;
    Math.Absolute = $units['pollen.math.Absolute'];
    Math.FloorCeil = $units['pollen.math.FloorCeil'];
    Math.MinMax = $units['pollen.math.MinMax'];
    Math.Random8 = $units['pollen.math.Random8'];
    Math.Random16 = $units['pollen.math.Random16'];
    Math.Range = $units['pollen.math.Range'];
    return Math;
}
var $$u = $$c();
$units['pollen.math.Math'] = $$u;
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
 * ======== MODULE test54.PrintImpl ========
 */

var $$c = function() {
    const PrintImpl = {};
    PrintImpl.PrintImpl = PrintImpl
    PrintImpl.$name = 'test54.PrintImpl';
    PrintImpl.pollen$used = 0;
    PrintImpl.printBool = new $$Ref('test54_PrintImpl_printBool__E');
    PrintImpl.printInt = new $$Ref('test54_PrintImpl_printInt__E');
    PrintImpl.printReal = new $$Ref('test54_PrintImpl_printReal__E');
    PrintImpl.printUint = new $$Ref('test54_PrintImpl_printUint__E');
    PrintImpl.printStr = new $$Ref('test54_PrintImpl_printStr__E');
    PrintImpl.targetInit = new $$Ref('test54_PrintImpl_targetInit__I');
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
$units['test54.PrintImpl'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test94.Mod1 ========
 */

var $$c = function() {
    const Mod1 = {};
    Mod1.Mod1 = Mod1
    Mod1.$name = 'test94.Mod1';
    Mod1.pollen$used = 0;
    Mod1.PrintImpl = $units['test54.PrintImpl'];
    Mod1.pollen__run = new $$Ref('test94_Mod1_pollen__run__E');
    Mod1.targetInit = new $$Ref('test94_Mod1_targetInit__I');
    Mod1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Mod1.pollen__uses__ = function() {
        $$bind($units['pollen.math.Absolute'], 'pollen$used', true);
        $$bind($units['pollen.math.FloorCeil'], 'pollen$used', true);
        $$bind($units['pollen.math.Random8'], 'pollen$used', true);
        $$bind($units['pollen.math.Random16'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Mod1.$$privateInit = function() {
        Mod1.i8 = -1;
        Mod1.i16 = 3;
        Mod1.i32 = -9999;
        Mod1.f1 = 1.3;
        Mod1.f2 = 0.0;
        Mod1.f3 = 123e4;
        Mod1.f4 = -7.5;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test94.Mod1'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Mod1;
}
var $$u = $$c();
$units['test94.Mod1'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test94.Mod1'].pollen$used = true;

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
