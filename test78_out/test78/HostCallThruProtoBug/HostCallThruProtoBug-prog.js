
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
 * ======== test78.FakeProto ========
 */

var $$c = function() {
    const FakeProto = {};
    FakeProto.FakeProto = FakeProto
    FakeProto.$name = 'test78.FakeProto';
    FakeProto.pollen$used = 0;
    FakeProto.pollen__uses__ = function() {
    }
    FakeProto.$$privateInit = function() {
    }
    return FakeProto;
}
var $$u = $$c();
$units['test78.FakeProto'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test78.FakePin ========
 */

var $$c = function() {
    const FakePin = {};
    FakePin.FakePin = FakePin
    FakePin.$name = 'test78.FakePin';
    FakePin.pollen$used = 0;
    FakePin.targetInit = new $$Ref('test78_FakePin_targetInit__I');
    FakePin.foo = function() {
        var $$text = '';
        $$printf("FakePin.foo:    enter/exit\n");
        return $$text;
    }
    FakePin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    FakePin.pollen__uses__ = function() {
    }
    FakePin.$$privateInit = function() {
    }
    return FakePin;
}
var $$u = $$c();
$units['test78.FakePin'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test78.FakeLed ========
 */

var $$c = function() {
    const FakeLed = {};
    FakeLed.FakeLed = FakeLed
    FakeLed.$name = 'test78.FakeLed';
    FakeLed.pollen$used = 0;
    FakeLed.FakePin = $units['test78.FakePin'];
    FakeLed.targetInit = new $$Ref('test78_FakeLed_targetInit__I');
    FakeLed.$$hostInit = function() {
        var $$text = '';
        $$printf("FakeLed.hostInit: enter/exit\n");
        return $$text;
    }
    FakeLed.testFunction = function() {
        var $$text = '';
        $$printf("FakeLed.testFunction: enter\n");
        $units['test78.FakePin'].foo();
        $units['test78.FakePin'].foo();
        $$printf("FakeLed.testFunction: exit\n");
        return $$text;
    }
    FakeLed.pollen__uses__ = function() {
        $$bind($units['test78.FakePin'], 'pollen$used', true);
    }
    FakeLed.$$privateInit = function() {
        FakeLed.pin = 0;
    }
    return FakeLed;
}
var $$u = $$c();
$units['test78.FakeLed'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION test78.HostCallComp ========
 */

var $$c = function() {
    const HostCallComp = {};
    HostCallComp.HostCallComp = HostCallComp
    HostCallComp.$name = 'test78.HostCallComp';
    HostCallComp.pollen$used = 0;
    HostCallComp.Pin = $units['test78.FakePin'];
    HostCallComp.Led = $units['test78.FakeLed'];
    HostCallComp.pollen__presets__ = function() {
        var $$text = '';
        $$printf("HostCallComp.preset: enter\n");
        var $$v = 'test78_FakePin';
        var $$s = $$bind($units['test78.HostCallComp'], 'FakeLed.pin', $$v);{ $$v.pollen$used = true;
        $units['test78.FakePin'].pollen$used = true;}


        $$printf("HostCallComp.preset: exit\n");
        return $$text;
    }
    return HostCallComp;
}
var $$u = $$c();
$units['test78.HostCallComp'] = $$u;
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
 * ======== MODULE test78.HostCallThruProtoBug ========
 */

var $$c = function() {
    const HostCallThruProtoBug = {};
    HostCallThruProtoBug.HostCallThruProtoBug = HostCallThruProtoBug
    HostCallThruProtoBug.$name = 'test78.HostCallThruProtoBug';
    HostCallThruProtoBug.pollen$used = 0;
    HostCallThruProtoBug.PrintImpl = $units['test54.PrintImpl'];
    HostCallThruProtoBug.pollen__run = new $$Ref('test78_HostCallThruProtoBug_pollen__run__E');
    HostCallThruProtoBug.pollen__shutdown = new $$Ref('test78_HostCallThruProtoBug_pollen__shutdown__E');
    HostCallThruProtoBug.targetInit = new $$Ref('test78_HostCallThruProtoBug_targetInit__I');
    HostCallThruProtoBug.$$hostInit = function() {
        var $$text = '';
        $$printf("HostCallThruProtoBug.hostInit: enter\n");
        $units['test78.FakeLed'].testFunction();
        $$printf("HostCallThruProtoBug.hostInit: exit\n");
        return $$text;
    }
    HostCallThruProtoBug.pollen__uses__ = function() {
        $$bind($units['test78.FakePin'], 'pollen$used', true);
        $$bind($units['test78.FakeLed'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    HostCallThruProtoBug.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test78.HostCallThruProtoBug'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return HostCallThruProtoBug;
}
var $$u = $$c();
$units['test78.HostCallThruProtoBug'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test78.HostCallThruProtoBug'].pollen$used = true;

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
