
/*
 * ======== MODULE test28.Blink2 ========
 */

var $$c = function() {
    const Blink2 = {};
    Blink2.Blink2 = Blink2
    Blink2.$name = 'test28.Blink2';
    Blink2.pollen$used = 0;
    Blink2.Pin = $units['test28.MspPin'];
    Blink2.targetInit = new $$Ref('test28_Blink2_targetInit__I');
    Blink2.pollen__run = new $$Ref('test28_Blink2_pollen__run__E');
    Blink2.delay = new $$Ref('test28_Blink2_delay__I');
    Blink2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink2.pollen__uses__ = function() {
        $$bind($units['test28.MspPin'], 'pollen$used', true);
    }
    Blink2.$$privateInit = function() {
    }
    return Blink2;
}
var $$u = $$c();
$units['test28.Blink2'] = $$u;
$units.push($$u);

