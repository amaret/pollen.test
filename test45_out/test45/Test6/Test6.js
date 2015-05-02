
/*
 * ======== MODULE test45.Test6 ========
 */

var $$c = function() {
    const Test6 = {};
    Test6.Test6 = Test6
    Test6.$name = 'test45.Test6';
    Test6.pollen$used = 0;
    Test6.test = new $$Ref('test45_Test6_test__I');
    Test6.pollen__run = new $$Ref('test45_Test6_pollen__run__E');
    Test6.targetInit = new $$Ref('test45_Test6_targetInit__I');
    Test6.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test6.pollen__uses__ = function() {
        $$bind($units['test45.M'], 'pollen$used', true);
        $$bind($units['test45.Q'], 'pollen$used', true);
    }
    Test6.$$privateInit = function() {
    }
    return Test6;
}
var $$u = $$c();
$units['test45.Test6'] = $$u;
$units.push($$u);

