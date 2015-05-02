
/*
 * ======== MODULE test6.T ========
 */

var $$c = function() {
    const T = {};
    T.T = T
    T.$name = 'test6.T';
    T.pollen$used = 0;
    T.Y = $units['test6.Y'];
    T.Led1 = $units['test6.Led1'];
    T.Led2 = $units['test6.Led2'];
    T.pollen__run = new $$Ref('test6_T_pollen__run__E');
    T.on = new $$Ref('test6_T_on__I');
    T.targetInit = new $$Ref('test6_T_targetInit__I');
    T.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    T.pollen__uses__ = function() {
        $$bind($units['test6.Y'], 'pollen$used', true);
        $$bind($units['test6.Led1'], 'pollen$used', true);
        $$bind($units['test6.Led2'], 'pollen$used', true);
    }
    T.$$privateInit = function() {
    }
    return T;
}
var $$u = $$c();
$units['test6.T'] = $$u;
$units.push($$u);

