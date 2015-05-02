
/*
 * ======== MODULE test7.T ========
 */

var $$c = function() {
    const T = {};
    T.T = T
    T.$name = 'test7.T';
    T.pollen$used = 0;
    T.Led = $units['test7.Led'];
    T.on = new $$Ref('test7_T_on__I');
    T.pollen__run = new $$Ref('test7_T_pollen__run__E');
    T.targetInit = new $$Ref('test7_T_targetInit__I');
    T.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    T.pollen__uses__ = function() {
        $$bind($units['test7.Led'], 'pollen$used', true);
    }
    T.$$privateInit = function() {
    }
    return T;
}
var $$u = $$c();
$units['test7.T'] = $$u;
$units.push($$u);

