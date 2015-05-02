
/*
 * ======== COMPOSITION test61.BlinkEnvComp ========
 */

var $$c = function() {
    const BlinkEnvComp = {};
    BlinkEnvComp.BlinkEnvComp = BlinkEnvComp
    BlinkEnvComp.$name = 'test61.BlinkEnvComp';
    BlinkEnvComp.pollen$used = 0;
    BlinkEnvComp.AvrPin = $units['test61.AvrPin'];
    BlinkEnvComp.Led = $units['test61.Led'];
    BlinkEnvComp.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkEnvComp.pollen__presets__ = function() {
        var $$text = '';
        var $$v = 'test61_AvrPin';
        var $$s = $$bind($units['test61.BlinkEnvComp'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['test61.AvrPin'].pollen$used = true;}


        return $$text;
    }
    return BlinkEnvComp;
}
var $$u = $$c();
$units['test61.BlinkEnvComp'] = $$u;
$units.push($$u);

