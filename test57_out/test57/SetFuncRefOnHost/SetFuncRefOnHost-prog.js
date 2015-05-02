
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
 * ======== pollen.hardware_old.HandlerP ========
 */

var $$c = function() {
    const HandlerP = {};
    HandlerP.HandlerP = HandlerP
    HandlerP.$name = 'pollen.hardware_old.HandlerP';
    HandlerP.pollen$used = 0;
    HandlerP.pollen__uses__ = function() {
    }
    HandlerP.$$privateInit = function() {
    }
    return HandlerP;
}
var $$u = $$c();
$units['pollen.hardware_old.HandlerP'] = $$u;
$units.push($$u);


/*
 * ======== CLASS test57.ClsFuncRef ========
 */

var $$c = function() {
    const ClsFuncRef = {};
    ClsFuncRef.ClsFuncRef = ClsFuncRef
    ClsFuncRef.$name = 'test57.ClsFuncRef';
    ClsFuncRef.pollen$used = 0;
    ClsFuncRef.ClsFuncRef$$id = 1;
    ClsFuncRef.ClsFuncRef = function(cn) {
        this.$$id = ClsFuncRef.ClsFuncRef$$id++;
        this.$$cname = cn ? cn : 'test57_ClsFuncRef_ClsFuncRef__'+this.$$id+'__S';
        this.$$tname = 'test57_ClsFuncRef_ClsFuncRef';
        this.$$uname = 'test57.ClsFuncRef';
        this.myHandler1_Host = 0;
        this.myHandler2_Host = 0;
        this.myHandler3_Host = 0;
        this.myHandler4_Host = 0;
        this.flag = true;
        this.myHandler1_Targ = 0;
        this.myHandler2_Targ = 0;
        this.myHandler3_Targ = 0;
        this.myHandler4_Targ = 0;
        this.flag2 = true;
        this.tt = 0;
    }
    ClsFuncRef.ClsFuncRef.prototype = new $$Struct('test57.ClsFuncRef.ClsFuncRef');
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld = {};
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler1_Host = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler2_Host = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler3_Host = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler4_Host = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.flag = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler1_Targ = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler2_Targ = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler3_Targ = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler4_Targ = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.flag2 = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.tt = false;
    ClsFuncRef.ClsFuncRef.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.setTheFuncRefOnHost1((ClsFuncRef.hostTheHandler));
        this.setTheFuncRefOnHost2((ClsFuncRef.targetTheHandler));
        this.setTheFuncRefOnHost3((ClsFuncRef.hostTheHandler));
        this.setTheFuncRefOnHost4((ClsFuncRef.targetTheHandler));
        this.$$hostInitLastPass();
        return this;
    }
    ClsFuncRef.ClsFuncRef.prototype.setTheFuncRefOnHost1 = function( h ) {
        var $$text = '';
        (this.myHandler1_Host) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.ClsFuncRef.prototype.setTheFuncRefOnHost2 = function( h ) {
        var $$text = '';
        (this.myHandler2_Host) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.ClsFuncRef.prototype.setTheFuncRefOnHost3 = function( h ) {
        var $$text = '';
        (this.myHandler3_Targ) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.ClsFuncRef.prototype.setTheFuncRefOnHost4 = function( h ) {
        var $$text = '';
        (this.myHandler4_Targ) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.ClsFuncRef.prototype.hostTheHandler = function() {
        var $$text = '';
         printf("host Handler called\n") ;

        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.pollen__uses__ = function() {
    }
    ClsFuncRef.ClsFuncRef.prototype.$$privateInit = function() {
        this.flag = true;
        this.flag2 = true;
        ClsFuncRef.tt = new $$Ref('test57_ClsFuncRef_ClsFuncRef_foo__E');
    }
    ClsFuncRef.ClsFuncRef.prototype.$$hostInitLastPass = function() {
    }
    return ClsFuncRef;
}
var $$u = $$c();
$units['test57.ClsFuncRef'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test57.SetFuncRefOnHost ========
 */

var $$c = function() {
    const SetFuncRefOnHost = {};
    SetFuncRefOnHost.SetFuncRefOnHost = SetFuncRefOnHost
    SetFuncRefOnHost.$name = 'test57.SetFuncRefOnHost';
    SetFuncRefOnHost.pollen$used = 0;
    SetFuncRefOnHost.ClsFuncRef = $units['test57.ClsFuncRef'];
    SetFuncRefOnHost.targetInit = new $$Ref('test57_SetFuncRefOnHost_targetInit__I');
    SetFuncRefOnHost.setTheFuncRefOnTarg1 = new $$Ref('test57_SetFuncRefOnHost_setTheFuncRefOnTarg1__I');
    SetFuncRefOnHost.setTheFuncRefOnTarg2 = new $$Ref('test57_SetFuncRefOnHost_setTheFuncRefOnTarg2__I');
    SetFuncRefOnHost.setTheFuncRefOnTarg3 = new $$Ref('test57_SetFuncRefOnHost_setTheFuncRefOnTarg3__I');
    SetFuncRefOnHost.setTheFuncRefOnTarg4 = new $$Ref('test57_SetFuncRefOnHost_setTheFuncRefOnTarg4__I');
    SetFuncRefOnHost.pollen__run = new $$Ref('test57_SetFuncRefOnHost_pollen__run__E');
    SetFuncRefOnHost.targetTheHandler = new $$Ref('test57_SetFuncRefOnHost_targetTheHandler__I');
    SetFuncRefOnHost.pollen__shutdown = new $$Ref('test57_SetFuncRefOnHost_pollen__shutdown__E');
    SetFuncRefOnHost.$$hostInit = function() {
        var $$text = '';
        SetFuncRefOnHost.clsFR = new $units['test57.ClsFuncRef'].ClsFuncRef('test57_SetFuncRefOnHost_clsFR__V'); SetFuncRefOnHost.clsFR.new_host();
        SetFuncRefOnHost.setTheFuncRefOnHost1((SetFuncRefOnHost.hostTheHandler));
        SetFuncRefOnHost.setTheFuncRefOnHost2((SetFuncRefOnHost.targetTheHandler));
        SetFuncRefOnHost.setTheFuncRefOnHost3((SetFuncRefOnHost.hostTheHandler));
        SetFuncRefOnHost.setTheFuncRefOnHost4((SetFuncRefOnHost.targetTheHandler));
        return $$text;
    }
    SetFuncRefOnHost.setTheFuncRefOnHost1 = function( h ) {
        var $$text = '';
        (SetFuncRefOnHost.myHandler1_Host) = (h);
        return $$text;
    }
    SetFuncRefOnHost.setTheFuncRefOnHost2 = function( h ) {
        var $$text = '';
        (SetFuncRefOnHost.myHandler2_Host) = (h);
        return $$text;
    }
    SetFuncRefOnHost.setTheFuncRefOnHost3 = function( h ) {
        var $$text = '';
        (SetFuncRefOnHost.myHandler3_Targ) = (h);
        return $$text;
    }
    SetFuncRefOnHost.setTheFuncRefOnHost4 = function( h ) {
        var $$text = '';
        (SetFuncRefOnHost.myHandler4_Targ) = (h);
        return $$text;
    }
    SetFuncRefOnHost.hostTheHandler = function() {
        var $$text = '';
         printf("host Handler called\n") ;

        return $$text;
    }
    SetFuncRefOnHost.pollen__uses__ = function() {
        $$bind($units['test57.ClsFuncRef'], 'pollen$used', true);
    }
    SetFuncRefOnHost.$$privateInit = function() {
        SetFuncRefOnHost.flag = true;
        SetFuncRefOnHost.flag2 = true;
    }
    return SetFuncRefOnHost;
}
var $$u = $$c();
$units['test57.SetFuncRefOnHost'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test57.SetFuncRefOnHost'].pollen$used = true;

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
