
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
 * ======== MODULE pollen.interfaces.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'pollen.interfaces.Led';
    Led.pollen$used = 0;
    Led.on = new $$Ref('pollen_interfaces_Led_on__E');
    Led.off = new $$Ref('pollen_interfaces_Led_off__E');
    Led.toggle = new $$Ref('pollen_interfaces_Led_toggle__E');
    Led.isOn = new $$Ref('pollen_interfaces_Led_isOn__E');
    Led.targetInit = new $$Ref('pollen_interfaces_Led_targetInit__I');
    Led.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led.pollen__uses__ = function() {
    }
    Led.$$privateInit = function() {
    }
    return Led;
}
var $$u = $$c();
$units['pollen.interfaces.Led'] = $$u;
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
 * ======== MODULE cc.arduino.PrintImpl ========
 */

var $$c = function() {
    const PrintImpl = {};
    PrintImpl.PrintImpl = PrintImpl
    PrintImpl.$name = 'cc.arduino.PrintImpl';
    PrintImpl.pollen$used = 0;
    PrintImpl.printBool = new $$Ref('cc_arduino_PrintImpl_printBool__E');
    PrintImpl.printInt = new $$Ref('cc_arduino_PrintImpl_printInt__E');
    PrintImpl.printReal = new $$Ref('cc_arduino_PrintImpl_printReal__E');
    PrintImpl.printUint = new $$Ref('cc_arduino_PrintImpl_printUint__E');
    PrintImpl.printStr = new $$Ref('cc_arduino_PrintImpl_printStr__E');
    PrintImpl.targetInit = new $$Ref('cc_arduino_PrintImpl_targetInit__I');
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
$units['cc.arduino.PrintImpl'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION cc.arduino.Environment ========
 */

var $$c = function() {
    const Environment = {};
    Environment.Environment = Environment
    Environment.$name = 'cc.arduino.Environment';
    Environment.pollen$used = 0;
    Environment.PrintImpl = $units['cc.arduino.PrintImpl'];
    Environment.$$hostInit = function() {
        var $$text = '';
        var $$v = 'cc_arduino_PrintImpl';
        var $$s = $$bind($units['cc.arduino.Environment'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['cc.arduino.PrintImpl'].pollen$used = true;}


        return $$text;
    }
    return Environment;
}
var $$u = $$c();
$units['cc.arduino.Environment'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test19.Y ========
 */

var $$c = function() {
    const Y = {};
    Y.Y = Y
    Y.$name = 'test19.Y';
    Y.pollen$used = 0;
    Y.targetInit = new $$Ref('test19_Y_targetInit__I');
    Y.get = function() {
        var $$text = '';
        return(  3  );
        return $$text;
    }
    Y.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Y.pollen__uses__ = function() {
    }
    Y.$$privateInit = function() {
    }
    return Y;
}
var $$u = $$c();
$units['test19.Y'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test19.TT ========
 */

var $$c = function() {
    const TT = {};
    TT.TT = TT
    TT.$name = 'test19.TT';
    TT.pollen$used = 0;
    TT.Z = $units['test19.Y'];
    TT.targetInit = new $$Ref('test19_TT_targetInit__I');
    TT.lowValue = true;
    TT.get = function() {
        var $$text = '';
        var l;
        l = (TT.lowValue);
        return(  $units['test19.Y'].get()  );
        return $$text;
    }
    TT.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TT.pollen__uses__ = function() {
        $$bind($units['test19.Y'], 'pollen$used', true);
    }
    TT.$$privateInit = function() {
    }
    return TT;
}
var $$u = $$c();
$units['test19.TT'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test19.BlinkMilli2 ========
 */

var $$c = function() {
    const BlinkMilli2 = {};
    BlinkMilli2.BlinkMilli2 = BlinkMilli2
    BlinkMilli2.$name = 'test19.BlinkMilli2';
    BlinkMilli2.pollen$used = 0;
    BlinkMilli2.TimerMilli = $units['pollen.time.TimerMilli'];
    BlinkMilli2.TT = $units['test19.TT'];
    BlinkMilli2.pollen__run = new $$Ref('test19_BlinkMilli2_pollen__run__E');
    BlinkMilli2.pollen__reset = new $$Ref('test19_BlinkMilli2_pollen__reset__E');
    BlinkMilli2.targetInit = new $$Ref('test19_BlinkMilli2_targetInit__I');
    BlinkMilli2.toggle = function() {
        var $$text = '';
        var lowValue;
        lowValue = true;
        $units['test19.TT'].get();
        return $$text;
    }
    BlinkMilli2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkMilli2.pollen__uses__ = function() {
        $$bind($units['pollen.interfaces.Led'], 'pollen$used', true);
        $$bind($units['cc.arduino.PrintImpl'], 'pollen$used', true);
        $$bind($units['test19.TT'], 'pollen$used', true);
    }
    BlinkMilli2.$$privateInit = function() {
    }
    return BlinkMilli2;
}
var $$u = $$c();
$units['test19.BlinkMilli2'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test19.BlinkMilli2'].pollen$used = true;

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
