
/*
 * ======== MODULE pollen.parts.Led2 ========
 */

var $$c = function() {
    const Led2 = {};
    Led2.Led2 = Led2
    Led2.$name = 'pollen.parts.Led2';
    Led2.pollen$used = 0;
    Led2.targetInit = new $$Ref('pollen_parts_Led2_targetInit__E');
    Led2.on = new $$Ref('pollen_parts_Led2_on__E');
    Led2.off = new $$Ref('pollen_parts_Led2_off__E');
    Led2.toggle = new $$Ref('pollen_parts_Led2_toggle__E');
    Led2.isOn = new $$Ref('pollen_parts_Led2_isOn__E');
    Led2.activeLow = false;
    Led2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led2.pollen__uses__ = function() {
    }
    Led2.$$privateInit = function() {
        Led2.pin = 0;
    }
    return Led2;
}
var $$u = $$c();
$units['pollen.parts.Led2'] = $$u;
$units.push($$u);

