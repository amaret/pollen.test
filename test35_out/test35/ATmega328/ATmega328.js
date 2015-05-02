
/*
 * ======== MODULE test35.ATmega328 ========
 */

var $$c = function() {
    const ATmega328 = {};
    ATmega328.ATmega328 = ATmega328
    ATmega328.$name = 'test35.ATmega328';
    ATmega328.pollen$used = 0;
    ATmega328.Timer0MatchA = $units['test35.Timer0MatchA'];
    ATmega328.start = new $$Ref('test35_ATmega328_start__I');
    ATmega328.pollen__run = new $$Ref('test35_ATmega328_pollen__run__E');
    ATmega328.targetInit = new $$Ref('test35_ATmega328_targetInit__I');
    ATmega328.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    ATmega328.pollen__uses__ = function() {
        $$bind($units['test35.Timer0MatchA'], 'pollen$used', true);
    }
    ATmega328.$$privateInit = function() {
    }
    return ATmega328;
}
var $$u = $$c();
$units['test35.ATmega328'] = $$u;
$units.push($$u);

