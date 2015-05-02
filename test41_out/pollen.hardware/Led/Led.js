
/*
 * ======== MODULE pollen.hardware.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'pollen.hardware.Led';
    Led.pollen$used = 0;
    Led.targetInit = new $$Ref('pollen_hardware_Led_targetInit__I');
    Led.on = new $$Ref('pollen_hardware_Led_on__E');
    Led.off = new $$Ref('pollen_hardware_Led_off__E');
    Led.toggle = new $$Ref('pollen_hardware_Led_toggle__E');
    Led.isOn = new $$Ref('pollen_hardware_Led_isOn__E');
    Led.activeLow = false;
    Led.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led.pollen__uses__ = function() {
    }
    Led.$$privateInit = function() {
        Led.pin = 0;
    }
    return Led;
}
var $$u = $$c();
$units['pollen.hardware.Led'] = $$u;
$units.push($$u);

