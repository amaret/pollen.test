
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
 * ======== pollen.hardware.HandlerProtocol ========
 */

var $$c = function() {
    const HandlerProtocol = {};
    HandlerProtocol.HandlerProtocol = HandlerProtocol
    HandlerProtocol.$name = 'pollen.hardware.HandlerProtocol';
    HandlerProtocol.pollen$used = 0;
    HandlerProtocol.pollen__uses__ = function() {
    }
    HandlerProtocol.$$privateInit = function() {
    }
    return HandlerProtocol;
}
var $$u = $$c();
$units['pollen.hardware.HandlerProtocol'] = $$u;
$units.push($$u);


/*
 * ======== CLASS pollen.data.HandlerQueue ========
 */

var $$c = function() {
    const HandlerQueue = {};
    HandlerQueue.HandlerQueue = HandlerQueue
    HandlerQueue.$name = 'pollen.data.HandlerQueue';
    HandlerQueue.pollen$used = 0;
    HandlerQueue.HandlerQueue$$id = 1;
    HandlerQueue.HandlerQueue = function(cn) {
        this.$$id = HandlerQueue.HandlerQueue$$id++;
        this.$$cname = cn ? cn : 'pollen_data_HandlerQueue_HandlerQueue__'+this.$$id+'__S';
        this.$$tname = 'pollen_data_HandlerQueue_HandlerQueue';
        this.$$uname = 'pollen.data.HandlerQueue';
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    HandlerQueue.HandlerQueue.prototype = new $$Struct('pollen.data.HandlerQueue.HandlerQueue');
    HandlerQueue.HandlerQueue.prototype.$$isAggFld = {};
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.capacity = false;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.elements = true;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.length = false;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.head = false;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.tail = false;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.maxLength = false;
    HandlerQueue.HandlerQueue.prototype.new_host = function( max ) {
        var $$text = '';
        this.$$privateInit();
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_data_HandlerQueue_elements__A', false);
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
    HandlerQueue.HandlerQueue.prototype.setCapacity = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        this.$$hostInitLastPass();
        return $$text;
    }
    HandlerQueue.pollen__uses__ = function() {
    }
    HandlerQueue.HandlerQueue.prototype.$$privateInit = function() {
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    HandlerQueue.HandlerQueue.prototype.$$hostInitLastPass = function() {
    }
    return HandlerQueue;
}
var $$u = $$c();
$units['pollen.data.HandlerQueue'] = $$u;
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
 * ======== MODULE test70.QueueBug_01 ========
 */

var $$c = function() {
    const QueueBug_01 = {};
    QueueBug_01.QueueBug_01 = QueueBug_01
    QueueBug_01.$name = 'test70.QueueBug_01';
    QueueBug_01.pollen$used = 0;
    QueueBug_01.HandlerQueue = $units['pollen.data.HandlerQueue'];
    QueueBug_01.Console = $units['virtual.mcu.ConsolePrint'];
    QueueBug_01.PrintImpl = $units['test54.PrintImpl'];
    QueueBug_01.pollen__run = new $$Ref('test70_QueueBug_01_pollen__run__E');
    QueueBug_01.tick1 = new $$Ref('test70_QueueBug_01_tick1__I');
    QueueBug_01.tick2 = new $$Ref('test70_QueueBug_01_tick2__I');
    QueueBug_01.tick3 = new $$Ref('test70_QueueBug_01_tick3__I');
    QueueBug_01.tick4 = new $$Ref('test70_QueueBug_01_tick4__I');
    QueueBug_01.tick5 = new $$Ref('test70_QueueBug_01_tick5__I');
    QueueBug_01.pollen__shutdown = new $$Ref('test70_QueueBug_01_pollen__shutdown__E');
    QueueBug_01.targetInit = new $$Ref('test70_QueueBug_01_targetInit__I');
    QueueBug_01.$$hostInit = function() {
        var $$text = '';
        QueueBug_01.eventHandlers = new $units['pollen.data.HandlerQueue'].HandlerQueue('test70_QueueBug_01_eventHandlers__V'); QueueBug_01.eventHandlers.new_host(5);
        return $$text;
    }
    QueueBug_01.pollen__uses__ = function() {
        $$bind($units['pollen.data.HandlerQueue'], 'pollen$used', true);
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    QueueBug_01.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test70.QueueBug_01'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return QueueBug_01;
}
var $$u = $$c();
$units['test70.QueueBug_01'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test70.QueueBug_01'].pollen$used = true;

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
