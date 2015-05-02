
/*
 * ======== MODULE test45.Test1 ========
 */

var $$c = function() {
    const Test1 = {};
    Test1.Test1 = Test1
    Test1.$name = 'test45.Test1';
    Test1.pollen$used = 0;
    Test1.test1 = new $$Ref('test45_Test1_test1__I');
    Test1.pollen__run = new $$Ref('test45_Test1_pollen__run__E');
    Test1.targetInit = new $$Ref('test45_Test1_targetInit__I');
    Test1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test1.pollen__uses__ = function() {
        $$bind($units['test45.M'], 'pollen$used', true);
    }
    Test1.$$privateInit = function() {
    }
    return Test1;
}
var $$u = $$c();
$units['test45.Test1'] = $$u;
$units.push($$u);

