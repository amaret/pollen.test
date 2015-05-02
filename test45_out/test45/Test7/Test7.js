
/*
 * ======== MODULE test45.Test7 ========
 */

var $$c = function() {
    const Test7 = {};
    Test7.Test7 = Test7
    Test7.$name = 'test45.Test7';
    Test7.pollen$used = 0;
    Test7.test = new $$Ref('test45_Test7_test__I');
    Test7.pollen__run = new $$Ref('test45_Test7_pollen__run__E');
    Test7.targetInit = new $$Ref('test45_Test7_targetInit__I');
    Test7.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test7.pollen__uses__ = function() {
        $$bind($units['test45.M'], 'pollen$used', true);
    }
    Test7.$$privateInit = function() {
    }
    return Test7;
}
var $$u = $$c();
$units['test45.Test7'] = $$u;
$units.push($$u);

