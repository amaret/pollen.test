
/*
 * ======== MODULE test45.Test10 ========
 */

var $$c = function() {
    const Test10 = {};
    Test10.Test10 = Test10
    Test10.$name = 'test45.Test10';
    Test10.pollen$used = 0;
    Test10.test = new $$Ref('test45_Test10_test__I');
    Test10.pollen__run = new $$Ref('test45_Test10_pollen__run__E');
    Test10.targetInit = new $$Ref('test45_Test10_targetInit__I');
    Test10.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test10.pollen__uses__ = function() {
        $$bind($units['test45.M'], 'pollen$used', true);
        $$bind($units['test45.Q'], 'pollen$used', true);
    }
    Test10.$$privateInit = function() {
    }
    return Test10;
}
var $$u = $$c();
$units['test45.Test10'] = $$u;
$units.push($$u);

