
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
 * ======== COMPOSITION cc.arduino.Environment ========
 */

var $$c = function() {
    const Environment = {};
    Environment.Environment = Environment
    Environment.$name = 'cc.arduino.Environment';
    Environment.pollen$used = 0;
    return Environment;
}
var $$u = $$c();
$units['cc.arduino.Environment'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test2.TT ========
 */

var $$c = function() {
    const TT = {};
    TT.TT = TT
    TT.$name = 'test2.TT';
    TT.pollen$used = 0;
    TT.Z = $units['test2.Y'];
    TT.targetInit = new $$Ref('test2_TT_targetInit__I');
    TT.lowValue = true;
    TT.get = function() {
        var $$text = '';
        var l;
        l = (TT.lowValue);
        if ((TT.lowValue)) {
            return(  5  );
        }
        else {
            return(  3  );
        }
        return $$text;
    }
    TT.$$hostInit = function() {
        var $$text = '';
        (TT.x) = TT.get();
        return $$text;
    }
    TT.pollen__uses__ = function() {
    }
    TT.$$privateInit = function() {
        TT.x = 1;
    }
    return TT;
}
var $$u = $$c();
$units['test2.TT'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test2.BlinkMilli2 ========
 */

var $$c = function() {
    const BlinkMilli2 = {};
    BlinkMilli2.BlinkMilli2 = BlinkMilli2
    BlinkMilli2.$name = 'test2.BlinkMilli2';
    BlinkMilli2.pollen$used = 0;
    BlinkMilli2.HostChk = $units['test2.HostChk'];
    BlinkMilli2.TimerMilli = $units['pollen.time.TimerMilli'];
    BlinkMilli2.TT = $units['test2.TT'];
    BlinkMilli2.nestClass$$id = 1;
    BlinkMilli2.nestClass = function(cn) {
        this.$$id = BlinkMilli2.nestClass$$id++;
        this.$$cname = cn ? cn : 'test2_BlinkMilli2_nestClass__'+this.$$id+'__S';
        this.$$tname = 'test2_BlinkMilli2_nestClass';
        this.$$uname = 'test2.BlinkMilli2';
    }
    BlinkMilli2.nestClass.prototype = new $$Struct('test2.BlinkMilli2.nestClass');
    BlinkMilli2.nestClass.prototype.$$isAggFld = {};
    BlinkMilli2.nestClass.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    BlinkMilli2.nestClass.prototype.$$privateInit = function() {
    }
    BlinkMilli2.nestClass.prototype.$$hostInitLastPass = function() {
    }
    BlinkMilli2.State_UNINITIALIZED = 0;
    BlinkMilli2.State_INITIALIZATION = 1;
    BlinkMilli2.State_ACTIVE = 2;
    BlinkMilli2.State_IDLE = 3;
    BlinkMilli2.State_ERROR = 5;
    BlinkMilli2.switch_test = new $$Ref('test2_BlinkMilli2_switch_test__E');
    BlinkMilli2.foo = new $$Ref('test2_BlinkMilli2_foo__E');
    BlinkMilli2.bar = new $$Ref('test2_BlinkMilli2_bar__E');
    BlinkMilli2.pollen__run = new $$Ref('test2_BlinkMilli2_pollen__run__E');
    BlinkMilli2.pollen__reset = new $$Ref('test2_BlinkMilli2_pollen__reset__E');
    BlinkMilli2.targetInit = new $$Ref('test2_BlinkMilli2_targetInit__I');
    BlinkMilli2.toggle = function() {
        var $$text = '';
        var lowValue;
        lowValue = true;
        (BlinkMilli2.chk) = 2;
        (BlinkMilli2.chk2) = 3;
        $units['test2.TT'].get();
        return $$text;
    }
    BlinkMilli2.$$hostInit = function() {
        var $$text = '';
        BlinkMilli2.arr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test2_BlinkMilli2_arr__A', false); BlinkMilli2.arr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        return $$text;
    }
    BlinkMilli2.pollen__uses__ = function() {
        $$bind($units['test2.TT'], 'pollen$used', true);
    }
    BlinkMilli2.$$privateInit = function() {
        BlinkMilli2.chk = 3;
        BlinkMilli2.chk2 = 2;
        BlinkMilli2.gref = new $$Ref('pollen_interfaces_Led_toggle__I');
        BlinkMilli2.fref = new $$Ref('pollen_interfaces_Led_on__I');
    }
    return BlinkMilli2;
}
var $$u = $$c();
$units['test2.BlinkMilli2'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test2.BlinkMilli2'].pollen$used = true;

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
