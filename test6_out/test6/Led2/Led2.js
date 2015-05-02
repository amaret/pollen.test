
/*
 * ======== MODULE test6.Led2 ========
 */

var $$c = function() {
    const Led2 = {};
    Led2.Led2 = Led2
    Led2.$name = 'test6.Led2';
    Led2.pollen$used = 0;
    Led2.LedPin = $units['pollen.interfaces.Gpio'];
    Led2.Z = $units['test6.Y'];
    Led2.targetInit = new $$Ref('test6_Led2_targetInit__I');
    Led2.on = new $$Ref('test6_Led2_on__E');
    Led2.isActiveLow = false;
    Led2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led2.pollen__uses__ = function() {
        $$bind($units['pollen.interfaces.Gpio'], 'pollen$used', true);
        $$bind($units['test6.Y'], 'pollen$used', true);
    }
    Led2.$$privateInit = function() {
        Led2.pollen__unitname = "Led2";
    }
    return Led2;
}
var $$u = $$c();
$units['test6.Led2'] = $$u;
$units.push($$u);

