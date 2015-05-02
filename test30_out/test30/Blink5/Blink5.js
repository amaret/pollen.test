
/*
 * ======== MODULE test30.Blink5 ========
 */

var $$c = function() {
    const Blink5 = {};
    Blink5.Blink5 = Blink5
    Blink5.$name = 'test30.Blink5';
    Blink5.pollen$used = 0;
    Blink5.targetInit = new $$Ref('test30_Blink5_targetInit__I');
    Blink5.pollen__run = new $$Ref('test30_Blink5_pollen__run__E');
    Blink5.delay = new $$Ref('test30_Blink5_delay__I');
    Blink5.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Blink5.pollen__uses__ = function() {
        $$bind($units['test30.AvrPin'], 'pollen$used', true);
        $$bind($units['test30.Led'], 'pollen$used', true);
    }
    Blink5.$$privateInit = function() {
    }
    return Blink5;
}
var $$u = $$c();
$units['test30.Blink5'] = $$u;
$units.push($$u);

