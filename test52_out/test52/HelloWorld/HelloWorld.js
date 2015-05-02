
/*
 * ======== MODULE test52.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test52.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.FcnImpl = $units['test52.FcnImpl'];
    HelloWorld.Event = $units['test52.Event'];
    HelloWorld.PrintImpl = $units['test61.PrintImpl'];
    HelloWorld.start = new $$Ref('test52_HelloWorld_start__I');
    HelloWorld.pollen__run = new $$Ref('test52_HelloWorld_pollen__run__E');
    HelloWorld.handle = new $$Ref('test52_HelloWorld_handle__E');
    HelloWorld.Inner$$id = 1;
    HelloWorld.Inner = function(cn) {
        this.$$id = HelloWorld.Inner$$id++;
        this.$$cname = cn ? cn : 'test52_HelloWorld_Inner__'+this.$$id+'__S';
        this.$$tname = 'test52_HelloWorld_Inner';
        this.$$uname = 'test52.HelloWorld';
    }
    HelloWorld.Inner.prototype = new $$Struct('test52.HelloWorld.Inner');
    HelloWorld.Inner.prototype.$$isAggFld = {};
    HelloWorld.Inner.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    HelloWorld.Inner.prototype.$$privateInit = function() {
    }
    HelloWorld.Inner.prototype.$$hostInitLastPass = function() {
    }
    HelloWorld.foo = new $$Ref('test52_HelloWorld_foo__I');
    HelloWorld.foo2 = new $$Ref('test52_HelloWorld_foo2__I');
    HelloWorld.bar = new $$Ref('test52_HelloWorld_bar__I');
    HelloWorld.bar2 = new $$Ref('test52_HelloWorld_bar2__I');
    HelloWorld.bar3 = new $$Ref('test52_HelloWorld_bar3__I');
    HelloWorld.bar4 = new $$Ref('test52_HelloWorld_bar4__I');
    HelloWorld.bar5 = new $$Ref('test52_HelloWorld_bar5__I');
    HelloWorld.bar5_and_rtn = new $$Ref('test52_HelloWorld_bar5_and_rtn__I');
    HelloWorld.fcnrefsAssign = new $$Ref('test52_HelloWorld_fcnrefsAssign__I');
    HelloWorld.fcnrefsCalls = new $$Ref('test52_HelloWorld_fcnrefsCalls__I');
    HelloWorld.fcnrefsParameters = new $$Ref('test52_HelloWorld_fcnrefsParameters__I');
    HelloWorld.testFcns = new $$Ref('test52_HelloWorld_testFcns__I');
    HelloWorld.targetInit = new $$Ref('test52_HelloWorld_targetInit__I');
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        (HelloWorld.proto_ref) = (HelloWorld.fp_impl);
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test52.FcnImpl'], 'pollen$used', true);
        $$bind($units['test52.Event'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
var $$v = 'test52_FcnImpl';
        var $$s = $$bind($units['test52.HelloWorld'], 'fp', $$v);{ $$v.pollen$used = true;
        $units['test52.FcnImpl'].pollen$used = true;}

        HelloWorld.fp_impl = new $$Ref('test52_FcnImpl_foo_proto__E');
        HelloWorld.fp_impl2 = new $$Ref('test52_FcnImpl_foo_proto__E');
        HelloWorld.clsFcnRef = new $$Ref('test52_HelloWorld_Inner_foo__I');
        HelloWorld.modFcnRef = new $$Ref('test52_FcnImpl_foo_proto__E');
        HelloWorld.foo_uint8 = new $$Ref('test52_HelloWorld_foo__I');
        HelloWorld.foo2_uint32_rtn = new $$Ref('test52_HelloWorld_foo2__I');
        HelloWorld.bar_uint8 = new $$Ref('test52_HelloWorld_bar__I');
        HelloWorld.bar2_bool = new $$Ref('test52_HelloWorld_bar2__I');
        HelloWorld.bar3_uint32 = new $$Ref('test52_HelloWorld_bar3__I');
        HelloWorld.bar4_uint32_and_rtn = new $$Ref('test52_HelloWorld_bar4__I');
        HelloWorld.bar5_uint16 = new $$Ref('test52_HelloWorld_bar5__I');
        HelloWorld.bar5_uint16_and_rtn = new $$Ref('test52_HelloWorld_bar5_and_rtn__I');
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test52.HelloWorld'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return HelloWorld;
}
var $$u = $$c();
$units['test52.HelloWorld'] = $$u;
$units.push($$u);

