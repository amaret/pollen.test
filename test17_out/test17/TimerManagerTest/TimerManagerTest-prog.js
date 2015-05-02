
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
 * ======== MODULE mcu.atmel.atmega328p.Atmega328p ========
 */

var $$c = function() {
    const Atmega328p = {};
    Atmega328p.Atmega328p = Atmega328p
    Atmega328p.$name = 'mcu.atmel.atmega328p.Atmega328p';
    Atmega328p.pollen$used = 0;
    Atmega328p.reset = new $$Ref('mcu_atmel_atmega328p_Atmega328p_reset__E');
    Atmega328p.shutdown = new $$Ref('mcu_atmel_atmega328p_Atmega328p_shutdown__E');
    Atmega328p.wait = new $$Ref('mcu_atmel_atmega328p_Atmega328p_wait__E');
    Atmega328p.nop = new $$Ref('mcu_atmel_atmega328p_Atmega328p_nop__E');
    Atmega328p.getSystemFrequency = new $$Ref('mcu_atmel_atmega328p_Atmega328p_getSystemFrequency__E');
    Atmega328p.setSystemFrequency = new $$Ref('mcu_atmel_atmega328p_Atmega328p_setSystemFrequency__E');
    Atmega328p.targetInit = new $$Ref('mcu_atmel_atmega328p_Atmega328p_targetInit__I');
    Atmega328p.getSystemFrequency = function() {
        var $$text = '';
        return(  Atmega328p.sysFreq  );
        return $$text;
    }
    Atmega328p.setSystemFrequency = function( hz ) {
        var $$text = '';
        Atmega328p.sysFreq = (hz);
        return $$text;
    }
    Atmega328p.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Atmega328p.pollen__uses__ = function() {
    }
    Atmega328p.$$privateInit = function() {
        Atmega328p.sysFreq = 0;
    }
    return Atmega328p;
}
var $$u = $$c();
$units['mcu.atmel.atmega328p.Atmega328p'] = $$u;
$units.push($$u);


/*
 * ======== MODULE mcu.atmel.atmega.Timer0MatchA ========
 */

var $$c = function() {
    const Timer0MatchA = {};
    Timer0MatchA.Timer0MatchA = Timer0MatchA
    Timer0MatchA.$name = 'mcu.atmel.atmega.Timer0MatchA';
    Timer0MatchA.pollen$used = 0;
    Timer0MatchA.setHandler = new $$Ref('mcu_atmel_atmega_Timer0MatchA_setHandler__E');
    Timer0MatchA.enable = new $$Ref('mcu_atmel_atmega_Timer0MatchA_enable__E');
    Timer0MatchA.enabled = new $$Ref('mcu_atmel_atmega_Timer0MatchA_enabled__E');
    Timer0MatchA.disable = new $$Ref('mcu_atmel_atmega_Timer0MatchA_disable__E');
    Timer0MatchA.clear = new $$Ref('mcu_atmel_atmega_Timer0MatchA_clear__E');
    Timer0MatchA.isr = new $$Ref('mcu_atmel_atmega_Timer0MatchA_isr__I');
    Timer0MatchA.targetInit = new $$Ref('mcu_atmel_atmega_Timer0MatchA_targetInit__I');
    Timer0MatchA.name = "TIMER0_COMPA_vect";
    Timer0MatchA.enableRegister = "TIMSK0";
    Timer0MatchA.enableBit = "OCIE0A";
    Timer0MatchA.clearRegister = "TIFR0";
    Timer0MatchA.clearBit = "OCF0A";
    Timer0MatchA.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Timer0MatchA.pollen__uses__ = function() {
    }
    Timer0MatchA.$$privateInit = function() {
        Timer0MatchA.h = 0;
    }
    return Timer0MatchA;
}
var $$u = $$c();
$units['mcu.atmel.atmega.Timer0MatchA'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION mcu.atmel.atmega328p.Interrupts ========
 */

var $$c = function() {
    const Interrupts = {};
    Interrupts.Interrupts = Interrupts
    Interrupts.$name = 'mcu.atmel.atmega328p.Interrupts';
    Interrupts.pollen$used = 0;
    Interrupts.Timer0MatchA = $units['mcu.atmel.atmega.Timer0MatchA'];
    return Interrupts;
}
var $$u = $$c();
$units['mcu.atmel.atmega328p.Interrupts'] = $$u;
$units.push($$u);


/*
 * ======== pollen.interfaces.TimerDriver ========
 */

var $$c = function() {
    const TimerDriver = {};
    TimerDriver.TimerDriver = TimerDriver
    TimerDriver.$name = 'pollen.interfaces.TimerDriver';
    TimerDriver.pollen$used = 0;
    TimerDriver.pollen__uses__ = function() {
    }
    TimerDriver.$$privateInit = function() {
    }
    return TimerDriver;
}
var $$u = $$c();
$units['pollen.interfaces.TimerDriver'] = $$u;
$units.push($$u);


/*
 * ======== MODULE mcu.atmel.atmega328p.Uart ========
 */

var $$c = function() {
    const Uart = {};
    Uart.Uart = Uart
    Uart.$name = 'mcu.atmel.atmega328p.Uart';
    Uart.pollen$used = 0;
    Uart.Mcu = $units['mcu.atmel.atmega328p.Atmega328p'];
    Uart.targetInit = new $$Ref('mcu_atmel_atmega328p_Uart_targetInit__I');
    Uart.put = new $$Ref('mcu_atmel_atmega328p_Uart_put__E');
    Uart.get = new $$Ref('mcu_atmel_atmega328p_Uart_get__E');
    Uart.flush = new $$Ref('mcu_atmel_atmega328p_Uart_flush__E');
    Uart.xsetBaud = new $$Ref('mcu_atmel_atmega328p_Uart_xsetBaud__E');
    Uart.$$hostInit = function() {
        var $$text = '';
        (Uart.baudh) = ((($units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency() / ((Uart.baudRate) * 16)) - 1) >> 8);
        (Uart.baudl) = ((($units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency() / ((Uart.baudRate) * 16)) - 1));
        return $$text;
    }
    Uart.setBaud = function( baud ) {
        var $$text = '';
        (Uart.baudRate) = (baud);
        (Uart.baudh) = ((($units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency() / ((Uart.baudRate) * 16)) - 1) >> 8);
        (Uart.baudl) = ((($units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency() / ((Uart.baudRate) * 16)) - 1));
        return $$text;
    }
    Uart.pollen__uses__ = function() {
        $$bind($units['mcu.atmel.atmega328p.Atmega328p'], 'pollen$used', true);
    }
    Uart.$$privateInit = function() {
        Uart.baudRate = 9600;
        Uart.dataBits = 8;
        Uart.stopBits = 1;
        Uart.parity = 0;
        Uart.baudh = 0;
        Uart.baudl = 0;
    }
    return Uart;
}
var $$u = $$c();
$units['mcu.atmel.atmega328p.Uart'] = $$u;
$units.push($$u);


/*
 * ======== pollen.interfaces.Gpio ========
 */

var $$c = function() {
    const Gpio = {};
    Gpio.Gpio = Gpio
    Gpio.$name = 'pollen.interfaces.Gpio';
    Gpio.pollen$used = 0;
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
 * ======== COMPOSITION mcu.atmel.atmega328p.Mcu ========
 */

var $$c = function() {
    const Mcu = {};
    Mcu.Mcu = Mcu
    Mcu.$name = 'mcu.atmel.atmega328p.Mcu';
    Mcu.pollen$used = 0;
    Mcu.Atmega328p = $units['mcu.atmel.atmega328p.Atmega328p'];
    Mcu.GlobalInterrupts = $units['mcu.atmel.atmega328p.GlobalInterrupts'];
    Mcu.TimerMilli8BitTimer0 = $units['mcu.atmel.atmega328p.TimerMilli8BitTimer0'];
    Mcu.Uart = $units['mcu.atmel.atmega328p.Uart'];
    Mcu.PB3 = $units['mcu.atmel.atmega328p.PB3'];
    Mcu.PB4 = $units['mcu.atmel.atmega328p.PB4'];
    Mcu.PB5 = $units['mcu.atmel.atmega328p.PB5'];
    Mcu.getSystemFrequency = function() {
        var $$text = '';
        return(  $units['mcu.atmel.atmega328p.Atmega328p'].getSystemFrequency()  );
        return $$text;
    }
    Mcu.setSystemFrequency = function( hz ) {
        var $$text = '';
        $units['mcu.atmel.atmega328p.Atmega328p'].setSystemFrequency((hz));
        return $$text;
    }
    return Mcu;
}
var $$u = $$c();
$units['mcu.atmel.atmega328p.Mcu'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.parts.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'pollen.parts.Led';
    Led.pollen$used = 0;
    Led.targetInit = new $$Ref('pollen_parts_Led_targetInit__I');
    Led.toggle = new $$Ref('pollen_parts_Led_toggle__E');
    Led.on = new $$Ref('pollen_parts_Led_on__E');
    Led.off = new $$Ref('pollen_parts_Led_off__E');
    Led.isOn = new $$Ref('pollen_parts_Led_isOn__E');
    Led.isActiveLow = false;
    Led.bindPin = function( p ) {
        var $$text = '';
        var $$v = 'pollen_parts_Led_';
        var $$s = $$bind($units['pollen.parts.Led'], 'Gpio', $$v);if ($$v && $$v == $$s) $$v.pollen$used = true;

        return $$text;
    }
    Led.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led.pollen__uses__ = function() {
    }
    Led.$$privateInit = function() {
        Led.Gpio = 0;
    }
    return Led;
}
var $$u = $$c();
$units['pollen.parts.Led'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION distro.arduino.Board ========
 */

var $$c = function() {
    const Board = {};
    Board.Board = Board
    Board.$name = 'distro.arduino.Board';
    Board.pollen$used = 0;
    Board.Led = $units['pollen.parts.Led'];
    Board.$$hostInit = function() {
        var $$text = '';
        $units['mcu.atmel.atmega328p.Mcu'].setSystemFrequency(16000000);
        $units['pollen.parts.Led'].bindPin(($units['mcu.atmel.atmega328p.Mcu']));
        return $$text;
    }
    return Board;
}
var $$u = $$c();
$units['distro.arduino.Board'] = $$u;
$units.push($$u);


/*
 * ======== pollen.interfaces.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'pollen.interfaces.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.pollen__uses__ = function() {
    }
    GlobalInterrupts.$$privateInit = function() {
    }
    return GlobalInterrupts;
}
var $$u = $$c();
$units['pollen.interfaces.GlobalInterrupts'] = $$u;
$units.push($$u);


/*
 * ======== CLASS pollen.events.AE ========
 */

var $$c = function() {
    const AE = {};
    AE.AE = AE
    AE.$name = 'pollen.events.AE';
    AE.pollen$used = 0;
    AE.AE$$id = 1;
    AE.AE = function(cn) {
        this.$$id = AE.AE$$id++;
        this.$$cname = cn ? cn : 'pollen_events_AE_AE__'+this.$$id+'__S';
        this.$$tname = 'pollen_events_AE_AE';
        this.$$uname = 'pollen.events.AE';
        this.priority = 0;
        this.handler = null;
        this.data = 0;
    }
    AE.AE.prototype = new $$Struct('pollen.events.AE.AE');
    AE.AE.prototype.$$isAggFld = {};
    AE.AE.prototype.$$isAggFld.priority = false;
    AE.AE.prototype.$$isAggFld.handler = false;
    AE.AE.prototype.$$isAggFld.data = false;
    AE.AE.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    AE.pollen__uses__ = function() {
    }
    AE.AE.prototype.$$privateInit = function() {
        this.priority = 0;
        this.handler = null;
        this.data = 0;
    }
    AE.AE.prototype.$$hostInitLastPass = function() {
    }
    return AE;
}
var $$u = $$c();
$units['pollen.events.AE'] = $$u;
$units.push($$u);


/*
 * ======== CLASS pollen.data.AEQueue ========
 */

var $$c = function() {
    const AEQueue = {};
    AEQueue.AEQueue = AEQueue
    AEQueue.$name = 'pollen.data.AEQueue';
    AEQueue.pollen$used = 0;
    AEQueue.AEQueue$$id = 1;
    AEQueue.AEQueue = function(cn) {
        this.$$id = AEQueue.AEQueue$$id++;
        this.$$cname = cn ? cn : 'pollen_data_AEQueue_AEQueue__'+this.$$id+'__S';
        this.$$tname = 'pollen_data_AEQueue_AEQueue';
        this.$$uname = 'pollen.data.AEQueue';
        this.capacity = (AEQueue.cap);
        this.head = 0;
        this.tail = 0;
        this.num = 0;
    }
    AEQueue.AEQueue.prototype = new $$Struct('pollen.data.AEQueue.AEQueue');
    AEQueue.AEQueue.prototype.$$isAggFld = {};
    AEQueue.AEQueue.prototype.$$isAggFld.capacity = false;
    AEQueue.AEQueue.prototype.$$isAggFld.elements = true;
    AEQueue.AEQueue.prototype.$$isAggFld.head = false;
    AEQueue.AEQueue.prototype.$$isAggFld.tail = false;
    AEQueue.AEQueue.prototype.$$isAggFld.num = false;
    AEQueue.AEQueue.prototype.setCapacity = function( cap ) {
        var $$text = '';
        this.capacity = (cap);
        this.$$hostInitLastPass();
        return $$text;
    }
    AEQueue.AEQueue.prototype.getCapacity = function() {
        var $$text = '';
        return(  (this.capacity)  );
        this.$$hostInitLastPass();
        return $$text;
    }
    AEQueue.AEQueue.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    AEQueue.cap = 10;
    AEQueue.pollen__uses__ = function() {
    }
    AEQueue.AEQueue.prototype.$$privateInit = function() {
        this.capacity = (AEQueue.cap);
        this.head = 0;
        this.tail = 0;
        this.num = 0;
    }
    AEQueue.AEQueue.prototype.$$hostInitLastPass = function() {
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_data_AEQueue_elements__A', false);
    }
    return AEQueue;
}
var $$u = $$c();
$units['pollen.data.AEQueue'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.events.Dispatcher ========
 */

var $$c = function() {
    const Dispatcher = {};
    Dispatcher.Dispatcher = Dispatcher
    Dispatcher.$name = 'pollen.events.Dispatcher';
    Dispatcher.pollen$used = 0;
    Dispatcher.AE = $units['pollen.events.AE'];
    Dispatcher.AEQueue = $units['pollen.data.AEQueue'];
    Dispatcher.post = new $$Ref('pollen_events_Dispatcher_post__E');
    Dispatcher.postFromInterrupt = new $$Ref('pollen_events_Dispatcher_postFromInterrupt__E');
    Dispatcher.run = new $$Ref('pollen_events_Dispatcher_run__E');
    Dispatcher.targetInit = new $$Ref('pollen_events_Dispatcher_targetInit__I');
    Dispatcher.bindGlobalInterrupts = function( g ) {
        var $$text = '';
        
        return $$text;
    }
    Dispatcher.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Dispatcher.pollen__uses__ = function() {
        $$bind($units['pollen.events.AE'], 'pollen$used', true);
        $$bind($units['pollen.data.AEQueue'], 'pollen$used', true);
    }
    Dispatcher.$$privateInit = function() {
    }
    return Dispatcher;
}
var $$u = $$c();
$units['pollen.events.Dispatcher'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION pollen.events.Events ========
 */

var $$c = function() {
    const Events = {};
    Events.Events = Events
    Events.$name = 'pollen.events.Events';
    Events.pollen$used = 0;
    Events.Dispatcher = $units['pollen.events.Dispatcher'];
    Events.bindGlobalInterrupts = function( gi ) {
        var $$text = '';
        $units['pollen.events.Dispatcher'].bindGlobalInterrupts((gi));
        return $$text;
    }
    return Events;
}
var $$u = $$c();
$units['pollen.events.Events'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.time.TimerMilli ========
 */

var $$c = function() {
    const TimerMilli = {};
    TimerMilli.TimerMilli = TimerMilli
    TimerMilli.$name = 'pollen.time.TimerMilli';
    TimerMilli.pollen$used = 0;
    TimerMilli.targetInit = new $$Ref('pollen_time_TimerMilli_targetInit__I');
    TimerMilli.start = new $$Ref('pollen_time_TimerMilli_start__E');
    TimerMilli.stop = new $$Ref('pollen_time_TimerMilli_stop__E');
    TimerMilli.running = new $$Ref('pollen_time_TimerMilli_running__E');
    TimerMilli.timerTick = new $$Ref('pollen_time_TimerMilli_timerTick__E');
    TimerMilli.bindTimerDriver = function( td ) {
        var $$text = '';
        TimerMilli.timer = (td);
        return $$text;
    }
    TimerMilli.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TimerMilli.pollen__uses__ = function() {
    }
    TimerMilli.$$privateInit = function() {
        TimerMilli.timer = 0;
        TimerMilli.count = 0;
        TimerMilli.duration = 0;
        TimerMilli.repeat = true;
        TimerMilli.clientTick = 0;
    }
    return TimerMilli;
}
var $$u = $$c();
$units['pollen.time.TimerMilli'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION pollen.time.Time ========
 */

var $$c = function() {
    const Time = {};
    Time.Time = Time
    Time.$name = 'pollen.time.Time';
    Time.pollen$used = 0;
    Time.TimerMilli = $units['pollen.time.TimerMilli'];
    Time.bindGlobalInterrupts = function( gi ) {
        var $$text = '';
        return $$text;
    }
    Time.bindTimerDriver = function( t ) {
        var $$text = '';
        $units['pollen.time.TimerMilli'].bindTimerDriver((t));
        return $$text;
    }
    return Time;
}
var $$u = $$c();
$units['pollen.time.Time'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION distro.arduino.Distro ========
 */

var $$c = function() {
    const Distro = {};
    Distro.Distro = Distro
    Distro.$name = 'distro.arduino.Distro';
    Distro.pollen$used = 0;
    Distro.$$hostInit = function() {
        var $$text = '';
        $units['pollen.events.Events'].bindGlobalInterrupts(($units['distro.arduino.Board']));
        $units['pollen.time.Time'].bindGlobalInterrupts(($units['distro.arduino.Board']));
        $units['pollen.time.Time'].bindTimerDriver(($units['distro.arduino.Board']));
        $units['mcu.atmel.atmega328p.Uart'].setBaud(57600);
        return $$text;
    }
    return Distro;
}
var $$u = $$c();
$units['distro.arduino.Distro'] = $$u;
$units.push($$u);


/*
 * ======== CLASS pollen.events.Event ========
 */

var $$c = function() {
    const Event = {};
    Event.Event = Event
    Event.$name = 'pollen.events.Event';
    Event.pollen$used = 0;
    Event.Event$$id = 1;
    Event.Event = function(cn) {
        this.$$id = Event.Event$$id++;
        this.$$cname = cn ? cn : 'pollen_events_Event_Event__'+this.$$id+'__S';
        this.$$tname = 'pollen_events_Event_Event';
        this.$$uname = 'pollen.events.Event';
        this.priority = 0;
        this.handler = null;
        this.data = 0;
    }
    Event.Event.prototype = new $$Struct('pollen.events.Event.Event');
    Event.Event.prototype.$$isAggFld = {};
    Event.Event.prototype.$$isAggFld.priority = false;
    Event.Event.prototype.$$isAggFld.handler = false;
    Event.Event.prototype.$$isAggFld.data = false;
    Event.Event.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Event.pollen__uses__ = function() {
    }
    Event.Event.prototype.$$privateInit = function() {
        this.priority = 0;
        this.handler = null;
        this.data = 0;
    }
    Event.Event.prototype.$$hostInitLastPass = function() {
    }
    return Event;
}
var $$u = $$c();
$units['pollen.events.Event'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.time.TimerManager ========
 */

var $$c = function() {
    const TimerManager = {};
    TimerManager.TimerManager = TimerManager
    TimerManager.$name = 'pollen.time.TimerManager';
    TimerManager.pollen$used = 0;
    TimerManager.Event = $units['pollen.events.Event'];
    TimerManager.Timer$$id = 1;
    TimerManager.Timer = function(cn) {
        this.$$id = TimerManager.Timer$$id++;
        this.$$cname = cn ? cn : 'pollen_time_TimerManager_Timer__'+this.$$id+'__S';
        this.$$tname = 'pollen_time_TimerManager_Timer';
        this.$$uname = 'pollen.time.TimerManager';
        this.id = 0;
        this.duration = 0;
        this.elapsed = 0;
        this.repeat = 0;
    }
    TimerManager.Timer.prototype = new $$Struct('pollen.time.TimerManager.Timer');
    TimerManager.Timer.prototype.$$isAggFld = {};
    TimerManager.Timer.prototype.$$isAggFld.id = false;
    TimerManager.Timer.prototype.$$isAggFld.expired = false;
    TimerManager.Timer.prototype.$$isAggFld.duration = false;
    TimerManager.Timer.prototype.$$isAggFld.elapsed = false;
    TimerManager.Timer.prototype.$$isAggFld.repeat = false;
    TimerManager.Timer.prototype.init = function() {
        var $$text = '';
        (this.id) = (TimerManager.numTimers);
        (TimerManager.numTimers)++;
        (this.repeat) = false;
        $$printf("\nTIMER INIT");
        this.$$hostInitLastPass();
        return $$text;
    }
    TimerManager.Timer.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.expired = 0;
        this.$$hostInitLastPass();
        return this;
    }
    TimerManager.Timer.prototype.$$privateInit = function() {
        this.id = 0;
        this.duration = 0;
        this.elapsed = 0;
        this.repeat = 0;
    }
    TimerManager.Timer.prototype.$$hostInitLastPass = function() {
    }
    TimerManager.timerISR = new $$Ref('pollen_time_TimerManager_timerISR__I');
    TimerManager.targetInit = new $$Ref('pollen_time_TimerManager_targetInit__I');
    TimerManager.bindGlobalInterrupts = function( gi ) {
        var $$text = '';
        var $$v = 'pollen_interfaces_GlobalInterrupts';
        var $$s = $$bind($units['pollen.time.TimerManager'], 'gint', $$v);if ($$v && $$v == $$s) $$v.pollen$used = true;

        return $$text;
    }
    TimerManager.bindTimerDriver = function( t ) {
        var $$text = '';
        var $$v = 'pollen_interfaces_TimerDriver';
        var $$s = $$bind($units['pollen.time.TimerManager'], 'hw_timer', $$v);if ($$v && $$v == $$s) $$v.pollen$used = true;

        return $$text;
    }
    TimerManager.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TimerManager.pollen__uses__ = function() {
        $$bind($units['pollen.events.Dispatcher'], 'pollen$used', true);
        $$bind($units['pollen.events.Event'], 'pollen$used', true);
    }
    TimerManager.$$privateInit = function() {
        TimerManager.gint = 0;
        TimerManager.hw_timer = 0;
        TimerManager.numTimers = 0;
    }
    TimerManager.$$hostInitLastPass = function() {
        TimerManager.timers = new $$Array((TimerManager.numTimers), function($$cn,$$idx){obj = new TimerManager.Timer(); obj.new_host(); return obj;}, 'pollen_time_TimerManager_timers__A', false);
    }
    return TimerManager;
}
var $$u = $$c();
$units['pollen.time.TimerManager'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test17.TimerManagerTest ========
 */

var $$c = function() {
    const TimerManagerTest = {};
    TimerManagerTest.TimerManagerTest = TimerManagerTest
    TimerManagerTest.$name = 'test17.TimerManagerTest';
    TimerManagerTest.pollen$used = 0;
    TimerManagerTest.TimerManager = $units['pollen.time.TimerManager'];
    TimerManagerTest.pollen__run = new $$Ref('test17_TimerManagerTest_pollen__run__E');
    TimerManagerTest.targetInit = new $$Ref('test17_TimerManagerTest_targetInit__I');
    TimerManagerTest.$$hostInit = function() {
        var $$text = '';
        TimerManagerTest.t = new $units['pollen.time.TimerManager'].Timer('test17_TimerManagerTest_t__V'); TimerManagerTest.t.new_host();
        TimerManagerTest.t.init();
        return $$text;
    }
    TimerManagerTest.pollen__uses__ = function() {
        $$bind($units['mcu.atmel.atmega328p.Atmega328p'], 'pollen$used', true);
        $$bind($units['mcu.atmel.atmega.Timer0MatchA'], 'pollen$used', true);
        $$bind($units['mcu.atmel.atmega328p.Uart'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led'], 'pollen$used', true);
        $$bind($units['pollen.events.Dispatcher'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerMilli'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
    }
    TimerManagerTest.$$privateInit = function() {
    }
    return TimerManagerTest;
}
var $$u = $$c();
$units['test17.TimerManagerTest'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test17.TimerManagerTest'].pollen$used = true;

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
