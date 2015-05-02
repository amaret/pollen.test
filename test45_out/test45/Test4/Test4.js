
/*
 * ======== MODULE test45.Test4 ========
 */

var $$c = function() {
    const Test4 = {};
    Test4.Test4 = Test4
    Test4.$name = 'test45.Test4';
    Test4.pollen$used = 0;
    Test4.test = new $$Ref('test45_Test4_test__I');
    Test4.pollen__run = new $$Ref('test45_Test4_pollen__run__E');
    Test4.targetInit = new $$Ref('test45_Test4_targetInit__I');
    Test4.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test4.pollen__uses__ = function() {
        $$bind($units['test45.N'], 'pollen$used', true);
    }
    Test4.$$privateInit = function() {
    }
    return Test4;
}
var $$u = $$c();
$units['test45.Test4'] = $$u;
$units.push($$u);

