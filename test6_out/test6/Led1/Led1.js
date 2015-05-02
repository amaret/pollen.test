
/*
 * ======== MODULE test6.Led1 ========
 */

var $$c = function() {
    const Led1 = {};
    Led1.Led1 = Led1
    Led1.$name = 'test6.Led1';
    Led1.pollen$used = 0;
    Led1.LedPin = $units['pollen.interfaces.Gpio'];
    Led1.Z = $units['test6.Y'];
    Led1.targetInit = new $$Ref('test6_Led1_targetInit__I');
    Led1.on = new $$Ref('test6_Led1_on__E');
    Led1.isActiveLow = true;
    Led1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led1.pollen__uses__ = function() {
        $$bind($units['pollen.interfaces.Gpio'], 'pollen$used', true);
        $$bind($units['test6.Y'], 'pollen$used', true);
    }
    Led1.$$privateInit = function() {
        Led1.pollen__unitname = "Led1";
    }
    return Led1;
}
var $$u = $$c();
$units['test6.Led1'] = $$u;
$units.push($$u);

