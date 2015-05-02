
/*
 * ======== MODULE pollen.interfaces.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'pollen.interfaces.Led';
    Led.pollen$used = 0;
    Led.on = new $$Ref('pollen_interfaces_Led_on__E');
    Led.off = new $$Ref('pollen_interfaces_Led_off__E');
    Led.toggle = new $$Ref('pollen_interfaces_Led_toggle__E');
    Led.isOn = new $$Ref('pollen_interfaces_Led_isOn__E');
    Led.targetInit = new $$Ref('pollen_interfaces_Led_targetInit__I');
    Led.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led.pollen__uses__ = function() {
    }
    Led.$$privateInit = function() {
    }
    return Led;
}
var $$u = $$c();
$units['pollen.interfaces.Led'] = $$u;
$units.push($$u);

