
/*
 * ======== MODULE test10.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test10.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.Event = $units['test10.Event'];
    HelloWorld.start = new $$Ref('test10_HelloWorld_start__I');
    HelloWorld.pollen__run = new $$Ref('test10_HelloWorld_pollen__run__E');
    HelloWorld.handle = new $$Ref('test10_HelloWorld_handle__E');
    HelloWorld.targetInit = new $$Ref('test10_HelloWorld_targetInit__I');
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test10.Event'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
    }
    return HelloWorld;
}
var $$u = $$c();
$units['test10.HelloWorld'] = $$u;
$units.push($$u);

