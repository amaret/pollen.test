
/*
 * ======== MODULE pollen.net.transport.BufferManager ========
 */

var $$c = function() {
    const BufferManager = {};
    BufferManager.BufferManager = BufferManager
    BufferManager.$name = 'pollen.net.transport.BufferManager';
    BufferManager.pollen$used = 0;
    BufferManager.getSize = new $$Ref('pollen_net_transport_BufferManager_getSize__E');
    BufferManager.getBuffer = new $$Ref('pollen_net_transport_BufferManager_getBuffer__E');
    BufferManager.getDataLength = new $$Ref('pollen_net_transport_BufferManager_getDataLength__E');
    BufferManager.setDataLength = new $$Ref('pollen_net_transport_BufferManager_setDataLength__E');
    BufferManager.freeBuffer = new $$Ref('pollen_net_transport_BufferManager_freeBuffer__E');
    BufferManager.getEmptyBuffer = new $$Ref('pollen_net_transport_BufferManager_getEmptyBuffer__E');
    BufferManager.hasEmptyBuffer = new $$Ref('pollen_net_transport_BufferManager_hasEmptyBuffer__E');
    BufferManager.targetInit = new $$Ref('pollen_net_transport_BufferManager_targetInit__I');
    BufferManager.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BufferManager.pollen__uses__ = function() {
    }
    BufferManager.$$privateInit = function() {
        BufferManager.provider = 0;
    }
    return BufferManager;
}
var $$u = $$c();
$units['pollen.net.transport.BufferManager'] = $$u;
$units.push($$u);

