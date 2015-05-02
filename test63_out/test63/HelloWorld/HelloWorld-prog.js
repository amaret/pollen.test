
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
 * ======== test63.ModEnum ========
 */

var $$c = function() {
    const ModEnum = {};
    ModEnum.ModEnum = ModEnum
    ModEnum.$name = 'test63.ModEnum';
    ModEnum.pollen$used = 0;
    ModEnum.ModEnum_Y1 = 1;
    ModEnum.ModEnum_Y2 = 2;
    ModEnum.pollen__uses__ = function() {
    }
    ModEnum.$$privateInit = function() {
    }
    return ModEnum;
}
var $$u = $$c();
$units['test63.ModEnum'] = $$u;
$units.push($$u);


/*
 * ======== test63.ProtoEnum ========
 */

var $$c = function() {
    const ProtoEnum = {};
    ProtoEnum.ProtoEnum = ProtoEnum
    ProtoEnum.$name = 'test63.ProtoEnum';
    ProtoEnum.pollen$used = 0;
    ProtoEnum.PEnum1_SCLK = 2;
    ProtoEnum.PEnum1_ACLK = 7;
    ProtoEnum.PEnum1_NEXT = 8;
    ProtoEnum.PEnum1_LAST = 9;
    ProtoEnum.PEnum2_FIRST = 0;
    ProtoEnum.PEnum2_NEXT = 1;
    ProtoEnum.PEnum2_LAST = 2;
    ProtoEnum.pollen__uses__ = function() {
    }
    ProtoEnum.$$privateInit = function() {
    }
    return ProtoEnum;
}
var $$u = $$c();
$units['test63.ProtoEnum'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION test63.CompEnum ========
 */

var $$c = function() {
    const CompEnum = {};
    CompEnum.CompEnum = CompEnum
    CompEnum.$name = 'test63.CompEnum';
    CompEnum.pollen$used = 0;
    CompEnum.CEnum1_SCLK = 2;
    CompEnum.CEnum1_ACLK = 7;
    CompEnum.CEnum1_NEXT = 8;
    CompEnum.CEnum1_LAST = 9;
    return CompEnum;
}
var $$u = $$c();
$units['test63.CompEnum'] = $$u;
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
 * ======== MODULE test63.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test63.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.PrintImpl = $units['test61.PrintImpl'];
    HelloWorld.LocalEnum1_SCLK = 2;
    HelloWorld.LocalEnum1_ACLK = 7;
    HelloWorld.LocalEnum1_NEXT = 8;
    HelloWorld.LocalEnum1_LAST = 9;
    HelloWorld.LocalEnum2_FIRST2 = 0;
    HelloWorld.LocalEnum2_NEXT2 = 1;
    HelloWorld.LocalEnum2_LAST2 = 2;
    HelloWorld.pollen__run = new $$Ref('test63_HelloWorld_pollen__run__E');
    HelloWorld.targ_test = new $$Ref('test63_HelloWorld_targ_test__I');
    HelloWorld.targetInit = new $$Ref('test63_HelloWorld_targetInit__I');
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        HelloWorld.test();
        return $$text;
    }
    HelloWorld.test = function() {
        var $$text = '';
        var x;
        var y;
        var z;
        var z1;
        x = (HelloWorld.LocalEnum1_SCLK);
        y = (HelloWorld.LocalEnum1_ACLK);
        z = (HelloWorld.LocalEnum1_NEXT);
        z1 = (HelloWorld.LocalEnum1_LAST);
        if ((x) == 2 && (y) == 7 && (z) == 8 && (z1) == 9) {
            $$printf("PASS LocalEnum1 (host) \n");
        }
        else {
            $$printf((x), " ", (y), " ", (z), " ", (z1), "\n ");
            $$printf("FAIL LocalEnum1 (host) \n ");
        }
        (x) = (HelloWorld.LocalEnum2_FIRST2);
        (y) = (HelloWorld.LocalEnum2_NEXT2);
        (z) = (HelloWorld.LocalEnum2_LAST2);
        if ((x) == 0 && (y) == 1 && (z) == 2) {
            $$printf("PASS LocalEnum2 (host) \n");
        }
        else {
            $$printf((x), " ", (y), " ", (z), "\n ");
            $$printf("FAIL LocalEnum2 (host) \n ");
        }
        (x) = ($units['test63.CompEnum'].CEnum1_NEXT);
        (y) = ($units['test63.ProtoEnum'].PEnum2_NEXT);
        (z) = ($units['test63.ModEnum'].ModEnum_Y2);
        if ((x) == 8 && (y) == 1 && (z) == 2) {
            $$printf("PASS Comp, Proto, Mod enums (host) \n");
        }
        else {
            $$printf((x), " ", (y), " ", (z), "\n ");
            $$printf("FAIL Comp, Proto, Mod enums (host) \n");
        }
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test63.ModEnum'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test63.HelloWorld'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return HelloWorld;
}
var $$u = $$c();
$units['test63.HelloWorld'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test63.HelloWorld'].pollen$used = true;

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
