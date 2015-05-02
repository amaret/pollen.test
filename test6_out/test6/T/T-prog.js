
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
 * ======== MODULE test6.Y ========
 */

var $$c = function() {
    const Y = {};
    Y.Y = Y
    Y.$name = 'test6.Y';
    Y.pollen$used = 0;
    Y.set = new $$Ref('test6_Y_set__E');
    Y.targetInit = new $$Ref('test6_Y_targetInit__I');
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
$units['test6.Y'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.interfaces.Gpio ========
 */

var $$c = function() {
    const Gpio = {};
    Gpio.Gpio = Gpio
    Gpio.$name = 'pollen.interfaces.Gpio';
    Gpio.pollen$used = 0;
    Gpio.set = new $$Ref('pollen_interfaces_Gpio_set__E');
    Gpio.clear = new $$Ref('pollen_interfaces_Gpio_clear__E');
    Gpio.toggle = new $$Ref('pollen_interfaces_Gpio_toggle__E');
    Gpio.get = new $$Ref('pollen_interfaces_Gpio_get__E');
    Gpio.makeInput = new $$Ref('pollen_interfaces_Gpio_makeInput__E');
    Gpio.isInput = new $$Ref('pollen_interfaces_Gpio_isInput__E');
    Gpio.makeOutput = new $$Ref('pollen_interfaces_Gpio_makeOutput__E');
    Gpio.isOutput = new $$Ref('pollen_interfaces_Gpio_isOutput__E');
    Gpio.targetInit = new $$Ref('pollen_interfaces_Gpio_targetInit__I');
    Gpio.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Gpio.pollen__uses__ = function() {
    }
    Gpio.$$privateInit = function() {
    }
    return Gpio;
}
var $$u = $$c();
$units['pollen.interfaces.Gpio'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test6.Led1 ========
 */

var $$c = function() {
    const Led1 = {};
    Led1.Led1 = Led1
    Led1.$name = 'test6.Led1';
    Led1.pollen$used = 0;
    Led1.LedPin = $units['pollen.interfaces.Gpio'];
    Led1.Z = $units['test6.Y'];
    Led1.targetInit = new $$Ref('test6_Led1_targetInit__I');
    Led1.on = new $$Ref('test6_Led1_on__E');
    Led1.isActiveLow = true;
    Led1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led1.pollen__uses__ = function() {
        $$bind($units['pollen.interfaces.Gpio'], 'pollen$used', true);
        $$bind($units['test6.Y'], 'pollen$used', true);
    }
    Led1.$$privateInit = function() {
        Led1.pollen__unitname = "Led1";
    }
    return Led1;
}
var $$u = $$c();
$units['test6.Led1'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test6.Led2 ========
 */

var $$c = function() {
    const Led2 = {};
    Led2.Led2 = Led2
    Led2.$name = 'test6.Led2';
    Led2.pollen$used = 0;
    Led2.LedPin = $units['pollen.interfaces.Gpio'];
    Led2.Z = $units['test6.Y'];
    Led2.targetInit = new $$Ref('test6_Led2_targetInit__I');
    Led2.on = new $$Ref('test6_Led2_on__E');
    Led2.isActiveLow = false;
    Led2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led2.pollen__uses__ = function() {
        $$bind($units['pollen.interfaces.Gpio'], 'pollen$used', true);
        $$bind($units['test6.Y'], 'pollen$used', true);
    }
    Led2.$$privateInit = function() {
        Led2.pollen__unitname = "Led2";
    }
    return Led2;
}
var $$u = $$c();
$units['test6.Led2'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test6.T ========
 */

var $$c = function() {
    const T = {};
    T.T = T
    T.$name = 'test6.T';
    T.pollen$used = 0;
    T.Y = $units['test6.Y'];
    T.Led1 = $units['test6.Led1'];
    T.Led2 = $units['test6.Led2'];
    T.pollen__run = new $$Ref('test6_T_pollen__run__E');
    T.on = new $$Ref('test6_T_on__I');
    T.targetInit = new $$Ref('test6_T_targetInit__I');
    T.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    T.pollen__uses__ = function() {
        $$bind($units['test6.Y'], 'pollen$used', true);
        $$bind($units['test6.Led1'], 'pollen$used', true);
        $$bind($units['test6.Led2'], 'pollen$used', true);
    }
    T.$$privateInit = function() {
    }
    return T;
}
var $$u = $$c();
$units['test6.T'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test6.T'].pollen$used = true;

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
