
/*
 * ======== MODULE test9.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test9.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.Y = $units['test9.Y'];
    HelloWorld.Event = $units['test9.Event'];
    HelloWorld.start = new $$Ref('test9_HelloWorld_start__I');
    HelloWorld.pollen__run = new $$Ref('test9_HelloWorld_pollen__run__E');
    HelloWorld.handle = new $$Ref('test9_HelloWorld_handle__E');
    HelloWorld.targetInit = new $$Ref('test9_HelloWorld_targetInit__I');
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test9.Event'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
    }
    return HelloWorld;
}
var $$u = $$c();
$units['test9.HelloWorld'] = $$u;
$units.push($$u);

