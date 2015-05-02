
/*
 * ======== MODULE test44.BlinkEnvPin ========
 */

var $$c = function() {
    const BlinkEnvPin = {};
    BlinkEnvPin.BlinkEnvPin = BlinkEnvPin
    BlinkEnvPin.$name = 'test44.BlinkEnvPin';
    BlinkEnvPin.pollen$used = 0;
    BlinkEnvPin.pollen__reset = new $$Ref('test44_BlinkEnvPin_pollen__reset__E');
    BlinkEnvPin.pollen__run = new $$Ref('test44_BlinkEnvPin_pollen__run__E');
    BlinkEnvPin.targetInit = new $$Ref('test44_BlinkEnvPin_targetInit__I');
    BlinkEnvPin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkEnvPin.pollen__uses__ = function() {
        $$bind($units['atmel.atmega8.Core'], 'pollen$used', true);
        $$bind($units['atmel.atmega8.PB5'], 'pollen$used', true);
        $$bind($units['pollen.hardware.Led'], 'pollen$used', true);
    }
    BlinkEnvPin.$$privateInit = function() {
    }
    return BlinkEnvPin;
}
var $$u = $$c();
$units['test44.BlinkEnvPin'] = $$u;
$units.push($$u);

