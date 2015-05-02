
/*
 * ======== MODULE test47.DispatcherTest ========
 */

var $$c = function() {
    const DispatcherTest = {};
    DispatcherTest.DispatcherTest = DispatcherTest
    DispatcherTest.$name = 'test47.DispatcherTest';
    DispatcherTest.pollen$used = 0;
    DispatcherTest.Dispatcher = $units['test47.Dispatcher'];
    DispatcherTest.Ev = $units['test47.Ev'];
    DispatcherTest.targetInit = new $$Ref('test47_DispatcherTest_targetInit__I');
    DispatcherTest.handle = new $$Ref('test47_DispatcherTest_handle__E');
    DispatcherTest.pollen__run = new $$Ref('test47_DispatcherTest_pollen__run__E');
    DispatcherTest.$$hostInit = function() {
        var $$text = '';
        DispatcherTest.e1 = new $units['test47.Ev'].Ev('test47_DispatcherTest_e1__V'); DispatcherTest.e1.new_host();
        DispatcherTest.e2 = new $units['test47.Ev'].Ev('test47_DispatcherTest_e2__V'); DispatcherTest.e2.new_host();
        DispatcherTest.e3 = new $units['test47.Ev'].Ev('test47_DispatcherTest_e3__V'); DispatcherTest.e3.new_host();
        return $$text;
    }
    DispatcherTest.pollen__uses__ = function() {
        $$bind($units['test47.Dispatcher'], 'pollen$used', true);
        $$bind($units['test47.Ev'], 'pollen$used', true);
    }
    DispatcherTest.$$privateInit = function() {
    }
    return DispatcherTest;
}
var $$u = $$c();
$units['test47.DispatcherTest'] = $$u;
$units.push($$u);

