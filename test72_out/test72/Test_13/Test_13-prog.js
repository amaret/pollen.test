
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
 * ======== MODULE virtual.mcu.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'virtual.mcu.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.enable = new $$Ref('virtual_mcu_GlobalInterrupts_enable__E');
    GlobalInterrupts.disable = new $$Ref('virtual_mcu_GlobalInterrupts_disable__E');
    GlobalInterrupts.targetInit = new $$Ref('virtual_mcu_GlobalInterrupts_targetInit__I');
    GlobalInterrupts.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    GlobalInterrupts.pollen__uses__ = function() {
    }
    GlobalInterrupts.$$privateInit = function() {
    }
    return GlobalInterrupts;
}
var $$u = $$c();
$units['virtual.mcu.GlobalInterrupts'] = $$u;
$units.push($$u);


/*
 * ======== MODULE virtual.mcu.ConsolePrint ========
 */

var $$c = function() {
    const ConsolePrint = {};
    ConsolePrint.ConsolePrint = ConsolePrint
    ConsolePrint.$name = 'virtual.mcu.ConsolePrint';
    ConsolePrint.pollen$used = 0;
    ConsolePrint.printBool = new $$Ref('virtual_mcu_ConsolePrint_printBool__E');
    ConsolePrint.printReal = new $$Ref('virtual_mcu_ConsolePrint_printReal__E');
    ConsolePrint.printInt = new $$Ref('virtual_mcu_ConsolePrint_printInt__E');
    ConsolePrint.printUint = new $$Ref('virtual_mcu_ConsolePrint_printUint__E');
    ConsolePrint.printStr = new $$Ref('virtual_mcu_ConsolePrint_printStr__E');
    ConsolePrint.targetInit = new $$Ref('virtual_mcu_ConsolePrint_targetInit__I');
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
$units['virtual.mcu.ConsolePrint'] = $$u;
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
 * ======== CLASS pollen.event.Event ========
 */

var $$c = function() {
    const Event = {};
    Event.Event = Event
    Event.$name = 'pollen.event.Event';
    Event.pollen$used = 0;
    Event.Dispatcher = $units['pollen.event.Dispatcher'];
    Event.Event$$id = 1;
    Event.Event = function(cn) {
        this.$$id = Event.Event$$id++;
        this.$$cname = cn ? cn : 'pollen_event_Event_Event__'+this.$$id+'__S';
        this.$$tname = 'pollen_event_Event_Event';
        this.$$uname = 'pollen.event.Event';
        this.eventHandler = 0;
    }
    Event.Event.prototype = new $$Struct('pollen.event.Event.Event');
    Event.Event.prototype.$$isAggFld = {};
    Event.Event.prototype.$$isAggFld.eventHandler = false;
    Event.Event.prototype.new_host = function( h ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                this.eventHandler = (h);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Event.Event.prototype.setHandlerOnHost = function( h ) {
        var $$text = '';
        (this.eventHandler) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    Event.pollen__uses__ = function() {
        $$bind($units['pollen.event.Dispatcher'], 'pollen$used', true);
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
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    EventQueue.EventQueue.prototype = new $$Struct('pollen.event.EventQueue.EventQueue');
    EventQueue.EventQueue.prototype.$$isAggFld = {};
    EventQueue.EventQueue.prototype.$$isAggFld.capacity = false;
    EventQueue.EventQueue.prototype.$$isAggFld.elements = true;
    EventQueue.EventQueue.prototype.$$isAggFld.length = false;
    EventQueue.EventQueue.prototype.$$isAggFld.head = false;
    EventQueue.EventQueue.prototype.$$isAggFld.tail = false;
    EventQueue.EventQueue.prototype.$$isAggFld.maxLength = false;
    EventQueue.EventQueue.prototype.new_host = function( max ) {
        var $$text = '';
        this.$$privateInit();
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_event_EventQueue_elements__A', false); this.elements.$$assign((new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null, null, null, null, null, null, null, null ]));
        if (arguments.length == 1) {
                this.length = 0;
                this.head = 0;
                this.tail = 0;
                this.maxLength = (max);
                if ((max) > this.capacity) {
            this.capacity = (max);
        }
        }
        this.$$hostInitLastPass();
        return this;
    }
    EventQueue.EventQueue.prototype.setCapacityOnHost = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        this.$$hostInitLastPass();
        return $$text;
    }
    EventQueue.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
    }
    EventQueue.EventQueue.prototype.$$privateInit = function() {
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_event_EventQueue_elements__A', false); this.elements.$$assign((new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null, null, null, null, null, null, null, null ]));
    }
    EventQueue.EventQueue.prototype.$$hostInitLastPass = function() {
    }
    return EventQueue;
}
var $$u = $$c();
$units['pollen.event.EventQueue'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.event.Dispatcher ========
 */

var $$c = function() {
    const Dispatcher = {};
    Dispatcher.Dispatcher = Dispatcher
    Dispatcher.$name = 'pollen.event.Dispatcher';
    Dispatcher.pollen$used = 0;
    Dispatcher.Event = $units['pollen.event.Event'];
    Dispatcher.EventQueue = $units['pollen.event.EventQueue'];
    Dispatcher.targetInit = new $$Ref('pollen_event_Dispatcher_targetInit__I');
    Dispatcher.post = new $$Ref('pollen_event_Dispatcher_post__E');
    Dispatcher.postFromInterrupt = new $$Ref('pollen_event_Dispatcher_postFromInterrupt__E');
    Dispatcher.run = new $$Ref('pollen_event_Dispatcher_run__E');
    Dispatcher.dispatch = new $$Ref('pollen_event_Dispatcher_dispatch__I');
    Dispatcher.$$hostInit = function() {
        var $$text = '';
        Dispatcher.events = new $units['pollen.event.EventQueue'].EventQueue('pollen_event_Dispatcher_events__V'); Dispatcher.events.new_host((Dispatcher.capacity));
        return $$text;
    }
    Dispatcher.registerEvent = function() {
        var $$text = '';
        Dispatcher.events.setCapacityOnHost(++(Dispatcher.capacity));
        $$printf("Event registered. Capacity=", (Dispatcher.capacity));
        return $$text;
    }
    Dispatcher.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['pollen.event.EventQueue'], 'pollen$used', true);
    }
    Dispatcher.$$privateInit = function() {
        Dispatcher.capacity = 5;
        Dispatcher.GI = 0;
    }
    return Dispatcher;
}
var $$u = $$c();
$units['pollen.event.Dispatcher'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION virtual.LocalHost ========
 */

var $$c = function() {
    const LocalHost = {};
    LocalHost.LocalHost = LocalHost
    LocalHost.$name = 'virtual.LocalHost';
    LocalHost.pollen$used = 0;
    LocalHost.Print = $units['virtual.mcu.ConsolePrint'];
    LocalHost.Dispatcher = $units['pollen.event.Dispatcher'];
    LocalHost.$$hostInit = function() {
        var $$text = '';
        var $$v = 'virtual_mcu_GlobalInterrupts';
        var $$s = $$bind($units['virtual.LocalHost'], 'Dispatcher.GI', $$v);{ $$v.pollen$used = true;
        $units['virtual.mcu.GlobalInterrupts'].pollen$used = true;}


        return $$text;
    }
    return LocalHost;
}
var $$u = $$c();
$units['virtual.LocalHost'] = $$u;
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
 * ======== MODULE test72.Test_13 ========
 */

var $$c = function() {
    const Test_13 = {};
    Test_13.Test_13 = Test_13
    Test_13.$name = 'test72.Test_13';
    Test_13.pollen$used = 0;
    Test_13.Event = $units['pollen.event.Event'];
    Test_13.PrintImpl = $units['test54.PrintImpl'];
    Test_13.pollen__run = new $$Ref('test72_Test_13_pollen__run__E');
    Test_13.pollen__shutdown = new $$Ref('test72_Test_13_pollen__shutdown__E');
    Test_13.tick = new $$Ref('test72_Test_13_tick__I');
    Test_13.targetInit = new $$Ref('test72_Test_13_targetInit__I');
    Test_13.$$hostInit = function() {
        var $$text = '';
        Test_13.e = new $units['pollen.event.Event'].Event('test72_Test_13_e__V'); Test_13.e.new_host((Test_13.tick));
        return $$text;
    }
    Test_13.pollen__uses__ = function() {
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['pollen.event.Dispatcher'], 'pollen$used', true);
        $$bind($units['virtual.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_13.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test72.Test_13'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_13;
}
var $$u = $$c();
$units['test72.Test_13'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test72.Test_13'].pollen$used = true;

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
