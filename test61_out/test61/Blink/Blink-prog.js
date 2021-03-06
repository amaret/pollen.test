
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
 * ======== test61.PinProto ========
 */

var $$c = function() {
    const PinProto = {};
    PinProto.PinProto = PinProto
    PinProto.$name = 'test61.PinProto';
    PinProto.pollen$used = 0;
    PinProto.pollen__uses__ = function() {
    }
    PinProto.$$privateInit = function() {
    }
    return PinProto;
}
var $$u = $$c();
$units['test61.PinProto'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test61.AvrPin ========
 */

var $$c = function() {
    const AvrPin = {};
    AvrPin.AvrPin = AvrPin
    AvrPin.$name = 'test61.AvrPin';
    AvrPin.pollen$used = 0;
    AvrPin.set = new $$Ref('test61_AvrPin_set__E');
    AvrPin.clear = new $$Ref('test61_AvrPin_clear__E');
    AvrPin.toggle = new $$Ref('test61_AvrPin_toggle__E');
    AvrPin.get = new $$Ref('test61_AvrPin_get__E');
    AvrPin.makeInput = new $$Ref('test61_AvrPin_makeInput__E');
    AvrPin.isInput = new $$Ref('test61_AvrPin_isInput__E');
    AvrPin.makeOutput = new $$Ref('test61_AvrPin_makeOutput__E');
    AvrPin.isOutput = new $$Ref('test61_AvrPin_isOutput__E');
    AvrPin.targetInit = new $$Ref('test61_AvrPin_targetInit__I');
    AvrPin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    AvrPin.pollen__uses__ = function() {
    }
    AvrPin.$$privateInit = function() {
        AvrPin.PORTB = 0;
        AvrPin.DDRB = 0;
    }
    return AvrPin;
}
var $$u = $$c();
$units['test61.AvrPin'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test61.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'test61.Led';
    Led.pollen$used = 0;
    Led.targetInit = new $$Ref('test61_Led_targetInit__I');
    Led.on = new $$Ref('test61_Led_on__E');
    Led.off = new $$Ref('test61_Led_off__E');
    Led.toggle = new $$Ref('test61_Led_toggle__E');
    Led.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led.pollen__uses__ = function() {
    }
    Led.$$privateInit = function() {
        Led.pin = 0;
    }
    return Led;
}
var $$u = $$c();
$units['test61.Led'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION test61.BlinkEnvComp ========
 */

var $$c = function() {
    const BlinkEnvComp = {};
    BlinkEnvComp.BlinkEnvComp = BlinkEnvComp
    BlinkEnvComp.$name = 'test61.BlinkEnvComp';
    BlinkEnvComp.pollen$used = 0;
    BlinkEnvComp.AvrPin = $units['test61.AvrPin'];
    BlinkEnvComp.Led = $units['test61.Led'];
    BlinkEnvComp.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkEnvComp.pollen__presets__ = function() {
        var $$text = '';
        var $$v = 'test61_AvrPin';
        var $$s = $$bind($units['test61.BlinkEnvComp'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['test61.AvrPin'].pollen$used = true;}


        return $$text;
    }
    return BlinkEnvComp;
}
var $$u = $$c();
$units['test61.BlinkEnvComp'] = $$u;
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
 * ======== MODULE test61.Blink ========
 */

var $$c = function() {
    const Blink = {};
    Blink.Blink = Blink
    Blink.$name = 'test61.Blink';
    Blink.pollen$used = 0;
    Blink.PrintImpl = $units['test61.PrintImpl'];
    Blink.targetInit = new $$Ref('test61_Blink_targetInit__I');
    Blink.pollen__run = new $$Ref('test61_Blink_pollen__run__E');
    Blink.delay = new $$Ref('test61_Blink_delay__I');
    Blink.$$hostInit = function() {
        var $$text = '';
        var $$v = 'test61_AvrPin';
        var $$s = $$bind($units['test61.Blink'], 'Led.pin', $$v);if ($$v && $$v == $$s) $$v.pollen$used = true;

        return $$text;
    }
    Blink.pollen__uses__ = function() {
        $$bind($units['test61.AvrPin'], 'pollen$used', true);
        $$bind($units['test61.Led'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    Blink.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test61.Blink'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return Blink;
}
var $$u = $$c();
$units['test61.Blink'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test61.Blink'].pollen$used = true;

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
