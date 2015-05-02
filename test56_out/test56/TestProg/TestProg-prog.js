
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
 * ======== test56.OnP ========
 */

var $$c = function() {
    const OnP = {};
    OnP.OnP = OnP
    OnP.$name = 'test56.OnP';
    OnP.pollen$used = 0;
    OnP.pollen__uses__ = function() {
    }
    OnP.$$privateInit = function() {
    }
    return OnP;
}
var $$u = $$c();
$units['test56.OnP'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test56.On1 ========
 */

var $$c = function() {
    const On1 = {};
    On1.On1 = On1
    On1.$name = 'test56.On1';
    On1.pollen$used = 0;
    On1.on = new $$Ref('test56_On1_on__E');
    On1.on_0 = new $$Ref('test56_On1_on_0__E');
    On1.on_2_1 = new $$Ref('test56_On1_on_2_1__E');
    On1.targetInit = new $$Ref('test56_On1_targetInit__I');
    On1.on_2_0 = function() {
        var $$text = '';
        $$printf(">>In On1.on_2_0(), host fcn, no args \n");
        return $$text;
    }
    On1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    On1.pollen__uses__ = function() {
    }
    On1.$$privateInit = function() {
    }
    return On1;
}
var $$u = $$c();
$units['test56.On1'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test56.On2 ========
 */

var $$c = function() {
    const On2 = {};
    On2.On2 = On2
    On2.$name = 'test56.On2';
    On2.pollen$used = 0;
    On2.on = new $$Ref('test56_On2_on__E');
    On2.targetInit = new $$Ref('test56_On2_targetInit__I');
    On2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    On2.pollen__uses__ = function() {
    }
    On2.$$privateInit = function() {
    }
    return On2;
}
var $$u = $$c();
$units['test56.On2'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test56.On3 ========
 */

var $$c = function() {
    const On3 = {};
    On3.On3 = On3
    On3.$name = 'test56.On3';
    On3.pollen$used = 0;
    On3.on = new $$Ref('test56_On3_on__E');
    On3.targetInit = new $$Ref('test56_On3_targetInit__I');
    On3.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    On3.pollen__uses__ = function() {
    }
    On3.$$privateInit = function() {
    }
    return On3;
}
var $$u = $$c();
$units['test56.On3'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test56.On4 ========
 */

var $$c = function() {
    const On4 = {};
    On4.On4 = On4
    On4.$name = 'test56.On4';
    On4.pollen$used = 0;
    On4.on = new $$Ref('test56_On4_on__E');
    On4.targetInit = new $$Ref('test56_On4_targetInit__I');
    On4.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    On4.pollen__uses__ = function() {
    }
    On4.$$privateInit = function() {
    }
    return On4;
}
var $$u = $$c();
$units['test56.On4'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test56.On5 ========
 */

var $$c = function() {
    const On5 = {};
    On5.On5 = On5
    On5.$name = 'test56.On5';
    On5.pollen$used = 0;
    On5.on = new $$Ref('test56_On5_on__E');
    On5.targetInit = new $$Ref('test56_On5_targetInit__I');
    On5.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    On5.pollen__uses__ = function() {
    }
    On5.$$privateInit = function() {
    }
    return On5;
}
var $$u = $$c();
$units['test56.On5'] = $$u;
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
 * ======== MODULE test56.PrintImpl ========
 */

var $$c = function() {
    const PrintImpl = {};
    PrintImpl.PrintImpl = PrintImpl
    PrintImpl.$name = 'test56.PrintImpl';
    PrintImpl.pollen$used = 0;
    PrintImpl.printBool = new $$Ref('test56_PrintImpl_printBool__E');
    PrintImpl.printInt = new $$Ref('test56_PrintImpl_printInt__E');
    PrintImpl.printReal = new $$Ref('test56_PrintImpl_printReal__E');
    PrintImpl.printUint = new $$Ref('test56_PrintImpl_printUint__E');
    PrintImpl.printStr = new $$Ref('test56_PrintImpl_printStr__E');
    PrintImpl.targetInit = new $$Ref('test56_PrintImpl_targetInit__I');
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
$units['test56.PrintImpl'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test56.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test56.TestProg';
    TestProg.pollen$used = 0;
    TestProg.On1 = $units['test56.On1'];
    TestProg.On2 = $units['test56.On2'];
    TestProg.On3 = $units['test56.On3'];
    TestProg.On4 = $units['test56.On4'];
    TestProg.On5 = $units['test56.On5'];
    TestProg.PrintImpl = $units['test56.PrintImpl'];
    TestProg.pollen__run = new $$Ref('test56_TestProg_pollen__run__E');
    TestProg.targetInit = new $$Ref('test56_TestProg_targetInit__I');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg.on_host_functions = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_host_functions__A', false); TestProg.on_host_functions.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on3_host_fref), (TestProg.on3_host_fref), (TestProg.on3_host_fref) ]));
        TestProg.on_functions = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_functions__A', false); TestProg.on_functions.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on1_fref), (TestProg.on2_fref), (TestProg.on3_fref) ]));
        TestProg.on_functions_proto = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_functions_proto__A', false); TestProg.on_functions_proto.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on1_fref), (TestProg.on2_fref), (TestProg.on3_fref) ]));
        TestProg.on_function_by_name = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_function_by_name__A', false); TestProg.on_function_by_name.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ ($units['test56.On1'].on), ($units['test56.On2'].on), ($units['test56.On3'].on), ($units['test56.On4'].on) ]));
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test56.On1'], 'pollen$used', true);
        $$bind($units['test56.On2'], 'pollen$used', true);
        $$bind($units['test56.On3'], 'pollen$used', true);
        $$bind($units['test56.On4'], 'pollen$used', true);
        $$bind($units['test56.On5'], 'pollen$used', true);
        $$bind($units['test56.PrintImpl'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.on1_fref = new $$Ref('test56_On1_on__E');
        TestProg.on1_0_fref = new $$Ref('test56_On1_on_0__E');
        TestProg.on2_fref = new $$Ref('test56_On2_on__E');
        TestProg.on3_fref = new $$Ref('test56_On3_on__E');
        TestProg.on1_0_hfref = new $$Ref('test56_On1_on_0__E');
        TestProg.on3_host_fref = new $$Ref('test56_On3_on__E');
        TestProg.on1_0_fref_4 = new $$Ref('test56_On1_on_0__E');
var $$v = 'test56_PrintImpl';
        var $$s = $$bind($units['test56.TestProg'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test56.PrintImpl'].pollen$used = true;}

        TestProg.on_functions = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_functions__A', false); TestProg.on_functions.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on1_fref), (TestProg.on2_fref), (TestProg.on3_fref) ]));
        TestProg.on_functions_proto = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_functions_proto__A', false); TestProg.on_functions_proto.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ (TestProg.on1_fref), (TestProg.on2_fref), (TestProg.on3_fref) ]));
        TestProg.on_function_by_name = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test56_TestProg_on_function_by_name__A', false); TestProg.on_function_by_name.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ ($units['test56.On1'].on), ($units['test56.On2'].on), ($units['test56.On3'].on), ($units['test56.On4'].on) ]));
    }
    return TestProg;
}
var $$u = $$c();
$units['test56.TestProg'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test56.TestProg'].pollen$used = true;

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
