
/*
 * ======== MODULE pollen.parts.Led1 ========
 */

var $$c = function() {
    const Led1 = {};
    Led1.Led1 = Led1
    Led1.$name = 'pollen.parts.Led1';
    Led1.pollen$used = 0;
    Led1.targetInit = new $$Ref('pollen_parts_Led1_targetInit__E');
    Led1.on = new $$Ref('pollen_parts_Led1_on__E');
    Led1.off = new $$Ref('pollen_parts_Led1_off__E');
    Led1.toggle = new $$Ref('pollen_parts_Led1_toggle__E');
    Led1.isOn = new $$Ref('pollen_parts_Led1_isOn__E');
    Led1.activeLow = false;
    Led1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led1.pollen__uses__ = function() {
    }
    Led1.$$privateInit = function() {
        Led1.pin = 0;
    }
    return Led1;
}
var $$u = $$c();
$units['pollen.parts.Led1'] = $$u;
$units.push($$u);

