
/*
 * ======== MODULE atmel.atmega.PB4 ========
 */

var $$c = function() {
    const PB4 = {};
    PB4.PB4 = PB4
    PB4.$name = 'atmel.atmega.PB4';
    PB4.pollen$used = 0;
    PB4.set = new $$Ref('atmel_atmega_PB4_set__E');
    PB4.clear = new $$Ref('atmel_atmega_PB4_clear__E');
    PB4.toggle = new $$Ref('atmel_atmega_PB4_toggle__E');
    PB4.get = new $$Ref('atmel_atmega_PB4_get__E');
    PB4.isInput = new $$Ref('atmel_atmega_PB4_isInput__E');
    PB4.isOutput = new $$Ref('atmel_atmega_PB4_isOutput__E');
    PB4.makeInput = new $$Ref('atmel_atmega_PB4_makeInput__E');
    PB4.makeOutput = new $$Ref('atmel_atmega_PB4_makeOutput__E');
    PB4.targetInit = new $$Ref('atmel_atmega_PB4_targetInit__I');
    PB4.port = "B";
    PB4.pin = 4;
    PB4.$$hostInit = function() {
        var $$text = '';
        (PB4.pinMask) = (1 << (PB4.pin));
        return $$text;
    }
    PB4.pollen__uses__ = function() {
    }
    PB4.$$privateInit = function() {
        PB4.pinMask = 0;
    }
    return PB4;
}
var $$u = $$c();
$units['atmel.atmega.PB4'] = $$u;
$units.push($$u);

