
/*
 * ======== MODULE pollen.net.transport.SingleBufferManager ========
 */

var $$c = function() {
    const SingleBufferManager = {};
    SingleBufferManager.SingleBufferManager = SingleBufferManager
    SingleBufferManager.$name = 'pollen.net.transport.SingleBufferManager';
    SingleBufferManager.pollen$used = 0;
    SingleBufferManager.Buffer = $units['pollen.net.transport.Buffer'];
    SingleBufferManager.getBuffer = new $$Ref('pollen_net_transport_SingleBufferManager_getBuffer__E');
    SingleBufferManager.getDataLength = new $$Ref('pollen_net_transport_SingleBufferManager_getDataLength__E');
    SingleBufferManager.setDataLength = new $$Ref('pollen_net_transport_SingleBufferManager_setDataLength__E');
    SingleBufferManager.getSize = new $$Ref('pollen_net_transport_SingleBufferManager_getSize__E');
    SingleBufferManager.freeBuffer = new $$Ref('pollen_net_transport_SingleBufferManager_freeBuffer__E');
    SingleBufferManager.getEmptyBuffer = new $$Ref('pollen_net_transport_SingleBufferManager_getEmptyBuffer__E');
    SingleBufferManager.hasEmptyBuffer = new $$Ref('pollen_net_transport_SingleBufferManager_hasEmptyBuffer__E');
    SingleBufferManager.targetInit = new $$Ref('pollen_net_transport_SingleBufferManager_targetInit__I');
    SingleBufferManager.$$hostInit = function() {
        var $$text = '';
        SingleBufferManager.buf2 = new $units['pollen.net.transport.Buffer'].Buffer('pollen_net_transport_SingleBufferManager_buf2__V'); SingleBufferManager.buf2.new_host();
        SingleBufferManager.buf = new $units['pollen.net.transport.Buffer'].Buffer('pollen_net_transport_SingleBufferManager_buf__V');
        (SingleBufferManager.buf) = new $units['pollen.net.transport.Buffer'].Buffer().new_host();
        (SingleBufferManager.bufUsed) = false;
        return $$text;
    }
    SingleBufferManager.pollen__uses__ = function() {
        $$bind($units['pollen.net.transport.Buffer'], 'pollen$used', true);
    }
    SingleBufferManager.$$privateInit = function() {
        SingleBufferManager.bufUsed = 0;
    }
    return SingleBufferManager;
}
var $$u = $$c();
$units['pollen.net.transport.SingleBufferManager'] = $$u;
$units.push($$u);

