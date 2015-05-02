
/*
 * ======== COMPOSITION test30.BlinkEnv ========
 */

var $$c = function() {
    const BlinkEnv = {};
    BlinkEnv.BlinkEnv = BlinkEnv
    BlinkEnv.$name = 'test30.BlinkEnv';
    BlinkEnv.pollen$used = 0;
    BlinkEnv.AvrPin = $units['test30.AvrPin'];
    BlinkEnv.Led = $units['test30.Led'];
    BlinkEnv.$$hostInit = function() {
        var $$text = '';
        var $$v = 'test30_AvrPin';
        var $$s = $$bind($units['test30.BlinkEnv'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['test30.AvrPin'].pollen$used = true;}


        return $$text;
    }
    return BlinkEnv;
}
var $$u = $$c();
$units['test30.BlinkEnv'] = $$u;
$units.push($$u);

