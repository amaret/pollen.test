
/*
 * ======== COMPOSITION pollen.net.transport.BufferConfig ========
 */

var $$c = function() {
    const BufferConfig = {};
    BufferConfig.BufferConfig = BufferConfig
    BufferConfig.$name = 'pollen.net.transport.BufferConfig';
    BufferConfig.pollen$used = 0;
    BufferConfig.Buffer = $units['pollen.net.transport.Buffer'];
    BufferConfig.pollen__presets__ = function() {
        var $$text = '';
        ($units['pollen.net.transport.Buffer'].maxBufferSize) = 124;
        return $$text;
    }
    return BufferConfig;
}
var $$u = $$c();
$units['pollen.net.transport.BufferConfig'] = $$u;
$units.push($$u);

