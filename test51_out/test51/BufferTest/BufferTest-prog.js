
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
 * ======== CLASS pollen.net.transport.Buffer ========
 */

var $$c = function() {
    const Buffer = {};
    Buffer.Buffer = Buffer
    Buffer.$name = 'pollen.net.transport.Buffer';
    Buffer.pollen$used = 0;
    Buffer.Buffer$$id = 1;
    Buffer.Buffer = function(cn) {
        this.$$id = Buffer.Buffer$$id++;
        this.$$cname = cn ? cn : 'pollen_net_transport_Buffer_Buffer__'+this.$$id+'__S';
        this.$$tname = 'pollen_net_transport_Buffer_Buffer';
        this.$$uname = 'pollen.net.transport.Buffer';
        this.dlen = 0;
        this.maxBufferSize = 62;
    }
    Buffer.Buffer.prototype = new $$Struct('pollen.net.transport.Buffer.Buffer');
    Buffer.Buffer.prototype.$$isAggFld = {};
    Buffer.Buffer.prototype.$$isAggFld.dlen = false;
    Buffer.Buffer.prototype.$$isAggFld.maxBufferSize = false;
    Buffer.Buffer.prototype.$$isAggFld.buffer = true;
    Buffer.Buffer.prototype.new_host = function() {
        var $$text = '';
        var i;
        this.$$privateInit();
        for (i = 0; (i) < (this.maxBufferSize); (i)++) {
            (this.buffer).set((i), 0);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Buffer.pollen__uses__ = function() {
    }
    Buffer.Buffer.prototype.$$privateInit = function() {
        this.dlen = 0;
        this.maxBufferSize = 124;
    }
    Buffer.Buffer.prototype.$$hostInitLastPass = function() {
        this.buffer = new $$Array((this.maxBufferSize), function($$cn,$$idx){ return 0;}, 'pollen_net_transport_Buffer_buffer__A', false);
    }
    return Buffer;
}
var $$u = $$c();
$units['pollen.net.transport.Buffer'] = $$u;
$units.push($$u);


/*
 * ======== pollen.net.transport.BufferManagerP ========
 */

var $$c = function() {
    const BufferManagerP = {};
    BufferManagerP.BufferManagerP = BufferManagerP
    BufferManagerP.$name = 'pollen.net.transport.BufferManagerP';
    BufferManagerP.pollen$used = 0;
    BufferManagerP.Buffer = $units['pollen.net.transport.Buffer'];
    BufferManagerP.pollen__uses__ = function() {
        $$bind($units['pollen.net.transport.Buffer'], 'pollen$used', true);
    }
    BufferManagerP.$$privateInit = function() {
    }
    return BufferManagerP;
}
var $$u = $$c();
$units['pollen.net.transport.BufferManagerP'] = $$u;
$units.push($$u);


/*
 * ======== COMPOSITION pollen.net.transport.BufferConfig ========
 */

var $$c = function() {
    const BufferConfig = {};
    BufferConfig.BufferConfig = BufferConfig
    BufferConfig.$name = 'pollen.net.transport.BufferConfig';
    BufferConfig.pollen$used = 0;
    BufferConfig.Buffer = $units['pollen.net.transport.Buffer'];
    BufferConfig.pollen__presets__ = function() {
        var $$text = '';
        ($units['pollen.net.transport.Buffer'].maxBufferSize) = 124;
        return $$text;
    }
    return BufferConfig;
}
var $$u = $$c();
$units['pollen.net.transport.BufferConfig'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.net.transport.BufferManager ========
 */

var $$c = function() {
    const BufferManager = {};
    BufferManager.BufferManager = BufferManager
    BufferManager.$name = 'pollen.net.transport.BufferManager';
    BufferManager.pollen$used = 0;
    BufferManager.getSize = new $$Ref('pollen_net_transport_BufferManager_getSize__E');
    BufferManager.getBuffer = new $$Ref('pollen_net_transport_BufferManager_getBuffer__E');
    BufferManager.getDataLength = new $$Ref('pollen_net_transport_BufferManager_getDataLength__E');
    BufferManager.setDataLength = new $$Ref('pollen_net_transport_BufferManager_setDataLength__E');
    BufferManager.freeBuffer = new $$Ref('pollen_net_transport_BufferManager_freeBuffer__E');
    BufferManager.getEmptyBuffer = new $$Ref('pollen_net_transport_BufferManager_getEmptyBuffer__E');
    BufferManager.hasEmptyBuffer = new $$Ref('pollen_net_transport_BufferManager_hasEmptyBuffer__E');
    BufferManager.targetInit = new $$Ref('pollen_net_transport_BufferManager_targetInit__I');
    BufferManager.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BufferManager.pollen__uses__ = function() {
    }
    BufferManager.$$privateInit = function() {
        BufferManager.provider = 0;
    }
    return BufferManager;
}
var $$u = $$c();
$units['pollen.net.transport.BufferManager'] = $$u;
$units.push($$u);


/*
 * ======== MODULE pollen.net.transport.SingleBufferManager ========
 */

var $$c = function() {
    const SingleBufferManager = {};
    SingleBufferManager.SingleBufferManager = SingleBufferManager
    SingleBufferManager.$name = 'pollen.net.transport.SingleBufferManager';
    SingleBufferManager.pollen$used = 0;
    SingleBufferManager.Buffer = $units['pollen.net.transport.Buffer'];
    SingleBufferManager.getBuffer = new $$Ref('pollen_net_transport_SingleBufferManager_getBuffer__E');
    SingleBufferManager.getDataLength = new $$Ref('pollen_net_transport_SingleBufferManager_getDataLength__E');
    SingleBufferManager.setDataLength = new $$Ref('pollen_net_transport_SingleBufferManager_setDataLength__E');
    SingleBufferManager.getSize = new $$Ref('pollen_net_transport_SingleBufferManager_getSize__E');
    SingleBufferManager.freeBuffer = new $$Ref('pollen_net_transport_SingleBufferManager_freeBuffer__E');
    SingleBufferManager.getEmptyBuffer = new $$Ref('pollen_net_transport_SingleBufferManager_getEmptyBuffer__E');
    SingleBufferManager.hasEmptyBuffer = new $$Ref('pollen_net_transport_SingleBufferManager_hasEmptyBuffer__E');
    SingleBufferManager.targetInit = new $$Ref('pollen_net_transport_SingleBufferManager_targetInit__I');
    SingleBufferManager.$$hostInit = function() {
        var $$text = '';
        SingleBufferManager.buf2 = new $units['pollen.net.transport.Buffer'].Buffer('pollen_net_transport_SingleBufferManager_buf2__V'); SingleBufferManager.buf2.new_host();
        SingleBufferManager.buf = new $units['pollen.net.transport.Buffer'].Buffer('pollen_net_transport_SingleBufferManager_buf__V');
        (SingleBufferManager.buf) = new $units['pollen.net.transport.Buffer'].Buffer().new_host();
        (SingleBufferManager.bufUsed) = false;
        return $$text;
    }
    SingleBufferManager.pollen__uses__ = function() {
        $$bind($units['pollen.net.transport.Buffer'], 'pollen$used', true);
    }
    SingleBufferManager.$$privateInit = function() {
        SingleBufferManager.bufUsed = 0;
    }
    return SingleBufferManager;
}
var $$u = $$c();
$units['pollen.net.transport.SingleBufferManager'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test51.BufferTest ========
 */

var $$c = function() {
    const BufferTest = {};
    BufferTest.BufferTest = BufferTest
    BufferTest.$name = 'test51.BufferTest';
    BufferTest.pollen$used = 0;
    BufferTest.BufferManager = $units['pollen.net.transport.BufferManager'];
    BufferTest.SingleBufferManager = $units['pollen.net.transport.SingleBufferManager'];
    BufferTest.pollen__run = new $$Ref('test51_BufferTest_pollen__run__E');
    BufferTest.targetInit = new $$Ref('test51_BufferTest_targetInit__I');
    BufferTest.$$hostInit = function() {
        var $$text = '';
        BufferTest.buf2 = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test51_BufferTest_buf2__A', false); BufferTest.buf2.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0 ]));
        var $$v = 'pollen_net_transport_SingleBufferManager';
        var $$s = $$bind($units['test51.BufferTest'], 'BufferManager.provider', $$v);{ $$v.pollen$used = true;
        $units['pollen.net.transport.SingleBufferManager'].pollen$used = true;}


        return $$text;
    }
    BufferTest.pollen__uses__ = function() {
        $$bind($units['pollen.net.transport.BufferManager'], 'pollen$used', true);
        $$bind($units['pollen.net.transport.SingleBufferManager'], 'pollen$used', true);
    }
    BufferTest.$$privateInit = function() {
        BufferTest.buf2 = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test51_BufferTest_buf2__A', false); BufferTest.buf2.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0 ]));
    }
    return BufferTest;
}
var $$u = $$c();
$units['test51.BufferTest'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test51.BufferTest'].pollen$used = true;

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
