
/*
 * ======== MODULE test39.Test0 ========
 */

var $$c = function() {
    const Test0 = {};
    Test0.Test0 = Test0
    Test0.$name = 'test39.Test0';
    Test0.pollen$used = 0;
    Test0.Timer0MatchA = $units['atmel.atmega8.Timer0MatchA'];
    Test0.pollen__run = new $$Ref('test39_Test0_pollen__run__E');
    Test0.isr = new $$Ref('test39_Test0_isr__I');
    Test0.targetInit = new $$Ref('test39_Test0_targetInit__I');
    Test0.$$hostInit = function() {
        var $$text = '';
        $units['atmel.atmega8.Timer0MatchA'].setHandlerOnHost((Test0.isr));
        return $$text;
    }
    Test0.pollen__uses__ = function() {
        $$bind($units['atmel.atmega8.Timer0MatchA'], 'pollen$used', true);
    }
    Test0.$$privateInit = function() {
    }
    return Test0;
}
var $$u = $$c();
$units['test39.Test0'] = $$u;
$units.push($$u);

