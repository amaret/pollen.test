
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
                $$printf("EventQueue created with initial capacity = ", this.capacity, "\n");
        }
        this.$$hostInitLastPass();
        return this;
    }
    EventQueue.EventQueue.prototype.setCapacityOnHost = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        $$printf("EventQueue setting new capacity =", this.capacity, "\n");
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
        $$printf("Newsroom event registered. Event capacity = ", Newsroom.events.getCapacityOnHost(), "\n");
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
 * ======== COMPOSITION virtual.LocalHost ========
 */

var $$c = function() {
    const LocalHost = {};
    LocalHost.LocalHost = LocalHost
    LocalHost.$name = 'virtual.LocalHost';
    LocalHost.pollen$used = 0;
    LocalHost.GlobalInterrupts = $units['virtual.mcu.GlobalInterrupts'];
    LocalHost.Print = $units['virtual.mcu.ConsolePrint'];
    LocalHost.Newsroom = $units['pollen.event.Newsroom'];
    LocalHost.$$hostInit = function() {
        var $$text = '';
        var $$v = 'virtual_mcu_GlobalInterrupts';
        var $$s = $$bind($units['virtual.LocalHost'], 'Newsroom.GI', $$v);{ $$v.pollen$used = true;
        $units['virtual.mcu.GlobalInterrupts'].pollen$used = true;}


        return $$text;
    }
    return LocalHost;
}
var $$u = $$c();
$units['virtual.LocalHost'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test73.Test_16 ========
 */

var $$c = function() {
    const Test_16 = {};
    Test_16.Test_16 = Test_16
    Test_16.$name = 'test73.Test_16';
    Test_16.pollen$used = 0;
    Test_16.Event = $units['pollen.event.Event'];
    Test_16.pollen__run = new $$Ref('test73_Test_16_pollen__run__E');
    Test_16.tick1 = new $$Ref('test73_Test_16_tick1__I');
    Test_16.tick2 = new $$Ref('test73_Test_16_tick2__I');
    Test_16.pollen__shutdown = new $$Ref('test73_Test_16_pollen__shutdown__E');
    Test_16.targetInit = new $$Ref('test73_Test_16_targetInit__I');
    Test_16.$$hostInit = function() {
        var $$text = '';
        Test_16.e1 = new $units['pollen.event.Event'].Event('test73_Test_16_e1__V');
        Test_16.e2 = new $units['pollen.event.Event'].Event('test73_Test_16_e2__V');
        (Test_16.e1) = new $units['pollen.event.Event'].Event().new_host((Test_16.tick1));
        (Test_16.e2) = new $units['pollen.event.Event'].Event().new_host((Test_16.tick2));
        return $$text;
    }
    Test_16.pollen__uses__ = function() {
        $$bind($units['virtual.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
    }
    Test_16.$$privateInit = function() {
    }
    return Test_16;
}
var $$u = $$c();
$units['test73.Test_16'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test73.Test_16'].pollen$used = true;

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
