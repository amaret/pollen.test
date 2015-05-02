
/*
 * ======== MODULE test45.Test9 ========
 */

var $$c = function() {
    const Test9 = {};
    Test9.Test9 = Test9
    Test9.$name = 'test45.Test9';
    Test9.pollen$used = 0;
    Test9.test = new $$Ref('test45_Test9_test__I');
    Test9.pollen__run = new $$Ref('test45_Test9_pollen__run__E');
    Test9.targetInit = new $$Ref('test45_Test9_targetInit__I');
    Test9.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test9.pollen__uses__ = function() {
        $$bind($units['test45.M'], 'pollen$used', true);
    }
    Test9.$$privateInit = function() {
    }
    return Test9;
}
var $$u = $$c();
$units['test45.Test9'] = $$u;
$units.push($$u);

