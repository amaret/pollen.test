
/*
 * ======== MODULE pollen.interfaces.Gpio ========
 */

var $$c = function() {
    const Gpio = {};
    Gpio.Gpio = Gpio
    Gpio.$name = 'pollen.interfaces.Gpio';
    Gpio.pollen$used = 0;
    Gpio.set = new $$Ref('pollen_interfaces_Gpio_set__E');
    Gpio.clear = new $$Ref('pollen_interfaces_Gpio_clear__E');
    Gpio.toggle = new $$Ref('pollen_interfaces_Gpio_toggle__E');
    Gpio.get = new $$Ref('pollen_interfaces_Gpio_get__E');
    Gpio.makeInput = new $$Ref('pollen_interfaces_Gpio_makeInput__E');
    Gpio.isInput = new $$Ref('pollen_interfaces_Gpio_isInput__E');
    Gpio.makeOutput = new $$Ref('pollen_interfaces_Gpio_makeOutput__E');
    Gpio.isOutput = new $$Ref('pollen_interfaces_Gpio_isOutput__E');
    Gpio.targetInit = new $$Ref('pollen_interfaces_Gpio_targetInit__I');
    Gpio.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Gpio.pollen__uses__ = function() {
    }
    Gpio.$$privateInit = function() {
    }
    return Gpio;
}
var $$u = $$c();
$units['pollen.interfaces.Gpio'] = $$u;
$units.push($$u);

