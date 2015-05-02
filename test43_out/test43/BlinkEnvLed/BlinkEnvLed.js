
/*
 * ======== MODULE test43.BlinkEnvLed ========
 */

var $$c = function() {
    const BlinkEnvLed = {};
    BlinkEnvLed.BlinkEnvLed = BlinkEnvLed
    BlinkEnvLed.$name = 'test43.BlinkEnvLed';
    BlinkEnvLed.pollen$used = 0;
    BlinkEnvLed.pollen__reset = new $$Ref('test43_BlinkEnvLed_pollen__reset__E');
    BlinkEnvLed.pollen__run = new $$Ref('test43_BlinkEnvLed_pollen__run__E');
    BlinkEnvLed.targetInit = new $$Ref('test43_BlinkEnvLed_targetInit__I');
    BlinkEnvLed.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkEnvLed.pollen__uses__ = function() {
        $$bind($units['atmel.atmega8.Core'], 'pollen$used', true);
        $$bind($units['atmel.atmega8.PB5'], 'pollen$used', true);
        $$bind($units['pollen.hardware.Led'], 'pollen$used', true);
    }
    BlinkEnvLed.$$privateInit = function() {
    }
    return BlinkEnvLed;
}
var $$u = $$c();
$units['test43.BlinkEnvLed'] = $$u;
$units.push($$u);

