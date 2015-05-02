
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
 * ======== MODULE atmel.atmega328.Mcu ========
 */

var $$c = function() {
    const Mcu = {};
    Mcu.Mcu = Mcu
    Mcu.$name = 'atmel.atmega328.Mcu';
    Mcu.pollen$used = 0;
    Mcu.reset = new $$Ref('atmel_atmega328_Mcu_reset__E');
    Mcu.shutdown = new $$Ref('atmel_atmega328_Mcu_shutdown__E');
    Mcu.wait = new $$Ref('atmel_atmega328_Mcu_wait__E');
    Mcu.cycle = new $$Ref('atmel_atmega328_Mcu_cycle__E');
    Mcu.frequency = new $$Ref('atmel_atmega328_Mcu_frequency__E');
    Mcu.frequency = new $$Ref('frequency');
    Mcu.targetInit = new $$Ref('atmel_atmega328_Mcu_targetInit__I');
    Mcu.frequency = function() {
        var $$text = '';
        return(  Mcu.sysFreq  );
        return $$text;
    }
    Mcu.frequency = function( hz ) {
        var $$text = '';
        Mcu.sysFreq = (hz);
        return $$text;
    }
    Mcu.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Mcu.pollen__uses__ = function() {
    }
    Mcu.$$privateInit = function() {
        Mcu.sysFreq = 0;
    }
    return Mcu;
}
var $$u = $$c();
$units['atmel.atmega328.Mcu'] = $$u;
$units.push($$u);


/*
 * ======== MODULE atmel.atmega328.PD0 ========
 */

var $$c = function() {
    const PD0 = {};
    PD0.PD0 = PD0
    PD0.$name = 'atmel.atmega328.PD0';
    PD0.pollen$used = 0;
    PD0.set = new $$Ref('atmel_atmega328_PD0_set__E');
    PD0.clear = new $$Ref('atmel_atmega328_PD0_clear__E');
    PD0.toggle = new $$Ref('atmel_atmega328_PD0_toggle__E');
    PD0.get = new $$Ref('atmel_atmega328_PD0_get__E');
    PD0.makeInput = new $$Ref('atmel_atmega328_PD0_makeInput__E');
    PD0.isInput = new $$Ref('atmel_atmega328_PD0_isInput__E');
    PD0.makeOutput = new $$Ref('atmel_atmega328_PD0_makeOutput__E');
    PD0.isOutput = new $$Ref('atmel_atmega328_PD0_isOutput__E');
    PD0.targetInit = new $$Ref('atmel_atmega328_PD0_targetInit__I');
    PD0.portRegister = "PORTD";
    PD0.directionRegister = "DDR0";
    PD0.bit = 0;
    PD0.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    PD0.pollen__uses__ = function() {
    }
    PD0.$$privateInit = function() {
    }
    return PD0;
}
var $$u = $$c();
$units['atmel.atmega328.PD0'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test23.Blink4 ========
 */

var $$c = function() {
    const Blink4 = {};
    Blink4.Blink4 = Blink4
    Blink4.$name = 'test23.Blink4';
    Blink4.pollen$used = 0;
    Blink4.Mcu = $units['atmel.atmega328.Mcu'];
    Blink4.PD0 = $units['atmel.atmega328.PD0'];
    Blink4.pollen__reset = new $$Ref('test23_Blink4_pollen__reset__E');
    Blink4.pollen__run = new $$Ref('test23_Blink4_pollen__run__E');
    Blink4.delaySome = new $$Ref('test23_Blink4_delaySome__I');
    Blink4.targetInit = new $$Ref('test23_Blink4_targetInit__I');
    Blink4.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink4.pollen__uses__ = function() {
        $$bind($units['atmel.atmega328.Mcu'], 'pollen$used', true);
        $$bind($units['atmel.atmega328.PD0'], 'pollen$used', true);
    }
    Blink4.$$privateInit = function() {
    }
    return Blink4;
}
var $$u = $$c();
$units['test23.Blink4'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test23.Blink4'].pollen$used = true;

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
