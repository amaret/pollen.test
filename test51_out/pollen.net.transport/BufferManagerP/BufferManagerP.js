
/*
 * ======== pollen.net.transport.BufferManagerP ========
 */

var $$c = function() {
    const BufferManagerP = {};
    BufferManagerP.BufferManagerP = BufferManagerP
    BufferManagerP.$name = 'pollen.net.transport.BufferManagerP';
    BufferManagerP.pollen$used = 0;
    BufferManagerP.Buffer = $units['pollen.net.transport.Buffer'];
    BufferManagerP.pollen__uses__ = function() {
        $$bind($units['pollen.net.transport.Buffer'], 'pollen$used', true);
    }
    BufferManagerP.$$privateInit = function() {
    }
    return BufferManagerP;
}
var $$u = $$c();
$units['pollen.net.transport.BufferManagerP'] = $$u;
$units.push($$u);

