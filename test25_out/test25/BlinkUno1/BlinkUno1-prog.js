
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
    Mcu.getFrequency = new $$Ref('atmel_atmega328_Mcu_getFrequency__E');
    Mcu.setFrequency = new $$Ref('atmel_atmega328_Mcu_setFrequency__E');
    Mcu.targetInit = new $$Ref('atmel_atmega328_Mcu_targetInit__I');
    Mcu.host_getFrequency = function() {
        var $$text = '';
        return(  (Mcu.sysFreq)  );
        return $$text;
    }
    Mcu.host_setFrequency = function( hz ) {
        var $$text = '';
        (Mcu.sysFreq) = (hz);
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
 * ======== MODULE atmel.atmega328.PB5 ========
 */

var $$c = function() {
    const PB5 = {};
    PB5.PB5 = PB5
    PB5.$name = 'atmel.atmega328.PB5';
    PB5.pollen$used = 0;
    PB5.set = new $$Ref('atmel_atmega328_PB5_set__E');
    PB5.clear = new $$Ref('atmel_atmega328_PB5_clear__E');
    PB5.toggle = new $$Ref('atmel_atmega328_PB5_toggle__E');
    PB5.get = new $$Ref('atmel_atmega328_PB5_get__E');
    PB5.makeInput = new $$Ref('atmel_atmega328_PB5_makeInput__E');
    PB5.isInput = new $$Ref('atmel_atmega328_PB5_isInput__E');
    PB5.makeOutput = new $$Ref('atmel_atmega328_PB5_makeOutput__E');
    PB5.isOutput = new $$Ref('atmel_atmega328_PB5_isOutput__E');
    PB5.targetInit = new $$Ref('atmel_atmega328_PB5_targetInit__I');
    PB5.portRegister = "PORTB";
    PB5.directionRegister = "DDRB";
    PB5.bit = 5;
    PB5.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    PB5.pollen__uses__ = function() {
    }
    PB5.$$privateInit = function() {
    }
    return PB5;
}
var $$u = $$c();
$units['atmel.atmega328.PB5'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION atmel.atmega328.ATmega328 ========
 */

var $$c = function() {
    const ATmega328 = {};
    ATmega328.ATmega328 = ATmega328
    ATmega328.$name = 'atmel.atmega328.ATmega328';
    ATmega328.pollen$used = 0;
    ATmega328.Mcu = $units['atmel.atmega328.Mcu'];
    ATmega328.PB0 = $units['atmel.atmega328.PB0'];
    ATmega328.PB1 = $units['atmel.atmega328.PB1'];
    ATmega328.PB2 = $units['atmel.atmega328.PB2'];
    ATmega328.PB3 = $units['atmel.atmega328.PB3'];
    ATmega328.PB4 = $units['atmel.atmega328.PB4'];
    ATmega328.PB5 = $units['atmel.atmega328.PB5'];
    ATmega328.PB6 = $units['atmel.atmega328.PB6'];
    ATmega328.PB7 = $units['atmel.atmega328.PB7'];
    ATmega328.PC0 = $units['atmel.atmega328.PC0'];
    ATmega328.PC1 = $units['atmel.atmega328.PC1'];
    ATmega328.PC2 = $units['atmel.atmega328.PC2'];
    ATmega328.PC3 = $units['atmel.atmega328.PC3'];
    ATmega328.PC4 = $units['atmel.atmega328.PC4'];
    ATmega328.PC5 = $units['atmel.atmega328.PC5'];
    ATmega328.PC6 = $units['atmel.atmega328.PC6'];
    ATmega328.PD0 = $units['atmel.atmega328.PD0'];
    ATmega328.PD1 = $units['atmel.atmega328.PD1'];
    ATmega328.PD2 = $units['atmel.atmega328.PD2'];
    ATmega328.PD3 = $units['atmel.atmega328.PD3'];
    ATmega328.PD4 = $units['atmel.atmega328.PD4'];
    ATmega328.PD5 = $units['atmel.atmega328.PD5'];
    ATmega328.PD6 = $units['atmel.atmega328.PD6'];
    ATmega328.PD7 = $units['atmel.atmega328.PD7'];
    return ATmega328;
}
var $$u = $$c();
$units['atmel.atmega328.ATmega328'] = $$u;
$units.push($$u);


/*
 * ======== MODULE cc.arduino.Lifecycle ========
 */

var $$c = function() {
    const Lifecycle = {};
    Lifecycle.Lifecycle = Lifecycle
    Lifecycle.$name = 'cc.arduino.Lifecycle';
    Lifecycle.pollen$used = 0;
    Lifecycle.pollen__reset = new $$Ref('cc_arduino_Lifecycle_pollen__reset__E');
    Lifecycle.pollen__ready = new $$Ref('cc_arduino_Lifecycle_pollen__ready__E');
    Lifecycle.pollen__shutdown = new $$Ref('cc_arduino_Lifecycle_pollen__shutdown__E');
    Lifecycle.pollen__hibernate = new $$Ref('cc_arduino_Lifecycle_pollen__hibernate__E');
    Lifecycle.pollen__wake = new $$Ref('cc_arduino_Lifecycle_pollen__wake__E');
    Lifecycle.pollen__free = new $$Ref('cc_arduino_Lifecycle_pollen__free__E');
    Lifecycle.targetInit = new $$Ref('cc_arduino_Lifecycle_targetInit__I');
    Lifecycle.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Lifecycle.pollen__uses__ = function() {
    }
    Lifecycle.$$privateInit = function() {
    }
    return Lifecycle;
}
var $$u = $$c();
$units['cc.arduino.Lifecycle'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION cc.arduino.Uno ========
 */

var $$c = function() {
    const Uno = {};
    Uno.Uno = Uno
    Uno.$name = 'cc.arduino.Uno';
    Uno.pollen$used = 0;
    Uno.Lifecycle = $units['cc.arduino.Lifecycle'];
    Uno.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    return Uno;
}
var $$u = $$c();
$units['cc.arduino.Uno'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test25.BlinkUno1 ========
 */

var $$c = function() {
    const BlinkUno1 = {};
    BlinkUno1.BlinkUno1 = BlinkUno1
    BlinkUno1.$name = 'test25.BlinkUno1';
    BlinkUno1.pollen$used = 0;
    BlinkUno1.pollen__reset = new $$Ref('test25_BlinkUno1_pollen__reset__E');
    BlinkUno1.pollen__run = new $$Ref('test25_BlinkUno1_pollen__run__E');
    BlinkUno1.targetInit = new $$Ref('test25_BlinkUno1_targetInit__I');
    BlinkUno1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkUno1.pollen__uses__ = function() {
        $$bind($units['atmel.atmega328.Mcu'], 'pollen$used', true);
        $$bind($units['atmel.atmega328.PB5'], 'pollen$used', true);
        $$bind($units['cc.arduino.Lifecycle'], 'pollen$used', true);
    }
    BlinkUno1.$$privateInit = function() {
    }
    return BlinkUno1;
}
var $$u = $$c();
$units['test25.BlinkUno1'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test25.BlinkUno1'].pollen$used = true;

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
