
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
 * ======== MODULE local.mcu.Cpu ========
 */

var $$c = function() {
    const Cpu = {};
    Cpu.Cpu = Cpu
    Cpu.$name = 'local.mcu.Cpu';
    Cpu.pollen$used = 0;
    Cpu.reset = new $$Ref('local_mcu_Cpu_reset__E');
    Cpu.shutdown = new $$Ref('local_mcu_Cpu_shutdown__E');
    Cpu.wait = new $$Ref('local_mcu_Cpu_wait__E');
    Cpu.cycle = new $$Ref('local_mcu_Cpu_cycle__E');
    Cpu.getFrequency = new $$Ref('local_mcu_Cpu_getFrequency__E');
    Cpu.setFrequency = new $$Ref('local_mcu_Cpu_setFrequency__E');
    Cpu.targetInit = new $$Ref('local_mcu_Cpu_targetInit__I');
    Cpu.getFrequencyOnHost = function() {
        var $$text = '';
        return(  (Cpu.sysFreq)  );
        return $$text;
    }
    Cpu.setFrequencyOnHost = function( hz ) {
        var $$text = '';
        (Cpu.sysFreq) = (hz);
        return $$text;
    }
    Cpu.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Cpu.pollen__uses__ = function() {
    }
    Cpu.$$privateInit = function() {
        Cpu.sysFreq = 0;
    }
    return Cpu;
}
var $$u = $$c();
$units['local.mcu.Cpu'] = $$u;
$units.push($$u);


/*
 * ======== pollen.hardware.GlobalInterruptsProtocol ========
 */

var $$c = function() {
    const GlobalInterruptsProtocol = {};
    GlobalInterruptsProtocol.GlobalInterruptsProtocol = GlobalInterruptsProtocol
    GlobalInterruptsProtocol.$name = 'pollen.hardware.GlobalInterruptsProtocol';
    GlobalInterruptsProtocol.pollen$used = 0;
    GlobalInterruptsProtocol.pollen__uses__ = function() {
    }
    GlobalInterruptsProtocol.$$privateInit = function() {
    }
    return GlobalInterruptsProtocol;
}
var $$u = $$c();
$units['pollen.hardware.GlobalInterruptsProtocol'] = $$u;
$units.push($$u);


/*
 * ======== MODULE local.mcu.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'local.mcu.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.enable = new $$Ref('local_mcu_GlobalInterrupts_enable__E');
    GlobalInterrupts.disable = new $$Ref('local_mcu_GlobalInterrupts_disable__E');
    GlobalInterrupts.restore = new $$Ref('local_mcu_GlobalInterrupts_restore__E');
    GlobalInterrupts.isEnabled = new $$Ref('local_mcu_GlobalInterrupts_isEnabled__E');
    GlobalInterrupts.targetInit = new $$Ref('local_mcu_GlobalInterrupts_targetInit__I');
    GlobalInterrupts.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    GlobalInterrupts.pollen__uses__ = function() {
    }
    GlobalInterrupts.$$privateInit = function() {
        GlobalInterrupts.enabled = false;
    }
    return GlobalInterrupts;
}
var $$u = $$c();
$units['local.mcu.GlobalInterrupts'] = $$u;
$units.push($$u);


/*
 * ======== pollen.event.HandlerProtocol ========
 */

var $$c = function() {
    const HandlerProtocol = {};
    HandlerProtocol.HandlerProtocol = HandlerProtocol
    HandlerProtocol.$name = 'pollen.event.HandlerProtocol';
    HandlerProtocol.pollen$used = 0;
    HandlerProtocol.pollen__uses__ = function() {
    }
    HandlerProtocol.$$privateInit = function() {
    }
    return HandlerProtocol;
}
var $$u = $$c();
$units['pollen.event.HandlerProtocol'] = $$u;
$units.push($$u);


/*
 * ======== pollen.hardware.HardwareTimerProtocol ========
 */

var $$c = function() {
    const HardwareTimerProtocol = {};
    HardwareTimerProtocol.HardwareTimerProtocol = HardwareTimerProtocol
    HardwareTimerProtocol.$name = 'pollen.hardware.HardwareTimerProtocol';
    HardwareTimerProtocol.pollen$used = 0;
    HardwareTimerProtocol.pollen__uses__ = function() {
    }
    HardwareTimerProtocol.$$privateInit = function() {
    }
    return HardwareTimerProtocol;
}
var $$u = $$c();
$units['pollen.hardware.HardwareTimerProtocol'] = $$u;
$units.push($$u);


/*
 * ======== MODULE local.mcu.TimerMilli ========
 */

var $$c = function() {
    const TimerMilli = {};
    TimerMilli.TimerMilli = TimerMilli
    TimerMilli.$name = 'local.mcu.TimerMilli';
    TimerMilli.pollen$used = 0;
    TimerMilli.targetInit = new $$Ref('local_mcu_TimerMilli_targetInit__I');
    TimerMilli.setHandler = new $$Ref('local_mcu_TimerMilli_setHandler__E');
    TimerMilli.start = new $$Ref('local_mcu_TimerMilli_start__E');
    TimerMilli.stop = new $$Ref('local_mcu_TimerMilli_stop__E');
    TimerMilli.isRunning = new $$Ref('local_mcu_TimerMilli_isRunning__E');
    TimerMilli.resetTimer = new $$Ref('local_mcu_TimerMilli_resetTimer__I');
    TimerMilli.sigAlarm = new $$Ref('local_mcu_TimerMilli_sigAlarm__I');
    TimerMilli.setHandlerOnHost = function( h ) {
        var $$text = '';
        (TimerMilli.tickHandler) = (h);
        return $$text;
    }
    TimerMilli.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TimerMilli.pollen__uses__ = function() {
    }
    TimerMilli.$$privateInit = function() {
        TimerMilli.repeat = false;
    }
    return TimerMilli;
}
var $$u = $$c();
$units['local.mcu.TimerMilli'] = $$u;
$units.push($$u);


/*
 * ======== pollen.hardware.PinProtocol ========
 */

var $$c = function() {
    const PinProtocol = {};
    PinProtocol.PinProtocol = PinProtocol
    PinProtocol.$name = 'pollen.hardware.PinProtocol';
    PinProtocol.pollen$used = 0;
    PinProtocol.pollen__uses__ = function() {
    }
    PinProtocol.$$privateInit = function() {
    }
    return PinProtocol;
}
var $$u = $$c();
$units['pollen.hardware.PinProtocol'] = $$u;
$units.push($$u);


/*
 * ======== MODULE local.mcu.Pin0 ========
 */

var $$c = function() {
    const Pin0 = {};
    Pin0.Pin0 = Pin0
    Pin0.$name = 'local.mcu.Pin0';
    Pin0.pollen$used = 0;
    Pin0.targetInit = new $$Ref('local_mcu_Pin0_targetInit__I');
    Pin0.set = new $$Ref('local_mcu_Pin0_set__E');
    Pin0.clear = new $$Ref('local_mcu_Pin0_clear__E');
    Pin0.toggle = new $$Ref('local_mcu_Pin0_toggle__E');
    Pin0.get = new $$Ref('local_mcu_Pin0_get__E');
    Pin0.makeInput = new $$Ref('local_mcu_Pin0_makeInput__E');
    Pin0.isInput = new $$Ref('local_mcu_Pin0_isInput__E');
    Pin0.makeOutput = new $$Ref('local_mcu_Pin0_makeOutput__E');
    Pin0.isOutput = new $$Ref('local_mcu_Pin0_isOutput__E');
    Pin0.pname = "Pin";
    Pin0.pnum = 0;
    Pin0.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Pin0.pollen__uses__ = function() {
    }
    Pin0.$$privateInit = function() {
        Pin0.name = null;
        Pin0.num = 0;
        Pin0.state = 0;
        Pin0.input = 0;
        Pin0.pollen__unitname = "Pin0";
    }
    return Pin0;
}
var $$u = $$c();
$units['local.mcu.Pin0'] = $$u;
$units.push($$u);


/*
 * ======== MODULE local.mcu.Pin1 ========
 */

var $$c = function() {
    const Pin1 = {};
    Pin1.Pin1 = Pin1
    Pin1.$name = 'local.mcu.Pin1';
    Pin1.pollen$used = 0;
    Pin1.targetInit = new $$Ref('local_mcu_Pin1_targetInit__I');
    Pin1.set = new $$Ref('local_mcu_Pin1_set__E');
    Pin1.clear = new $$Ref('local_mcu_Pin1_clear__E');
    Pin1.toggle = new $$Ref('local_mcu_Pin1_toggle__E');
    Pin1.get = new $$Ref('local_mcu_Pin1_get__E');
    Pin1.makeInput = new $$Ref('local_mcu_Pin1_makeInput__E');
    Pin1.isInput = new $$Ref('local_mcu_Pin1_isInput__E');
    Pin1.makeOutput = new $$Ref('local_mcu_Pin1_makeOutput__E');
    Pin1.isOutput = new $$Ref('local_mcu_Pin1_isOutput__E');
    Pin1.pname = "Pin";
    Pin1.pnum = 1;
    Pin1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Pin1.pollen__uses__ = function() {
    }
    Pin1.$$privateInit = function() {
        Pin1.name = null;
        Pin1.num = 0;
        Pin1.state = 0;
        Pin1.input = 0;
        Pin1.pollen__unitname = "Pin1";
    }
    return Pin1;
}
var $$u = $$c();
$units['local.mcu.Pin1'] = $$u;
$units.push($$u);


/*
 * ======== MODULE local.mcu.Pin2 ========
 */

var $$c = function() {
    const Pin2 = {};
    Pin2.Pin2 = Pin2
    Pin2.$name = 'local.mcu.Pin2';
    Pin2.pollen$used = 0;
    Pin2.targetInit = new $$Ref('local_mcu_Pin2_targetInit__I');
    Pin2.set = new $$Ref('local_mcu_Pin2_set__E');
    Pin2.clear = new $$Ref('local_mcu_Pin2_clear__E');
    Pin2.toggle = new $$Ref('local_mcu_Pin2_toggle__E');
    Pin2.get = new $$Ref('local_mcu_Pin2_get__E');
    Pin2.makeInput = new $$Ref('local_mcu_Pin2_makeInput__E');
    Pin2.isInput = new $$Ref('local_mcu_Pin2_isInput__E');
    Pin2.makeOutput = new $$Ref('local_mcu_Pin2_makeOutput__E');
    Pin2.isOutput = new $$Ref('local_mcu_Pin2_isOutput__E');
    Pin2.pname = "Pin";
    Pin2.pnum = 2;
    Pin2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Pin2.pollen__uses__ = function() {
    }
    Pin2.$$privateInit = function() {
        Pin2.name = null;
        Pin2.num = 0;
        Pin2.state = 0;
        Pin2.input = 0;
        Pin2.pollen__unitname = "Pin2";
    }
    return Pin2;
}
var $$u = $$c();
$units['local.mcu.Pin2'] = $$u;
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
 * ======== MODULE local.mcu.ConsolePrint ========
 */

var $$c = function() {
    const ConsolePrint = {};
    ConsolePrint.ConsolePrint = ConsolePrint
    ConsolePrint.$name = 'local.mcu.ConsolePrint';
    ConsolePrint.pollen$used = 0;
    ConsolePrint.printBool = new $$Ref('local_mcu_ConsolePrint_printBool__E');
    ConsolePrint.printInt = new $$Ref('local_mcu_ConsolePrint_printInt__E');
    ConsolePrint.printReal = new $$Ref('local_mcu_ConsolePrint_printReal__E');
    ConsolePrint.printUint = new $$Ref('local_mcu_ConsolePrint_printUint__E');
    ConsolePrint.printStr = new $$Ref('local_mcu_ConsolePrint_printStr__E');
    ConsolePrint.targetInit = new $$Ref('local_mcu_ConsolePrint_targetInit__I');
    ConsolePrint.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    ConsolePrint.pollen__uses__ = function() {
    }
    ConsolePrint.$$privateInit = function() {
        ConsolePrint.HEADER = "\033[95m";
        ConsolePrint.OKBLUE = "\033[94m";
        ConsolePrint.OKGREEN = "\033[92m";
        ConsolePrint.WARNING = "\033[93m";
        ConsolePrint.FAIL = "\033[91m";
        ConsolePrint.ENDC = "\033[0m";
    }
    return ConsolePrint;
}
var $$u = $$c();
$units['local.mcu.ConsolePrint'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.math.Random8 ========
 */

var $$c = function() {
    const Random8 = {};
    Random8.Random8 = Random8
    Random8.$name = 'pollen.math.Random8';
    Random8.pollen$used = 0;
    Random8.srand8 = new $$Ref('pollen_math_Random8_srand8__E');
    Random8.rand8 = new $$Ref('pollen_math_Random8_rand8__E');
    Random8.rand8f = new $$Ref('pollen_math_Random8_rand8f__E');
    Random8.targetInit = new $$Ref('pollen_math_Random8_targetInit__I');
    Random8.$$hostInit = function() {
        var $$text = '';
        (Random8.seed) = 0xAC;
        (Random8.lfsr) = (Random8.seed);
        (Random8.period) = 0;
        return $$text;
    }
    Random8.pollen__uses__ = function() {
    }
    Random8.$$privateInit = function() {
        Random8.seed = 0xAC;
        Random8.lfsr = (Random8.seed);
        Random8.period = 0;
    }
    return Random8;
}
var $$u = $$c();
$units['pollen.math.Random8'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.math.Random16 ========
 */

var $$c = function() {
    const Random16 = {};
    Random16.Random16 = Random16
    Random16.$name = 'pollen.math.Random16';
    Random16.pollen$used = 0;
    Random16.srand16 = new $$Ref('pollen_math_Random16_srand16__E');
    Random16.rand16 = new $$Ref('pollen_math_Random16_rand16__E');
    Random16.rand16f = new $$Ref('pollen_math_Random16_rand16f__E');
    Random16.targetInit = new $$Ref('pollen_math_Random16_targetInit__I');
    Random16.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Random16.pollen__uses__ = function() {
    }
    Random16.$$privateInit = function() {
        Random16.seed = 0xACE1;
        Random16.lfsr = (Random16.seed);
        Random16.period = 0;
    }
    return Random16;
}
var $$u = $$c();
$units['pollen.math.Random16'] = $$u;
$units.push($$u);


/*
 * ======== CLASS bijou.parts.LedState ========
 */

var $$c = function() {
    const LedState = {};
    LedState.LedState = LedState
    LedState.$name = 'bijou.parts.LedState';
    LedState.pollen$used = 0;
    LedState.LedState$$id = 1;
    LedState.LedState = function(cn) {
        this.$$id = LedState.LedState$$id++;
        this.$$cname = cn ? cn : 'bijou_parts_LedState_LedState__'+this.$$id+'__S';
        this.$$tname = 'bijou_parts_LedState_LedState';
        this.$$uname = 'bijou.parts.LedState';
        this.id = 0;
    }
    LedState.LedState.prototype = new $$Struct('bijou.parts.LedState.LedState');
    LedState.LedState.prototype.$$isAggFld = {};
    LedState.LedState.prototype.$$isAggFld.id = false;
    LedState.LedState.prototype.$$isAggFld.rgba = true;
    LedState.LedState.prototype.new_host = function( id ) {
        var $$text = '';
        this.$$privateInit();
        this.rgba = new $$Array(4, function($$cn,$$idx){ return 0;}, 'bijou_parts_LedState_rgba__A', false); this.rgba.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 0, 0, 0 ]));
        if (arguments.length == 1) {
                this.id = (id);
                (this.rgba).set(($units['bijou.parts.LedState'].Colors_Red), 0);
                (this.rgba).set(($units['bijou.parts.LedState'].Colors_Green), 0);
                (this.rgba).set(($units['bijou.parts.LedState'].Colors_Blue), 0);
                (this.rgba).set(($units['bijou.parts.LedState'].Colors_Alpha), 255);
        }
        this.$$hostInitLastPass();
        return this;
    }
    LedState.pollen__uses__ = function() {
        $$bind($units['local.mcu.Cpu'], 'pollen$used', true);
        $$bind($units['local.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['local.mcu.TimerMilli'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin0'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin1'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin2'], 'pollen$used', true);
        $$bind($units['local.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['local.parts.ColorLed'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led0'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led1'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led2'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
        $$bind($units['localhost.Lifecycle'], 'pollen$used', true);
        $$bind($units['pollen.math.Random8'], 'pollen$used', true);
        $$bind($units['pollen.math.Random16'], 'pollen$used', true);
    }
    LedState.LedState.prototype.$$privateInit = function() {
        this.id = 0;
        this.rgba = new $$Array(4, function($$cn,$$idx){ return 0;}, 'bijou_parts_LedState_rgba__A', false); this.rgba.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 0, 0, 0 ]));
    }
    LedState.LedState.prototype.$$hostInitLastPass = function() {
    }
    return LedState;
}
var $$u = $$c();
$units['bijou.parts.LedState'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.text.Text ========
 */

var $$c = function() {
    const Text = {};
    Text.Text = Text
    Text.$name = 'pollen.text.Text';
    Text.pollen$used = 0;
    Text.itoa = new $$Ref('pollen_text_Text_itoa__E');
    Text.reverse = new $$Ref('pollen_text_Text_reverse__E');
    Text.strcmp = new $$Ref('pollen_text_Text_strcmp__E');
    Text.strncmp = new $$Ref('pollen_text_Text_strncmp__E');
    Text.strlen = new $$Ref('pollen_text_Text_strlen__E');
    Text.targetInit = new $$Ref('pollen_text_Text_targetInit__I');
    Text.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Text.pollen__uses__ = function() {
    }
    Text.$$privateInit = function() {
    }
    return Text;
}
var $$u = $$c();
$units['pollen.text.Text'] = $$u;
$units.push($$u);


/*
 * ======== MODULE local.output.SendOsc ========
 */

var $$c = function() {
    const SendOsc = {};
    SendOsc.SendOsc = SendOsc
    SendOsc.$name = 'local.output.SendOsc';
    SendOsc.pollen$used = 0;
    SendOsc.Text = $units['pollen.text.Text'];
    SendOsc.sendRGB = new $$Ref('local_output_SendOsc_sendRGB__E');
    SendOsc.sprint = new $$Ref('local_output_SendOsc_sprint__I');
    SendOsc.targetInit = new $$Ref('local_output_SendOsc_targetInit__I');
    SendOsc.$$hostInit = function() {
        var $$text = '';
        SendOsc.data = new $$Array(50, function($$cn,$$idx){ return 0;}, 'local_output_SendOsc_data__A', false); SendOsc.data.$$assign((new $$Array(50, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]));
        return $$text;
    }
    SendOsc.pollen__uses__ = function() {
        $$bind($units['pollen.text.Text'], 'pollen$used', true);
    }
    SendOsc.$$privateInit = function() {
        SendOsc.header = "oscsend 127.0.0.1 7000 /led/1 iii ";
        SendOsc.data = new $$Array(50, function($$cn,$$idx){ return 0;}, 'local_output_SendOsc_data__A', false); SendOsc.data.$$assign((new $$Array(50, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]));
    }
    return SendOsc;
}
var $$u = $$c();
$units['local.output.SendOsc'] = $$u;
$units.push($$u);


/*
 * ======== MODULE local.parts.ColorLed ========
 */

var $$c = function() {
    const ColorLed = {};
    ColorLed.ColorLed = ColorLed
    ColorLed.$name = 'local.parts.ColorLed';
    ColorLed.pollen$used = 0;
    ColorLed.LedState = $units['bijou.parts.LedState'];
    ColorLed.SendOsc = $units['local.output.SendOsc'];
    ColorLed.targetInit = new $$Ref('local_parts_ColorLed_targetInit__I');
    ColorLed.setState = new $$Ref('local_parts_ColorLed_setState__E');
    ColorLed.setRGBA = new $$Ref('local_parts_ColorLed_setRGBA__E');
    ColorLed.setRGB = new $$Ref('local_parts_ColorLed_setRGB__E');
    ColorLed.getRGB = new $$Ref('local_parts_ColorLed_getRGB__E');
    ColorLed.getRGBA = new $$Ref('local_parts_ColorLed_getRGBA__E');
    ColorLed.doSetColor = new $$Ref('local_parts_ColorLed_doSetColor__I');
    ColorLed.$$hostInit = function() {
        var $$text = '';
        ColorLed.state = new $units['bijou.parts.LedState'].LedState('local_parts_ColorLed_state__V'); ColorLed.state.new_host(0);
        return $$text;
    }
    ColorLed.pollen__uses__ = function() {
        $$bind($units['bijou.parts.LedState'], 'pollen$used', true);
        $$bind($units['local.output.SendOsc'], 'pollen$used', true);
    }
    ColorLed.$$privateInit = function() {
    }
    return ColorLed;
}
var $$u = $$c();
$units['local.parts.ColorLed'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.parts.Led0 ========
 */

var $$c = function() {
    const Led0 = {};
    Led0.Led0 = Led0
    Led0.$name = 'pollen.parts.Led0';
    Led0.pollen$used = 0;
    Led0.targetInit = new $$Ref('pollen_parts_Led0_targetInit__E');
    Led0.on = new $$Ref('pollen_parts_Led0_on__E');
    Led0.off = new $$Ref('pollen_parts_Led0_off__E');
    Led0.toggle = new $$Ref('pollen_parts_Led0_toggle__E');
    Led0.isOn = new $$Ref('pollen_parts_Led0_isOn__E');
    Led0.activeLow = false;
    Led0.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led0.pollen__uses__ = function() {
    }
    Led0.$$privateInit = function() {
        Led0.pin = 0;
    }
    return Led0;
}
var $$u = $$c();
$units['pollen.parts.Led0'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.parts.Led1 ========
 */

var $$c = function() {
    const Led1 = {};
    Led1.Led1 = Led1
    Led1.$name = 'pollen.parts.Led1';
    Led1.pollen$used = 0;
    Led1.targetInit = new $$Ref('pollen_parts_Led1_targetInit__E');
    Led1.on = new $$Ref('pollen_parts_Led1_on__E');
    Led1.off = new $$Ref('pollen_parts_Led1_off__E');
    Led1.toggle = new $$Ref('pollen_parts_Led1_toggle__E');
    Led1.isOn = new $$Ref('pollen_parts_Led1_isOn__E');
    Led1.activeLow = false;
    Led1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led1.pollen__uses__ = function() {
    }
    Led1.$$privateInit = function() {
        Led1.pin = 0;
    }
    return Led1;
}
var $$u = $$c();
$units['pollen.parts.Led1'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.parts.Led2 ========
 */

var $$c = function() {
    const Led2 = {};
    Led2.Led2 = Led2
    Led2.$name = 'pollen.parts.Led2';
    Led2.pollen$used = 0;
    Led2.targetInit = new $$Ref('pollen_parts_Led2_targetInit__E');
    Led2.on = new $$Ref('pollen_parts_Led2_on__E');
    Led2.off = new $$Ref('pollen_parts_Led2_off__E');
    Led2.toggle = new $$Ref('pollen_parts_Led2_toggle__E');
    Led2.isOn = new $$Ref('pollen_parts_Led2_isOn__E');
    Led2.activeLow = false;
    Led2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led2.pollen__uses__ = function() {
    }
    Led2.$$privateInit = function() {
        Led2.pin = 0;
    }
    return Led2;
}
var $$u = $$c();
$units['pollen.parts.Led2'] = $$u;
$units.push($$u);


/*
 * ======== CLASS pollen.event.Event ========
 */

var $$c = function() {
    const Event = {};
    Event.Event = Event
    Event.$name = 'pollen.event.Event';
    Event.pollen$used = 0;
    Event.Newsroom = $units['pollen.event.Newsroom'];
    Event.Event$$id = 1;
    Event.Event = function(cn) {
        this.$$id = Event.Event$$id++;
        this.$$cname = cn ? cn : 'pollen_event_Event_Event__'+this.$$id+'__S';
        this.$$tname = 'pollen_event_Event_Event';
        this.$$uname = 'pollen.event.Event';
        this.eventHandler = null;
    }
    Event.Event.prototype = new $$Struct('pollen.event.Event.Event');
    Event.Event.prototype.$$isAggFld = {};
    Event.Event.prototype.$$isAggFld.eventHandler = false;
    Event.Event.prototype.new_host = function( h ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                this.eventHandler = (h);
                $units['pollen.event.Newsroom'].registerEventOnHost();
        }
        this.$$hostInitLastPass();
        return this;
    }
    Event.Event.prototype.setHandlerOnHost = function( h ) {
        var $$text = '';
        this.eventHandler = (h);
        $units['pollen.event.Newsroom'].registerEventOnHost();
        this.$$hostInitLastPass();
        return $$text;
    }
    Event.pollen__uses__ = function() {
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
    }
    Event.Event.prototype.$$privateInit = function() {
    }
    Event.Event.prototype.$$hostInitLastPass = function() {
    }
    return Event;
}
var $$u = $$c();
$units['pollen.event.Event'] = $$u;
$units.push($$u);


/*
 * ======== CLASS pollen.event.EventQueue ========
 */

var $$c = function() {
    const EventQueue = {};
    EventQueue.EventQueue = EventQueue
    EventQueue.$name = 'pollen.event.EventQueue';
    EventQueue.pollen$used = 0;
    EventQueue.Event = $units['pollen.event.Event'];
    EventQueue.EventQueue$$id = 1;
    EventQueue.EventQueue = function(cn) {
        this.$$id = EventQueue.EventQueue$$id++;
        this.$$cname = cn ? cn : 'pollen_event_EventQueue_EventQueue__'+this.$$id+'__S';
        this.$$tname = 'pollen_event_EventQueue_EventQueue';
        this.$$uname = 'pollen.event.EventQueue';
        this.capacity = 1;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
    }
    EventQueue.EventQueue.prototype = new $$Struct('pollen.event.EventQueue.EventQueue');
    EventQueue.EventQueue.prototype.$$isAggFld = {};
    EventQueue.EventQueue.prototype.$$isAggFld.capacity = false;
    EventQueue.EventQueue.prototype.$$isAggFld.elements = true;
    EventQueue.EventQueue.prototype.$$isAggFld.length = false;
    EventQueue.EventQueue.prototype.$$isAggFld.head = false;
    EventQueue.EventQueue.prototype.$$isAggFld.tail = false;
    EventQueue.EventQueue.prototype.new_host = function( max ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                this.length = 0;
                this.head = 0;
                this.tail = 0;
                this.capacity = (max);
        }
        this.$$hostInitLastPass();
        return this;
    }
    EventQueue.EventQueue.prototype.setCapacityOnHost = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        $$printf("EventQueue: setting new capacity =", this.capacity, "\n");
        this.$$hostInitLastPass();
        return $$text;
    }
    EventQueue.EventQueue.prototype.getCapacityOnHost = function() {
        var $$text = '';
        return(  this.capacity  );
        this.$$hostInitLastPass();
        return $$text;
    }
    EventQueue.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
    }
    EventQueue.EventQueue.prototype.$$privateInit = function() {
        this.capacity = 1;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
    }
    EventQueue.EventQueue.prototype.$$hostInitLastPass = function() {
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_event_EventQueue_elements__A', false); this.elements.$$assign((new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null ]));
    }
    return EventQueue;
}
var $$u = $$c();
$units['pollen.event.EventQueue'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.event.Newsroom ========
 */

var $$c = function() {
    const Newsroom = {};
    Newsroom.Newsroom = Newsroom
    Newsroom.$name = 'pollen.event.Newsroom';
    Newsroom.pollen$used = 0;
    Newsroom.Event = $units['pollen.event.Event'];
    Newsroom.EventQueue = $units['pollen.event.EventQueue'];
    Newsroom.targetInit = new $$Ref('pollen_event_Newsroom_targetInit__I');
    Newsroom.post = new $$Ref('pollen_event_Newsroom_post__E');
    Newsroom.postFromInterrupt = new $$Ref('pollen_event_Newsroom_postFromInterrupt__E');
    Newsroom.run = new $$Ref('pollen_event_Newsroom_run__E');
    Newsroom.dispatch = new $$Ref('pollen_event_Newsroom_dispatch__I');
    Newsroom.$$hostInit = function() {
        var $$text = '';
        Newsroom.events = new $units['pollen.event.EventQueue'].EventQueue('pollen_event_Newsroom_events__V'); Newsroom.events.new_host(0);
        return $$text;
    }
    Newsroom.registerEventOnHost = function() {
        var $$text = '';
        Newsroom.events.setCapacityOnHost(Newsroom.events.getCapacityOnHost() + 1);
        $$printf("Newsroom: event registered. Event capacity = ", Newsroom.events.getCapacityOnHost(), "\n");
        return $$text;
    }
    Newsroom.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['pollen.event.EventQueue'], 'pollen$used', true);
    }
    Newsroom.$$privateInit = function() {
        Newsroom.GI = 0;
    }
    return Newsroom;
}
var $$u = $$c();
$units['pollen.event.Newsroom'] = $$u;
$units.push($$u);


/*
 * ======== CLASS pollen.time.Timer ========
 */

var $$c = function() {
    const Timer = {};
    Timer.Timer = Timer
    Timer.$name = 'pollen.time.Timer';
    Timer.pollen$used = 0;
    Timer.Event = $units['pollen.event.Event'];
    Timer.TimerManager = $units['pollen.time.TimerManager'];
    Timer.Timer$$id = 1;
    Timer.Timer = function(cn) {
        this.$$id = Timer.Timer$$id++;
        this.$$cname = cn ? cn : 'pollen_time_Timer_Timer__'+this.$$id+'__S';
        this.$$tname = 'pollen_time_Timer_Timer';
        this.$$uname = 'pollen.time.Timer';
        this.eventHandler = null;
        this.active = false;
        this.periodic = false;
        this.duration = 0;
        this.tickCount = 0;
        this.added = false;
    }
    Timer.Timer.prototype = new $$Struct('pollen.time.Timer.Timer');
    Timer.Timer.prototype.$$isAggFld = {};
    Timer.Timer.prototype.$$isAggFld.eventHandler = false;
    Timer.Timer.prototype.$$isAggFld.tickEvent = false;
    Timer.Timer.prototype.$$isAggFld.active = false;
    Timer.Timer.prototype.$$isAggFld.periodic = false;
    Timer.Timer.prototype.$$isAggFld.duration = false;
    Timer.Timer.prototype.$$isAggFld.tickCount = false;
    Timer.Timer.prototype.$$isAggFld.added = false;
    Timer.Timer.prototype.new_host = function( h ) {
        var $$text = '';
        this.$$privateInit();
        this.tickEvent = new $units['pollen.event.Event'].Event('pollen_time_Timer_tickEvent__V');
        if (arguments.length == 1) {
                (this.tickEvent) = new $units['pollen.event.Event'].Event().new_host((h));
                $units['pollen.time.TimerManager'].registerTimerOnHost(this);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Timer.Timer.prototype.getDurationOnHost = function() {
        var $$text = '';
        return(  this.duration  );
        this.$$hostInitLastPass();
        return $$text;
    }
    Timer.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
    }
    Timer.Timer.prototype.$$privateInit = function() {
        this.active = false;
        this.periodic = false;
        this.duration = 0;
        this.tickCount = 0;
        this.added = false;
    }
    Timer.Timer.prototype.$$hostInitLastPass = function() {
    }
    return Timer;
}
var $$u = $$c();
$units['pollen.time.Timer'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.time.TimerManager ========
 */

var $$c = function() {
    const TimerManager = {};
    TimerManager.TimerManager = TimerManager
    TimerManager.$name = 'pollen.time.TimerManager';
    TimerManager.pollen$used = 0;
    TimerManager.Timer = $units['pollen.time.Timer'];
    TimerManager.targetInit = new $$Ref('pollen_time_TimerManager_targetInit__I');
    TimerManager.addTimer = new $$Ref('pollen_time_TimerManager_addTimer__E');
    TimerManager.start = new $$Ref('pollen_time_TimerManager_start__E');
    TimerManager.stop = new $$Ref('pollen_time_TimerManager_stop__E');
    TimerManager.isActive = new $$Ref('pollen_time_TimerManager_isActive__E');
    TimerManager.tickISR = new $$Ref('pollen_time_TimerManager_tickISR__I');
    TimerManager.$$hostInit = function() {
        var $$text = '';
        $units['local.mcu.TimerMilli'].setHandlerOnHost((TimerManager.tickISR));
        (TimerManager.numMsTimers) = 0;
        return $$text;
    }
    TimerManager.registerTimerOnHost = function( t ) {
        var $$text = '';
        (TimerManager.numMsTimers) += 1;
        $$printf("TimerManager: registering milli timer ", "(total=", (TimerManager.numMsTimers), ")\n");
        return $$text;
    }
    TimerManager.pollen__uses__ = function() {
        $$bind($units['pollen.time.Timer'], 'pollen$used', true);
    }
    TimerManager.$$privateInit = function() {
        TimerManager.hwTimer = 0;
        TimerManager.numMsTimers = 1;
    }
    TimerManager.$$hostInitLastPass = function() {
        TimerManager.msTimers = new $$Array((TimerManager.numMsTimers), function($$cn,$$idx){ return 0;}, 'pollen_time_TimerManager_msTimers__A', false); TimerManager.msTimers.$$assign((new $$Array((TimerManager.numMsTimers), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null ]));
    }
    return TimerManager;
}
var $$u = $$c();
$units['pollen.time.TimerManager'] = $$u;
$units.push($$u);


/*
 * ======== MODULE localhost.Lifecycle ========
 */

var $$c = function() {
    const Lifecycle = {};
    Lifecycle.Lifecycle = Lifecycle
    Lifecycle.$name = 'localhost.Lifecycle';
    Lifecycle.pollen$used = 0;
    Lifecycle.pollen__reset = new $$Ref('localhost_Lifecycle_pollen__reset__E');
    Lifecycle.pollen__ready = new $$Ref('localhost_Lifecycle_pollen__ready__E');
    Lifecycle.pollen__shutdown = new $$Ref('localhost_Lifecycle_pollen__shutdown__E');
    Lifecycle.targetInit = new $$Ref('localhost_Lifecycle_targetInit__I');
    Lifecycle.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Lifecycle.pollen__uses__ = function() {
        $$bind($units['local.mcu.Cpu'], 'pollen$used', true);
        $$bind($units['local.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['local.mcu.TimerMilli'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin0'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin1'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin2'], 'pollen$used', true);
        $$bind($units['local.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['local.parts.ColorLed'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led0'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led1'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led2'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
        $$bind($units['localhost.Lifecycle'], 'pollen$used', true);
    }
    Lifecycle.$$privateInit = function() {
    }
    return Lifecycle;
}
var $$u = $$c();
$units['localhost.Lifecycle'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION localhost.LocalHost ========
 */

var $$c = function() {
    const LocalHost = {};
    LocalHost.LocalHost = LocalHost
    LocalHost.$name = 'localhost.LocalHost';
    LocalHost.pollen$used = 0;
    LocalHost.TimerMilli = $units['local.mcu.TimerMilli'];
    LocalHost.GlobalInterrupts = $units['local.mcu.GlobalInterrupts'];
    LocalHost.ConsolePrint = $units['local.mcu.ConsolePrint'];
    LocalHost.ColorLed = $units['local.parts.ColorLed'];
    LocalHost.Led0 = $units['pollen.parts.Led0'];
    LocalHost.Led1 = $units['pollen.parts.Led1'];
    LocalHost.Led2 = $units['pollen.parts.Led2'];
    LocalHost.Newsroom = $units['pollen.event.Newsroom'];
    LocalHost.TimerManager = $units['pollen.time.TimerManager'];
    LocalHost.Lifecycle = $units['localhost.Lifecycle'];
    LocalHost.pollen__presets__ = function() {
        var $$text = '';
        var $$v = 'local_mcu_GlobalInterrupts';
        var $$s = $$bind($units['localhost.LocalHost'], 'Newsroom.GI', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.GlobalInterrupts'].pollen$used = true;}


        var $$v = 'local_mcu_TimerMilli';
        var $$s = $$bind($units['localhost.LocalHost'], 'TimerManager.hwTimer', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.TimerMilli'].pollen$used = true;}


        var $$v = 'local_mcu_Pin0';
        var $$s = $$bind($units['localhost.LocalHost'], 'Led0.pin', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.Pin0'].pollen$used = true;}


        var $$v = 'local_mcu_Pin1';
        var $$s = $$bind($units['localhost.LocalHost'], 'Led1.pin', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.Pin1'].pollen$used = true;}


        var $$v = 'local_mcu_Pin2';
        var $$s = $$bind($units['localhost.LocalHost'], 'Led2.pin', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.Pin2'].pollen$used = true;}


        var $$v = 'local_mcu_ConsolePrint';
        var $$s = $$bind($units['localhost.LocalHost'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.ConsolePrint'].pollen$used = true;}


        return $$text;
    }
    return LocalHost;
}
var $$u = $$c();
$units['localhost.LocalHost'] = $$u;
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
 * ======== MODULE test90.Test_03 ========
 */

var $$c = function() {
    const Test_03 = {};
    Test_03.Test_03 = Test_03
    Test_03.$name = 'test90.Test_03';
    Test_03.pollen$used = 0;
    Test_03.Timer = $units['pollen.time.Timer'];
    Test_03.PrintImpl = $units['test54.PrintImpl'];
    Test_03.tick = new $$Ref('test90_Test_03_tick__I');
    Test_03.pollen__run = new $$Ref('test90_Test_03_pollen__run__E');
    Test_03.targetInit = new $$Ref('test90_Test_03_targetInit__I');
    Test_03.$$hostInit = function() {
        var $$text = '';
        Test_03.t1 = new $units['pollen.time.Timer'].Timer('test90_Test_03_t1__V'); Test_03.t1.new_host((Test_03.tick));
        return $$text;
    }
    Test_03.pollen__uses__ = function() {
        $$bind($units['local.mcu.Cpu'], 'pollen$used', true);
        $$bind($units['local.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['local.mcu.TimerMilli'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin0'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin1'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin2'], 'pollen$used', true);
        $$bind($units['local.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['local.parts.ColorLed'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led0'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led1'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led2'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
        $$bind($units['localhost.Lifecycle'], 'pollen$used', true);
        $$bind($units['pollen.time.Timer'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_03.$$privateInit = function() {
        Test_03.count = 0;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test90.Test_03'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_03;
}
var $$u = $$c();
$units['test90.Test_03'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test90.Test_03'].pollen$used = true;

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
