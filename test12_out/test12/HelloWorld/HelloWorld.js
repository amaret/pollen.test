
/*
 * ======== MODULE test12.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test12.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.Event = $units['test12.Event'];
    HelloWorld.start = new $$Ref('test12_HelloWorld_start__I');
    HelloWorld.pollen__run = new $$Ref('test12_HelloWorld_pollen__run__E');
    HelloWorld.handle = new $$Ref('test12_HelloWorld_handle__E');
    HelloWorld.targetInit = new $$Ref('test12_HelloWorld_targetInit__I');
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test12.Event'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
    }
    return HelloWorld;
}
var $$u = $$c();
$units['test12.HelloWorld'] = $$u;
$units.push($$u);

