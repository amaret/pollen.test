
/*
 * ======== MODULE atmel.atmega328.PB5 ========
 */

var $$c = function() {
    const PB5 = {};
    PB5.PB5 = PB5
    PB5.$name = 'atmel.atmega328.PB5';
    PB5.pollen$used = 0;
    PB5.set = new $$Ref('atmel_atmega328_PB5_set__E');
    PB5.clear = new $$Ref('atmel_atmega328_PB5_clear__E');
    PB5.toggle = new $$Ref('atmel_atmega328_PB5_toggle__E');
    PB5.get = new $$Ref('atmel_atmega328_PB5_get__E');
    PB5.makeInput = new $$Ref('atmel_atmega328_PB5_makeInput__E');
    PB5.isInput = new $$Ref('atmel_atmega328_PB5_isInput__E');
    PB5.makeOutput = new $$Ref('atmel_atmega328_PB5_makeOutput__E');
    PB5.isOutput = new $$Ref('atmel_atmega328_PB5_isOutput__E');
    PB5.targetInit = new $$Ref('atmel_atmega328_PB5_targetInit__I');
    PB5.portRegister = "PORTB";
    PB5.directionRegister = "DDRB";
    PB5.bit = 5;
    PB5.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    PB5.pollen__uses__ = function() {
    }
    PB5.$$privateInit = function() {
    }
    return PB5;
}
var $$u = $$c();
$units['atmel.atmega328.PB5'] = $$u;
$units.push($$u);

