
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
 * ======== MODULE atmel.atmega.Cpu ========
 */

var $$c = function() {
    const Cpu = {};
    Cpu.Cpu = Cpu
    Cpu.$name = 'atmel.atmega.Cpu';
    Cpu.pollen$used = 0;
    Cpu.reset = new $$Ref('atmel_atmega_Cpu_reset__E');
    Cpu.shutdown = new $$Ref('atmel_atmega_Cpu_shutdown__E');
    Cpu.wait = new $$Ref('atmel_atmega_Cpu_wait__E');
    Cpu.cycle = new $$Ref('atmel_atmega_Cpu_cycle__E');
    Cpu.getFrequency = new $$Ref('atmel_atmega_Cpu_getFrequency__E');
    Cpu.setFrequency = new $$Ref('atmel_atmega_Cpu_setFrequency__E');
    Cpu.targetInit = new $$Ref('atmel_atmega_Cpu_targetInit__I');
    Cpu.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Cpu.getFrequencyOnHost = function() {
        var $$text = '';
        return(  (Cpu.sysFreq)  );
        return $$text;
    }
    Cpu.setFrequencyOnHost = function( hz ) {
        var $$text = '';
        (Cpu.sysFreq) = (hz);
        (Cpu.ticksPerUs) = ((Cpu.sysFreq) / 1000000);
        $$printf("SysFreq = ", (Cpu.sysFreq), " Cpu.ticksPerUs is: ", (Cpu.ticksPerUs), "\n");
        return $$text;
    }
    Cpu.pollen__uses__ = function() {
    }
    Cpu.$$privateInit = function() {
        Cpu.sysFreq = 1000000;
        Cpu.ticksPerUs = 0;
    }
    return Cpu;
}
var $$u = $$c();
$units['atmel.atmega.Cpu'] = $$u;
$units.push($$u);


/*
 * ======== MODULE atmel.atmega.PB4 ========
 */

var $$c = function() {
    const PB4 = {};
    PB4.PB4 = PB4
    PB4.$name = 'atmel.atmega.PB4';
    PB4.pollen$used = 0;
    PB4.set = new $$Ref('atmel_atmega_PB4_set__E');
    PB4.clear = new $$Ref('atmel_atmega_PB4_clear__E');
    PB4.toggle = new $$Ref('atmel_atmega_PB4_toggle__E');
    PB4.get = new $$Ref('atmel_atmega_PB4_get__E');
    PB4.isInput = new $$Ref('atmel_atmega_PB4_isInput__E');
    PB4.isOutput = new $$Ref('atmel_atmega_PB4_isOutput__E');
    PB4.makeInput = new $$Ref('atmel_atmega_PB4_makeInput__E');
    PB4.makeOutput = new $$Ref('atmel_atmega_PB4_makeOutput__E');
    PB4.targetInit = new $$Ref('atmel_atmega_PB4_targetInit__I');
    PB4.port = "B";
    PB4.pin = 4;
    PB4.$$hostInit = function() {
        var $$text = '';
        (PB4.pinMask) = (1 << (PB4.pin));
        return $$text;
    }
    PB4.pollen__uses__ = function() {
    }
    PB4.$$privateInit = function() {
        PB4.pinMask = 0;
    }
    return PB4;
}
var $$u = $$c();
$units['atmel.atmega.PB4'] = $$u;
$units.push($$u);


/*
 * ======== pollen.hardware.HandlerProtocol ========
 */

var $$c = function() {
    const HandlerProtocol = {};
    HandlerProtocol.HandlerProtocol = HandlerProtocol
    HandlerProtocol.$name = 'pollen.hardware.HandlerProtocol';
    HandlerProtocol.pollen$used = 0;
    HandlerProtocol.$$privateInit = function() {
    }
    return HandlerProtocol;
}
var $$u = $$c();
$units['pollen.hardware.HandlerProtocol'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION atmel.atmega.ATmega168 ========
 */

var $$c = function() {
    const ATmega168 = {};
    ATmega168.ATmega168 = ATmega168
    ATmega168.$name = 'atmel.atmega.ATmega168';
    ATmega168.pollen$used = 0;
    ATmega168.Cpu = $units['atmel.atmega.Cpu'];
    ATmega168.GlobalInterrupts = $units['atmel.atmega.GlobalInterrupts'];
    ATmega168.PB0 = $units['atmel.atmega.PB0'];
    ATmega168.PB1 = $units['atmel.atmega.PB1'];
    ATmega168.PB2 = $units['atmel.atmega.PB2'];
    ATmega168.PB3 = $units['atmel.atmega.PB3'];
    ATmega168.PB4 = $units['atmel.atmega.PB4'];
    ATmega168.PB5 = $units['atmel.atmega.PB5'];
    ATmega168.PD0 = $units['atmel.atmega.PD0'];
    ATmega168.PD1 = $units['atmel.atmega.PD1'];
    ATmega168.PD2 = $units['atmel.atmega.PD2'];
    ATmega168.PD3 = $units['atmel.atmega.PD3'];
    ATmega168.PD4 = $units['atmel.atmega.PD4'];
    ATmega168.PD5 = $units['atmel.atmega.PD5'];
    ATmega168.PD6 = $units['atmel.atmega.PD6'];
    ATmega168.PD7 = $units['atmel.atmega.PD7'];
    ATmega168.Timer0OverflowInterrupt = $units['atmel.atmega.Timer0OverflowInterrupt'];
    ATmega168.Timer1MatchAInterrupt = $units['atmel.atmega.Timer1MatchAInterrupt'];
    ATmega168.$$hostInit = function() {
        var $$text = '';
        $units['atmel.atmega.Cpu'].setFrequencyOnHost(16000000);
        return $$text;
    }
    return ATmega168;
}
var $$u = $$c();
$units['atmel.atmega.ATmega168'] = $$u;
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
 * ======== MODULE atmega.gpio.Test_01 ========
 */

var $$c = function() {
    const Test_01 = {};
    Test_01.Test_01 = Test_01
    Test_01.$name = 'atmega.gpio.Test_01';
    Test_01.pollen$used = 0;
    Test_01.PrintImpl = $units['test54.PrintImpl'];
    Test_01.pollen__ready = new $$Ref('atmega_gpio_Test_01_pollen__ready__E');
    Test_01.pollen__run = new $$Ref('atmega_gpio_Test_01_pollen__run__E');
    Test_01.targetInit = new $$Ref('atmega_gpio_Test_01_targetInit__I');
    Test_01.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test_01.pollen__uses__ = function() {
        $$bind($units['atmel.atmega.Cpu'], 'pollen$used', true);
        $$bind($units['atmel.atmega.PB4'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_01.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['atmega.gpio.Test_01'], 'intrinsicPrintProtocol', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_01;
}
var $$u = $$c();
$units['atmega.gpio.Test_01'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['atmega.gpio.Test_01'].pollen$used = true;

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
