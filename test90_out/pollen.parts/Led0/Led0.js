
/*
 * ======== MODULE pollen.parts.Led0 ========
 */

var $$c = function() {
    const Led0 = {};
    Led0.Led0 = Led0
    Led0.$name = 'pollen.parts.Led0';
    Led0.pollen$used = 0;
    Led0.targetInit = new $$Ref('pollen_parts_Led0_targetInit__E');
    Led0.on = new $$Ref('pollen_parts_Led0_on__E');
    Led0.off = new $$Ref('pollen_parts_Led0_off__E');
    Led0.toggle = new $$Ref('pollen_parts_Led0_toggle__E');
    Led0.isOn = new $$Ref('pollen_parts_Led0_isOn__E');
    Led0.activeLow = false;
    Led0.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led0.pollen__uses__ = function() {
    }
    Led0.$$privateInit = function() {
        Led0.pin = 0;
    }
    return Led0;
}
var $$u = $$c();
$units['pollen.parts.Led0'] = $$u;
$units.push($$u);

