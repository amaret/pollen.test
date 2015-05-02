
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
 * ======== test47.EH ========
 */

var $$c = function() {
    const EH = {};
    EH.EH = EH
    EH.$name = 'test47.EH';
    EH.pollen$used = 0;
    EH.pollen__uses__ = function() {
    }
    EH.$$privateInit = function() {
    }
    return EH;
}
var $$u = $$c();
$units['test47.EH'] = $$u;
$units.push($$u);


/*
 * ======== CLASS test47.Ev ========
 */

var $$c = function() {
    const Ev = {};
    Ev.Ev = Ev
    Ev.$name = 'test47.Ev';
    Ev.pollen$used = 0;
    Ev.Ev$$id = 1;
    Ev.Ev = function(cn) {
        this.$$id = Ev.Ev$$id++;
        this.$$cname = cn ? cn : 'test47_Ev_Ev__'+this.$$id+'__S';
        this.$$tname = 'test47_Ev_Ev';
        this.$$uname = 'test47.Ev';
        this.priority = 0;
        this.handler = 0;
        this.data = 0;
    }
    Ev.Ev.prototype = new $$Struct('test47.Ev.Ev');
    Ev.Ev.prototype.$$isAggFld = {};
    Ev.Ev.prototype.$$isAggFld.priority = false;
    Ev.Ev.prototype.$$isAggFld.handler = false;
    Ev.Ev.prototype.$$isAggFld.data = false;
    Ev.Ev.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Ev.pollen__uses__ = function() {
    }
    Ev.Ev.prototype.$$privateInit = function() {
        this.priority = 0;
        this.data = 0;
    }
    Ev.Ev.prototype.$$hostInitLastPass = function() {
    }
    return Ev;
}
var $$u = $$c();
$units['test47.Ev'] = $$u;
$units.push($$u);


/*
 * ======== CLASS test47.EvQueue ========
 */

var $$c = function() {
    const EvQueue = {};
    EvQueue.EvQueue = EvQueue
    EvQueue.$name = 'test47.EvQueue';
    EvQueue.pollen$used = 0;
    EvQueue.E = $units['test47.Ev'];
    EvQueue.EvQueue$$id = 1;
    EvQueue.EvQueue = function(cn) {
        this.$$id = EvQueue.EvQueue$$id++;
        this.$$cname = cn ? cn : 'test47_EvQueue_EvQueue__'+this.$$id+'__S';
        this.$$tname = 'test47_EvQueue_EvQueue';
        this.$$uname = 'test47.EvQueue';
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    EvQueue.EvQueue.prototype = new $$Struct('test47.EvQueue.EvQueue');
    EvQueue.EvQueue.prototype.$$isAggFld = {};
    EvQueue.EvQueue.prototype.$$isAggFld.capacity = false;
    EvQueue.EvQueue.prototype.$$isAggFld.elements = true;
    EvQueue.EvQueue.prototype.$$isAggFld.length = false;
    EvQueue.EvQueue.prototype.$$isAggFld.head = false;
    EvQueue.EvQueue.prototype.$$isAggFld.tail = false;
    EvQueue.EvQueue.prototype.$$isAggFld.maxLength = false;
    EvQueue.EvQueue.prototype.new_host = function( max ) {
        var $$text = '';
        this.$$privateInit();
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'test47_EvQueue_elements__A', false); this.elements.$$assign((new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host() ]));
        if (arguments.length == 1) {
                this.length = 0;
                this.head = 0;
                this.tail = 0;
                this.maxLength = (max);
        }
        this.$$hostInitLastPass();
        return this;
    }
    EvQueue.EvQueue.prototype.setCapacity = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        this.$$hostInitLastPass();
        return $$text;
    }
    EvQueue.pollen__uses__ = function() {
    }
    EvQueue.EvQueue.prototype.$$privateInit = function() {
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    EvQueue.EvQueue.prototype.$$hostInitLastPass = function() {
    }
    return EvQueue;
}
var $$u = $$c();
$units['test47.EvQueue'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test47.Dispatcher ========
 */

var $$c = function() {
    const Dispatcher = {};
    Dispatcher.Dispatcher = Dispatcher
    Dispatcher.$name = 'test47.Dispatcher';
    Dispatcher.pollen$used = 0;
    Dispatcher.Ev = $units['test47.Ev'];
    Dispatcher.EvQueue = $units['test47.EvQueue'];
    Dispatcher.post = new $$Ref('test47_Dispatcher_post__E');
    Dispatcher.run = new $$Ref('test47_Dispatcher_run__E');
    Dispatcher.targetInit = new $$Ref('test47_Dispatcher_targetInit__I');
    Dispatcher.$$hostInit = function() {
        var $$text = '';
        Dispatcher.myEventQueue = new $units['test47.EvQueue'].EvQueue('test47_Dispatcher_myEventQueue__V'); Dispatcher.myEventQueue.new_host(10);
        return $$text;
    }
    Dispatcher.pollen__uses__ = function() {
        $$bind($units['test47.Ev'], 'pollen$used', true);
        $$bind($units['test47.EvQueue'], 'pollen$used', true);
    }
    Dispatcher.$$privateInit = function() {
    }
    return Dispatcher;
}
var $$u = $$c();
$units['test47.Dispatcher'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test47.DispatcherTest ========
 */

var $$c = function() {
    const DispatcherTest = {};
    DispatcherTest.DispatcherTest = DispatcherTest
    DispatcherTest.$name = 'test47.DispatcherTest';
    DispatcherTest.pollen$used = 0;
    DispatcherTest.Dispatcher = $units['test47.Dispatcher'];
    DispatcherTest.Ev = $units['test47.Ev'];
    DispatcherTest.targetInit = new $$Ref('test47_DispatcherTest_targetInit__I');
    DispatcherTest.handle = new $$Ref('test47_DispatcherTest_handle__E');
    DispatcherTest.pollen__run = new $$Ref('test47_DispatcherTest_pollen__run__E');
    DispatcherTest.$$hostInit = function() {
        var $$text = '';
        DispatcherTest.e1 = new $units['test47.Ev'].Ev('test47_DispatcherTest_e1__V'); DispatcherTest.e1.new_host();
        DispatcherTest.e2 = new $units['test47.Ev'].Ev('test47_DispatcherTest_e2__V'); DispatcherTest.e2.new_host();
        DispatcherTest.e3 = new $units['test47.Ev'].Ev('test47_DispatcherTest_e3__V'); DispatcherTest.e3.new_host();
        return $$text;
    }
    DispatcherTest.pollen__uses__ = function() {
        $$bind($units['test47.Dispatcher'], 'pollen$used', true);
        $$bind($units['test47.Ev'], 'pollen$used', true);
    }
    DispatcherTest.$$privateInit = function() {
    }
    return DispatcherTest;
}
var $$u = $$c();
$units['test47.DispatcherTest'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test47.DispatcherTest'].pollen$used = true;

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
