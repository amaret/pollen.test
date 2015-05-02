
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
 * ======== MODULE amaret.local.Mcu ========
 */

var $$c = function() {
    const Mcu = {};
    Mcu.Mcu = Mcu
    Mcu.$name = 'amaret.local.Mcu';
    Mcu.pollen$used = 0;
    Mcu.reset = new $$Ref('amaret_local_Mcu_reset__E');
    Mcu.shutdown = new $$Ref('amaret_local_Mcu_shutdown__E');
    Mcu.wait = new $$Ref('amaret_local_Mcu_wait__E');
    Mcu.cycle = new $$Ref('amaret_local_Mcu_cycle__E');
    Mcu.getFrequency = new $$Ref('amaret_local_Mcu_getFrequency__E');
    Mcu.setFrequency = new $$Ref('amaret_local_Mcu_setFrequency__E');
    Mcu.targetInit = new $$Ref('amaret_local_Mcu_targetInit__I');
    Mcu.getFrequencyOnHost = function() {
        var $$text = '';
        return(  (Mcu.sysFreq)  );
        return $$text;
    }
    Mcu.setFrequencyOnHost = function( hz ) {
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
$units['amaret.local.Mcu'] = $$u;
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
 * ======== MODULE amaret.local.A1 ========
 */

var $$c = function() {
    const A1 = {};
    A1.A1 = A1
    A1.$name = 'amaret.local.A1';
    A1.pollen$used = 0;
    A1.set = new $$Ref('amaret_local_A1_set__E');
    A1.clear = new $$Ref('amaret_local_A1_clear__E');
    A1.toggle = new $$Ref('amaret_local_A1_toggle__E');
    A1.get = new $$Ref('amaret_local_A1_get__E');
    A1.makeInput = new $$Ref('amaret_local_A1_makeInput__E');
    A1.isInput = new $$Ref('amaret_local_A1_isInput__E');
    A1.makeOutput = new $$Ref('amaret_local_A1_makeOutput__E');
    A1.isOutput = new $$Ref('amaret_local_A1_isOutput__E');
    A1.targetInit = new $$Ref('amaret_local_A1_targetInit__I');
    A1.name = "A";
    A1.num = 1;
    A1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    A1.pollen__uses__ = function() {
    }
    A1.$$privateInit = function() {
    }
    return A1;
}
var $$u = $$c();
$units['amaret.local.A1'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION amaret.local.LocalMcu ========
 */

var $$c = function() {
    const LocalMcu = {};
    LocalMcu.LocalMcu = LocalMcu
    LocalMcu.$name = 'amaret.local.LocalMcu';
    LocalMcu.pollen$used = 0;
    LocalMcu.Mcu = $units['amaret.local.Mcu'];
    LocalMcu.A1 = $units['amaret.local.A1'];
    return LocalMcu;
}
var $$u = $$c();
$units['amaret.local.LocalMcu'] = $$u;
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
 * ======== MODULE test32.Blink2 ========
 */

var $$c = function() {
    const Blink2 = {};
    Blink2.Blink2 = Blink2
    Blink2.$name = 'test32.Blink2';
    Blink2.pollen$used = 0;
    Blink2.Led = $units['pollen.hardware.Led'];
    Blink2.pollen__reset = new $$Ref('test32_Blink2_pollen__reset__E');
    Blink2.pollen__shutdown = new $$Ref('test32_Blink2_pollen__shutdown__E');
    Blink2.pollen__run = new $$Ref('test32_Blink2_pollen__run__E');
    Blink2.targetInit = new $$Ref('test32_Blink2_targetInit__I');
    Blink2.$$hostInit = function() {
        var $$text = '';
        var $$v = 'amaret_local_A1';
        var $$s = $$bind($units['test32.Blink2'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['amaret.local.A1'].pollen$used = true;}


        return $$text;
    }
    Blink2.pollen__uses__ = function() {
        $$bind($units['amaret.local.Mcu'], 'pollen$used', true);
        $$bind($units['amaret.local.A1'], 'pollen$used', true);
        $$bind($units['pollen.hardware.Led'], 'pollen$used', true);
    }
    Blink2.$$privateInit = function() {
    }
    return Blink2;
}
var $$u = $$c();
$units['test32.Blink2'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test32.Blink2'].pollen$used = true;

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
