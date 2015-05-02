
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
 * ======== test52.FcnProto ========
 */

var $$c = function() {
    const FcnProto = {};
    FcnProto.FcnProto = FcnProto
    FcnProto.$name = 'test52.FcnProto';
    FcnProto.pollen$used = 0;
    FcnProto.pollen__uses__ = function() {
    }
    FcnProto.$$privateInit = function() {
    }
    return FcnProto;
}
var $$u = $$c();
$units['test52.FcnProto'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test52.FcnImpl ========
 */

var $$c = function() {
    const FcnImpl = {};
    FcnImpl.FcnImpl = FcnImpl
    FcnImpl.$name = 'test52.FcnImpl';
    FcnImpl.pollen$used = 0;
    FcnImpl.foo_proto = new $$Ref('test52_FcnImpl_foo_proto__E');
    FcnImpl.targetInit = new $$Ref('test52_FcnImpl_targetInit__I');
    FcnImpl.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    FcnImpl.pollen__uses__ = function() {
    }
    FcnImpl.$$privateInit = function() {
    }
    return FcnImpl;
}
var $$u = $$c();
$units['test52.FcnImpl'] = $$u;
$units.push($$u);


/*
 * ======== test52.EH ========
 */

var $$c = function() {
    const EH = {};
    EH.EH = EH
    EH.$name = 'test52.EH';
    EH.pollen$used = 0;
    EH.pollen__uses__ = function() {
    }
    EH.$$privateInit = function() {
    }
    return EH;
}
var $$u = $$c();
$units['test52.EH'] = $$u;
$units.push($$u);


/*
 * ======== CLASS test52.Event ========
 */

var $$c = function() {
    const Event = {};
    Event.Event = Event
    Event.$name = 'test52.Event';
    Event.pollen$used = 0;
    Event.Event$$id = 1;
    Event.Event = function(cn) {
        this.$$id = Event.Event$$id++;
        this.$$cname = cn ? cn : 'test52_Event_Event__'+this.$$id+'__S';
        this.$$tname = 'test52_Event_Event';
        this.$$uname = 'test52.Event';
        this.code = 0;
        this.handler = 0;
    }
    Event.Event.prototype = new $$Struct('test52.Event.Event');
    Event.Event.prototype.$$isAggFld = {};
    Event.Event.prototype.$$isAggFld.code = false;
    Event.Event.prototype.$$isAggFld.handler = false;
    Event.Event.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Event.pollen__uses__ = function() {
    }
    Event.Event.prototype.$$privateInit = function() {
        this.code = 0;
    }
    Event.Event.prototype.$$hostInitLastPass = function() {
    }
    return Event;
}
var $$u = $$c();
$units['test52.Event'] = $$u;
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
 * ======== MODULE test52.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test52.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.FcnImpl = $units['test52.FcnImpl'];
    HelloWorld.Event = $units['test52.Event'];
    HelloWorld.PrintImpl = $units['test61.PrintImpl'];
    HelloWorld.start = new $$Ref('test52_HelloWorld_start__I');
    HelloWorld.pollen__run = new $$Ref('test52_HelloWorld_pollen__run__E');
    HelloWorld.handle = new $$Ref('test52_HelloWorld_handle__E');
    HelloWorld.Inner$$id = 1;
    HelloWorld.Inner = function(cn) {
        this.$$id = HelloWorld.Inner$$id++;
        this.$$cname = cn ? cn : 'test52_HelloWorld_Inner__'+this.$$id+'__S';
        this.$$tname = 'test52_HelloWorld_Inner';
        this.$$uname = 'test52.HelloWorld';
    }
    HelloWorld.Inner.prototype = new $$Struct('test52.HelloWorld.Inner');
    HelloWorld.Inner.prototype.$$isAggFld = {};
    HelloWorld.Inner.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    HelloWorld.Inner.prototype.$$privateInit = function() {
    }
    HelloWorld.Inner.prototype.$$hostInitLastPass = function() {
    }
    HelloWorld.foo = new $$Ref('test52_HelloWorld_foo__I');
    HelloWorld.foo2 = new $$Ref('test52_HelloWorld_foo2__I');
    HelloWorld.bar = new $$Ref('test52_HelloWorld_bar__I');
    HelloWorld.bar2 = new $$Ref('test52_HelloWorld_bar2__I');
    HelloWorld.bar3 = new $$Ref('test52_HelloWorld_bar3__I');
    HelloWorld.bar4 = new $$Ref('test52_HelloWorld_bar4__I');
    HelloWorld.bar5 = new $$Ref('test52_HelloWorld_bar5__I');
    HelloWorld.bar5_and_rtn = new $$Ref('test52_HelloWorld_bar5_and_rtn__I');
    HelloWorld.fcnrefsAssign = new $$Ref('test52_HelloWorld_fcnrefsAssign__I');
    HelloWorld.fcnrefsCalls = new $$Ref('test52_HelloWorld_fcnrefsCalls__I');
    HelloWorld.fcnrefsParameters = new $$Ref('test52_HelloWorld_fcnrefsParameters__I');
    HelloWorld.testFcns = new $$Ref('test52_HelloWorld_testFcns__I');
    HelloWorld.targetInit = new $$Ref('test52_HelloWorld_targetInit__I');
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        (HelloWorld.proto_ref) = (HelloWorld.fp_impl);
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test52.FcnImpl'], 'pollen$used', true);
        $$bind($units['test52.Event'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
var $$v = 'test52_FcnImpl';
        var $$s = $$bind($units['test52.HelloWorld'], 'fp', $$v);{ $$v.pollen$used = true;
        $units['test52.FcnImpl'].pollen$used = true;}

        HelloWorld.fp_impl = new $$Ref('test52_FcnImpl_foo_proto__E');
        HelloWorld.fp_impl2 = new $$Ref('test52_FcnImpl_foo_proto__E');
        HelloWorld.clsFcnRef = new $$Ref('test52_HelloWorld_Inner_foo__I');
        HelloWorld.modFcnRef = new $$Ref('test52_FcnImpl_foo_proto__E');
        HelloWorld.foo_uint8 = new $$Ref('test52_HelloWorld_foo__I');
        HelloWorld.foo2_uint32_rtn = new $$Ref('test52_HelloWorld_foo2__I');
        HelloWorld.bar_uint8 = new $$Ref('test52_HelloWorld_bar__I');
        HelloWorld.bar2_bool = new $$Ref('test52_HelloWorld_bar2__I');
        HelloWorld.bar3_uint32 = new $$Ref('test52_HelloWorld_bar3__I');
        HelloWorld.bar4_uint32_and_rtn = new $$Ref('test52_HelloWorld_bar4__I');
        HelloWorld.bar5_uint16 = new $$Ref('test52_HelloWorld_bar5__I');
        HelloWorld.bar5_uint16_and_rtn = new $$Ref('test52_HelloWorld_bar5_and_rtn__I');
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test52.HelloWorld'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return HelloWorld;
}
var $$u = $$c();
$units['test52.HelloWorld'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test52.HelloWorld'].pollen$used = true;

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
