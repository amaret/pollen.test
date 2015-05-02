
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
 * ======== CLASS test50.Class1 ========
 */

var $$c = function() {
    const Class1 = {};
    Class1.Class1 = Class1
    Class1.$name = 'test50.Class1';
    Class1.pollen$used = 0;
    Class1.Class1$$id = 1;
    Class1.Class1 = function(cn) {
        this.$$id = Class1.Class1$$id++;
        this.$$cname = cn ? cn : 'test50_Class1_Class1__'+this.$$id+'__S';
        this.$$tname = 'test50_Class1_Class1';
        this.$$uname = 'test50.Class1';
        this.z = 7;
        this.x = 7;
    }
    Class1.Class1.prototype = new $$Struct('test50.Class1.Class1');
    Class1.Class1.prototype.$$isAggFld = {};
    Class1.Class1.prototype.$$isAggFld.z = false;
    Class1.Class1.prototype.$$isAggFld.x = false;
    Class1.Class1.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        (this.z) = 2;
        this.classMethod();
        this.$$hostInitLastPass();
        return this;
    }
    Class1.Class1.prototype.classMethod = function() {
        var $$text = '';
        (this.z) = 3;
        this.$$hostInitLastPass();
        return $$text;
    }
    Class1.pollen__uses__ = function() {
    }
    Class1.Class1.prototype.$$privateInit = function() {
        this.z = 7;
        this.x = 7;
    }
    Class1.Class1.prototype.$$hostInitLastPass = function() {
    }
    return Class1;
}
var $$u = $$c();
$units['test50.Class1'] = $$u;
$units.push($$u);


/*
 * ======== MODULE test50.TestProg ========
 */

var $$c = function() {
    const TestProg = {};
    TestProg.TestProg = TestProg
    TestProg.$name = 'test50.TestProg';
    TestProg.pollen$used = 0;
    TestProg.Class1 = $units['test50.Class1'];
    TestProg.led$$id = 1;
    TestProg.led = function(cn) {
        this.$$id = TestProg.led$$id++;
        this.$$cname = cn ? cn : 'test50_TestProg_led__'+this.$$id+'__S';
        this.$$tname = 'test50_TestProg_led';
        this.$$uname = 'test50.TestProg';
        this.red = 1;
        this.green = 0;
        this.blue = 0;
    }
    TestProg.led.prototype = new $$Struct('test50.TestProg.led');
    TestProg.led.prototype.$$isAggFld = {};
    TestProg.led.prototype.$$isAggFld.red = false;
    TestProg.led.prototype.$$isAggFld.green = false;
    TestProg.led.prototype.$$isAggFld.blue = false;
    TestProg.led.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        (this.blue) = 7;
        this.$$hostInitLastPass();
        return this;
    }
    TestProg.led.prototype.fcnTest = function() {
        var $$text = '';
        this.$$hostInitLastPass();
        return $$text;
    }
    TestProg.led.prototype.fcnTest1 = function() {
        var $$text = '';
        this.fcnTest();
        this.$$hostInitLastPass();
        return $$text;
    }
    TestProg.led.prototype.$$privateInit = function() {
        this.red = 1;
        this.green = 0;
        this.blue = 0;
    }
    TestProg.led.prototype.$$hostInitLastPass = function() {
    }
    TestProg.test = new $$Ref('test50_TestProg_test__E');
    TestProg.targetInit = new $$Ref('test50_TestProg_targetInit__I');
    TestProg.pollen__run = new $$Ref('test50_TestProg_pollen__run__E');
    TestProg.$$hostInit = function() {
        var $$text = '';
        TestProg.hll = new TestProg.led('test50_TestProg_hll__V'); TestProg.hll.new_host();
        TestProg.leds = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test50_TestProg_leds__A', false); TestProg.leds.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test50.TestProg'].led().new_host(), new $units['test50.TestProg'].led().new_host() ]));
        TestProg.nums = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test50_TestProg_nums__A', false); TestProg.nums.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        TestProg.c_host = new $units['test50.Class1'].Class1('test50_TestProg_c_host__V'); TestProg.c_host.new_host();
        TestProg.j = new TestProg.led('test50_TestProg_j__V'); TestProg.j.new_host();
        return $$text;
    }
    TestProg.pollen__uses__ = function() {
        $$bind($units['test50.Class1'], 'pollen$used', true);
    }
    TestProg.$$privateInit = function() {
        TestProg.xx = 0;
    }
    return TestProg;
}
var $$u = $$c();
$units['test50.TestProg'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test50.TestProg'].pollen$used = true;

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
