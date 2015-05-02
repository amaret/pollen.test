
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
 * ======== MODULE atmel.atmega8.Core ========
 */

var $$c = function() {
    const Core = {};
    Core.Core = Core
    Core.$name = 'atmel.atmega8.Core';
    Core.pollen$used = 0;
    Core.reset = new $$Ref('atmel_atmega8_Core_reset__E');
    Core.shutdown = new $$Ref('atmel_atmega8_Core_shutdown__E');
    Core.wait = new $$Ref('atmel_atmega8_Core_wait__E');
    Core.cycle = new $$Ref('atmel_atmega8_Core_cycle__E');
    Core.getFrequency = new $$Ref('atmel_atmega8_Core_getFrequency__E');
    Core.setFrequency = new $$Ref('atmel_atmega8_Core_setFrequency__E');
    Core.targetInit = new $$Ref('atmel_atmega8_Core_targetInit__I');
    Core.getFrequencyOnHost = function() {
        var $$text = '';
        return(  (Core.sysFreq)  );
        return $$text;
    }
    Core.setFrequencyOnHost = function( hz ) {
        var $$text = '';
        (Core.sysFreq) = (hz);
        return $$text;
    }
    Core.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Core.pollen__uses__ = function() {
    }
    Core.$$privateInit = function() {
        Core.sysFreq = 0;
        Core.nops = 8;
    }
    return Core;
}
var $$u = $$c();
$units['atmel.atmega8.Core'] = $$u;
$units.push($$u);


/*
 * ======== pollen.hardware.Pin ========
 */

var $$c = function() {
    const Pin = {};
    Pin.Pin = Pin
    Pin.$name = 'pollen.hardware.Pin';
    Pin.pollen$used = 0;
    Pin.pollen__uses__ = function() {
    }
    Pin.$$privateInit = function() {
    }
    return Pin;
}
var $$u = $$c();
$units['pollen.hardware.Pin'] = $$u;
$units.push($$u);


/*
 * ======== MODULE atmel.atmega8.PB5 ========
 */

var $$c = function() {
    const PB5 = {};
    PB5.PB5 = PB5
    PB5.$name = 'atmel.atmega8.PB5';
    PB5.pollen$used = 0;
    PB5.set = new $$Ref('atmel_atmega8_PB5_set__E');
    PB5.clear = new $$Ref('atmel_atmega8_PB5_clear__E');
    PB5.toggle = new $$Ref('atmel_atmega8_PB5_toggle__E');
    PB5.get = new $$Ref('atmel_atmega8_PB5_get__E');
    PB5.makeInput = new $$Ref('atmel_atmega8_PB5_makeInput__E');
    PB5.isInput = new $$Ref('atmel_atmega8_PB5_isInput__E');
    PB5.makeOutput = new $$Ref('atmel_atmega8_PB5_makeOutput__E');
    PB5.isOutput = new $$Ref('atmel_atmega8_PB5_isOutput__E');
    PB5.targetInit = new $$Ref('atmel_atmega8_PB5_targetInit__I');
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
$units['atmel.atmega8.PB5'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.hardware.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'pollen.hardware.Led';
    Led.pollen$used = 0;
    Led.targetInit = new $$Ref('pollen_hardware_Led_targetInit__I');
    Led.on = new $$Ref('pollen_hardware_Led_on__E');
    Led.off = new $$Ref('pollen_hardware_Led_off__E');
    Led.toggle = new $$Ref('pollen_hardware_Led_toggle__E');
    Led.isOn = new $$Ref('pollen_hardware_Led_isOn__E');
    Led.activeLow = false;
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
$units['pollen.hardware.Led'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION arduino.uno.Board ========
 */

var $$c = function() {
    const Board = {};
    Board.Board = Board
    Board.$name = 'arduino.uno.Board';
    Board.pollen$used = 0;
    Board.Led = $units['pollen.hardware.Led'];
    Board.$$hostInit = function() {
        var $$text = '';
        var $$v = 'atmel_atmega8_PB5';
        var $$s = $$bind($units['arduino.uno.Board'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['atmel.atmega8.PB5'].pollen$used = true;}


        return $$text;
    }
    return Board;
}
var $$u = $$c();
$units['arduino.uno.Board'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION arduino.uno.Environment ========
 */

var $$c = function() {
    const Environment = {};
    Environment.Environment = Environment
    Environment.$name = 'arduino.uno.Environment';
    Environment.pollen$used = 0;
    Environment.Lifecycle = $units['arduino.uno.Lifecycle'];
    Environment.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    return Environment;
}
var $$u = $$c();
$units['arduino.uno.Environment'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION test44.DigitalPin ========
 */

var $$c = function() {
    const DigitalPin = {};
    DigitalPin.DigitalPin = DigitalPin
    DigitalPin.$name = 'test44.DigitalPin';
    DigitalPin.pollen$used = 0;
    return DigitalPin;
}
var $$u = $$c();
$units['test44.DigitalPin'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test44.BlinkEnvPin ========
 */

var $$c = function() {
    const BlinkEnvPin = {};
    BlinkEnvPin.BlinkEnvPin = BlinkEnvPin
    BlinkEnvPin.$name = 'test44.BlinkEnvPin';
    BlinkEnvPin.pollen$used = 0;
    BlinkEnvPin.pollen__reset = new $$Ref('test44_BlinkEnvPin_pollen__reset__E');
    BlinkEnvPin.pollen__run = new $$Ref('test44_BlinkEnvPin_pollen__run__E');
    BlinkEnvPin.targetInit = new $$Ref('test44_BlinkEnvPin_targetInit__I');
    BlinkEnvPin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkEnvPin.pollen__uses__ = function() {
        $$bind($units['atmel.atmega8.Core'], 'pollen$used', true);
        $$bind($units['atmel.atmega8.PB5'], 'pollen$used', true);
        $$bind($units['pollen.hardware.Led'], 'pollen$used', true);
    }
    BlinkEnvPin.$$privateInit = function() {
    }
    return BlinkEnvPin;
}
var $$u = $$c();
$units['test44.BlinkEnvPin'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test44.BlinkEnvPin'].pollen$used = true;

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
