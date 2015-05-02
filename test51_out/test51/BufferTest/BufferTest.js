
/*
 * ======== MODULE test51.BufferTest ========
 */

var $$c = function() {
    const BufferTest = {};
    BufferTest.BufferTest = BufferTest
    BufferTest.$name = 'test51.BufferTest';
    BufferTest.pollen$used = 0;
    BufferTest.BufferManager = $units['pollen.net.transport.BufferManager'];
    BufferTest.SingleBufferManager = $units['pollen.net.transport.SingleBufferManager'];
    BufferTest.pollen__run = new $$Ref('test51_BufferTest_pollen__run__E');
    BufferTest.targetInit = new $$Ref('test51_BufferTest_targetInit__I');
    BufferTest.$$hostInit = function() {
        var $$text = '';
        BufferTest.buf2 = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test51_BufferTest_buf2__A', false); BufferTest.buf2.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0 ]));
        var $$v = 'pollen_net_transport_SingleBufferManager';
        var $$s = $$bind($units['test51.BufferTest'], 'BufferManager.provider', $$v);{ $$v.pollen$used = true;
        $units['pollen.net.transport.SingleBufferManager'].pollen$used = true;}


        return $$text;
    }
    BufferTest.pollen__uses__ = function() {
        $$bind($units['pollen.net.transport.BufferManager'], 'pollen$used', true);
        $$bind($units['pollen.net.transport.SingleBufferManager'], 'pollen$used', true);
    }
    BufferTest.$$privateInit = function() {
        BufferTest.buf2 = new $$Array(1, function($$cn,$$idx){ return 0;}, 'test51_BufferTest_buf2__A', false); BufferTest.buf2.$$assign((new $$Array(1, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0 ]));
    }
    return BufferTest;
}
var $$u = $$c();
$units['test51.BufferTest'] = $$u;
$units.push($$u);

