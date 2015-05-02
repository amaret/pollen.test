
/*
 * ======== MODULE pollen.parts.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'pollen.parts.Led';
    Led.pollen$used = 0;
    Led.targetInit = new $$Ref('pollen_parts_Led_targetInit__I');
    Led.toggle = new $$Ref('pollen_parts_Led_toggle__E');
    Led.on = new $$Ref('pollen_parts_Led_on__E');
    Led.off = new $$Ref('pollen_parts_Led_off__E');
    Led.isOn = new $$Ref('pollen_parts_Led_isOn__E');
    Led.isActiveLow = false;
    Led.bindPin = function( p ) {
        var $$text = '';
        var $$v = 'pollen_parts_Led_';
        var $$s = $$bind($units['pollen.parts.Led'], 'Gpio', $$v);if ($$v && $$v == $$s) $$v.pollen$used = true;

        return $$text;
    }
    Led.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led.pollen__uses__ = function() {
    }
    Led.$$privateInit = function() {
        Led.Gpio = 0;
    }
    return Led;
}
var $$u = $$c();
$units['pollen.parts.Led'] = $$u;
$units.push($$u);

