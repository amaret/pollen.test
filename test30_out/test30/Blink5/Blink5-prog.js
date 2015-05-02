
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
 * ======== test30.Pin ========
 */

var $$c = function() {
    const Pin = {};
    Pin.Pin = Pin
    Pin.$name = 'test30.Pin';
    Pin.pollen$used = 0;
    Pin.pollen__uses__ = function() {
    }
    Pin.$$privateInit = function() {
    }
    return Pin;
}
var $$u = $$c();
$units['test30.Pin'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test30.AvrPin ========
 */

var $$c = function() {
    const AvrPin = {};
    AvrPin.AvrPin = AvrPin
    AvrPin.$name = 'test30.AvrPin';
    AvrPin.pollen$used = 0;
    AvrPin.set = new $$Ref('test30_AvrPin_set__E');
    AvrPin.clear = new $$Ref('test30_AvrPin_clear__E');
    AvrPin.toggle = new $$Ref('test30_AvrPin_toggle__E');
    AvrPin.get = new $$Ref('test30_AvrPin_get__E');
    AvrPin.makeInput = new $$Ref('test30_AvrPin_makeInput__E');
    AvrPin.isInput = new $$Ref('test30_AvrPin_isInput__E');
    AvrPin.makeOutput = new $$Ref('test30_AvrPin_makeOutput__E');
    AvrPin.isOutput = new $$Ref('test30_AvrPin_isOutput__E');
    AvrPin.targetInit = new $$Ref('test30_AvrPin_targetInit__I');
    AvrPin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    AvrPin.pollen__uses__ = function() {
    }
    AvrPin.$$privateInit = function() {
    }
    return AvrPin;
}
var $$u = $$c();
$units['test30.AvrPin'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test30.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'test30.Led';
    Led.pollen$used = 0;
    Led.targetInit = new $$Ref('test30_Led_targetInit__I');
    Led.on = new $$Ref('test30_Led_on__E');
    Led.off = new $$Ref('test30_Led_off__E');
    Led.toggle = new $$Ref('test30_Led_toggle__E');
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
$units['test30.Led'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION test30.BlinkEnv ========
 */

var $$c = function() {
    const BlinkEnv = {};
    BlinkEnv.BlinkEnv = BlinkEnv
    BlinkEnv.$name = 'test30.BlinkEnv';
    BlinkEnv.pollen$used = 0;
    BlinkEnv.AvrPin = $units['test30.AvrPin'];
    BlinkEnv.Led = $units['test30.Led'];
    BlinkEnv.$$hostInit = function() {
        var $$text = '';
        var $$v = 'test30_AvrPin';
        var $$s = $$bind($units['test30.BlinkEnv'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['test30.AvrPin'].pollen$used = true;}


        return $$text;
    }
    return BlinkEnv;
}
var $$u = $$c();
$units['test30.BlinkEnv'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test30.Blink5 ========
 */

var $$c = function() {
    const Blink5 = {};
    Blink5.Blink5 = Blink5
    Blink5.$name = 'test30.Blink5';
    Blink5.pollen$used = 0;
    Blink5.targetInit = new $$Ref('test30_Blink5_targetInit__I');
    Blink5.pollen__run = new $$Ref('test30_Blink5_pollen__run__E');
    Blink5.delay = new $$Ref('test30_Blink5_delay__I');
    Blink5.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink5.pollen__uses__ = function() {
        $$bind($units['test30.AvrPin'], 'pollen$used', true);
        $$bind($units['test30.Led'], 'pollen$used', true);
    }
    Blink5.$$privateInit = function() {
    }
    return Blink5;
}
var $$u = $$c();
$units['test30.Blink5'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test30.Blink5'].pollen$used = true;

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
