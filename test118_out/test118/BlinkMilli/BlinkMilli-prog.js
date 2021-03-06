
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
 * ======== MODULE test118.BlinkMilli ========
 */

var $$c = function() {
    const BlinkMilli = {};
    BlinkMilli.BlinkMilli = BlinkMilli
    BlinkMilli.$name = 'test118.BlinkMilli';
    BlinkMilli.pollen$used = 0;
    BlinkMilli.PrintImpl = $units['test54.PrintImpl'];
    BlinkMilli.led$$id = 1;
    BlinkMilli.led = function(cn) {
        this.$$id = BlinkMilli.led$$id++;
        this.$$cname = cn ? cn : 'test118_BlinkMilli_led__'+this.$$id+'__S';
        this.$$tname = 'test118_BlinkMilli_led';
        this.$$uname = 'test118.BlinkMilli';
        this.red = 1;
        this.blue = 0;
    }
    BlinkMilli.led.prototype = new $$Struct('test118.BlinkMilli.led');
    BlinkMilli.led.prototype.$$isAggFld = {};
    BlinkMilli.led.prototype.$$isAggFld.red = false;
    BlinkMilli.led.prototype.$$isAggFld.blue = false;
    BlinkMilli.led.prototype.new_host = function( j ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                (this.blue) = (j);
        }
        this.$$hostInitLastPass();
        return this;
    }
    BlinkMilli.led.prototype.$$privateInit = function() {
        this.red = 1;
        this.blue = 0;
    }
    BlinkMilli.led.prototype.$$hostInitLastPass = function() {
    }
    BlinkMilli.foobar = new $$Ref('test118_BlinkMilli_foobar__I');
    BlinkMilli.targetInit = new $$Ref('test118_BlinkMilli_targetInit__E');
    BlinkMilli.test = new $$Ref('test118_BlinkMilli_test__I');
    BlinkMilli.chkArray = new $$Ref('test118_BlinkMilli_chkArray__I');
    BlinkMilli.pollen__run = new $$Ref('test118_BlinkMilli_pollen__run__E');
    BlinkMilli.$$hostInit = function() {
        var $$text = '';
        BlinkMilli.hll = new BlinkMilli.led('test118_BlinkMilli_hll__V'); BlinkMilli.hll.new_host(9);
        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.ledArr = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_ledArr__A', false); BlinkMilli.ledArr.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test118.BlinkMilli'].led().new_host(2), new $units['test118.BlinkMilli'].led().new_host(2) ]));
        BlinkMilli.leds = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_leds__A', false); BlinkMilli.leds.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        BlinkMilli.hostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_hostarr__A', false); BlinkMilli.hostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr__A', false); BlinkMilli.chkarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr2__A', false);
        BlinkMilli.chkarr3 = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr3__A', false); BlinkMilli.chkarr3.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1 ]));
        BlinkMilli.chkarr4 = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr4__A', false); BlinkMilli.chkarr4.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        BlinkMilli.chkarr5 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr5__A', false);
        BlinkMilli.chkarr6 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr6__A', false);
        BlinkMilli.bind();
        return $$text;
    }
    BlinkMilli.bind = function() {
        var $$text = '';
        var nestarr;
        nestarr = (new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]);
        (BlinkMilli.hostarr).set(0, 0);
        (BlinkMilli.hostarr).set(1, 3);
        return $$text;
    }
    BlinkMilli.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    BlinkMilli.$$privateInit = function() {
        BlinkMilli.nonhostVarTest = 9;
        BlinkMilli.hostVarTest2 = 9;
        BlinkMilli.initialBlue = 33;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test118.BlinkMilli'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.leds = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_leds__A', false); BlinkMilli.leds.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null ]));
        BlinkMilli.chkarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr__A', false); BlinkMilli.chkarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.chkarr2 = new $$Array(-1, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr2__A', false);
        BlinkMilli.chkarr3 = new $$Array(3, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr3__A', false); BlinkMilli.chkarr3.$$assign((new $$Array(3, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 1, 1 ]));
        BlinkMilli.chkarr4 = new $$Array(2, function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr4__A', false); BlinkMilli.chkarr4.$$assign((new $$Array(2, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2 ]));
        BlinkMilli.chkarr6 = new $$Array((BlinkMilli.nonhostVarTest), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr6__A', false);
    }
    BlinkMilli.$$hostInitLastPass = function() {
        BlinkMilli.chkarr7 = new $$Array((BlinkMilli.hostVarTest2), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr7__A', false);
        BlinkMilli.chkarr8 = new $$Array((BlinkMilli.hostVarTest2), function($$cn,$$idx){ return 0;}, 'test118_BlinkMilli_chkarr8__A', false);
    }
    return BlinkMilli;
}
var $$u = $$c();
$units['test118.BlinkMilli'] = $$u;
$units.push($$u);


/*
 * ======== epilogue ========
 */

$units['test118.BlinkMilli'].pollen$used = true;

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
