
/*
 * ======== MODULE test7.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'test7.Led';
    Led.pollen$used = 0;
    Led.Z = $units['test7.Y'];
    Led.LedPin = $units['pollen.interfaces.Gpio'];
    Led.targetInit = new $$Ref('test7_Led_targetInit__I');
    Led.on = new $$Ref('test7_Led_on__E');
    Led.isActiveLow = 3;
    Led.newNum = 2;
    Led.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led.pollen__uses__ = function() {
        $$bind($units['test7.Y'], 'pollen$used', true);
        $$bind($units['pollen.interfaces.Gpio'], 'pollen$used', true);
    }
    Led.$$privateInit = function() {
    }
    return Led;
}
var $$u = $$c();
$units['test7.Led'] = $$u;
$units.push($$u);

