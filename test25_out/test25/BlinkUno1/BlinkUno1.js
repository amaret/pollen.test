
/*
 * ======== MODULE test25.BlinkUno1 ========
 */

var $$c = function() {
    const BlinkUno1 = {};
    BlinkUno1.BlinkUno1 = BlinkUno1
    BlinkUno1.$name = 'test25.BlinkUno1';
    BlinkUno1.pollen$used = 0;
    BlinkUno1.pollen__reset = new $$Ref('test25_BlinkUno1_pollen__reset__E');
    BlinkUno1.pollen__run = new $$Ref('test25_BlinkUno1_pollen__run__E');
    BlinkUno1.targetInit = new $$Ref('test25_BlinkUno1_targetInit__I');
    BlinkUno1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkUno1.pollen__uses__ = function() {
        $$bind($units['atmel.atmega328.Mcu'], 'pollen$used', true);
        $$bind($units['atmel.atmega328.PB5'], 'pollen$used', true);
        $$bind($units['cc.arduino.Lifecycle'], 'pollen$used', true);
    }
    BlinkUno1.$$privateInit = function() {
    }
    return BlinkUno1;
}
var $$u = $$c();
$units['test25.BlinkUno1'] = $$u;
$units.push($$u);

