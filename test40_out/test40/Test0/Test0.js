
/*
 * ======== MODULE test40.Test0 ========
 */

var $$c = function() {
    const Test0 = {};
    Test0.Test0 = Test0
    Test0.$name = 'test40.Test0';
    Test0.pollen$used = 0;
    Test0.M = $units['test40.M'];
    Test0.pollen__run = new $$Ref('test40_Test0_pollen__run__E');
    Test0.pollen__shutdown = new $$Ref('test40_Test0_pollen__shutdown__E');
    Test0.targetInit = new $$Ref('test40_Test0_targetInit__I');
    Test0.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Test0.pollen__uses__ = function() {
        $$bind($units['test40.M'], 'pollen$used', true);
    }
    Test0.$$privateInit = function() {
    }
    return Test0;
}
var $$u = $$c();
$units['test40.Test0'] = $$u;
$units.push($$u);

