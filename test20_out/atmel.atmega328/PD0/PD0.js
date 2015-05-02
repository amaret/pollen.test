
/*
 * ======== MODULE atmel.atmega328.PD0 ========
 */

var $$c = function() {
    const PD0 = {};
    PD0.PD0 = PD0
    PD0.$name = 'atmel.atmega328.PD0';
    PD0.pollen$used = 0;
    PD0.set = new $$Ref('atmel_atmega328_PD0_set__E');
    PD0.clear = new $$Ref('atmel_atmega328_PD0_clear__E');
    PD0.toggle = new $$Ref('atmel_atmega328_PD0_toggle__E');
    PD0.get = new $$Ref('atmel_atmega328_PD0_get__E');
    PD0.makeInput = new $$Ref('atmel_atmega328_PD0_makeInput__E');
    PD0.isInput = new $$Ref('atmel_atmega328_PD0_isInput__E');
    PD0.makeOutput = new $$Ref('atmel_atmega328_PD0_makeOutput__E');
    PD0.isOutput = new $$Ref('atmel_atmega328_PD0_isOutput__E');
    PD0.targetInit = new $$Ref('atmel_atmega328_PD0_targetInit__I');
    PD0.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    PD0.pollen__uses__ = function() {
    }
    PD0.$$privateInit = function() {
    }
    return PD0;
}
var $$u = $$c();
$units['atmel.atmega328.PD0'] = $$u;
$units.push($$u);

