
/*
 * ======== MODULE test13.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test13.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.Event = $units['test13.Event'];
    HelloWorld.ClockSource_SCLK = 2;
    HelloWorld.ClockSource_ACLK = 7;
    HelloWorld.start = new $$Ref('test13_HelloWorld_start__I');
    HelloWorld.pollen__run = new $$Ref('test13_HelloWorld_pollen__run__E');
    HelloWorld.handle = new $$Ref('test13_HelloWorld_handle__E');
    HelloWorld.targetInit = new $$Ref('test13_HelloWorld_targetInit__I');
    HelloWorld.test = function() {
        var $$text = '';
        var x;
        var z;
        x = (HelloWorld.ClockSource_SCLK);
        z = ($units['test13.YEnum'].YEnum_Y1);
        return $$text;
    }
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test13.YEnum'], 'pollen$used', true);
        $$bind($units['test13.Event'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
    }
    return HelloWorld;
}
var $$u = $$c();
$units['test13.HelloWorld'] = $$u;
$units.push($$u);

