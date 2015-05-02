
/*
 * ======== MODULE test46.Test1 ========
 */

var $$c = function() {
    const Test1 = {};
    Test1.Test1 = Test1
    Test1.$name = 'test46.Test1';
    Test1.pollen$used = 0;
    Test1.Qint8 = $units['pollen.data.Qint8'];
    Test1.pollen__run = new $$Ref('test46_Test1_pollen__run__E');
    Test1.pollen__shutdown = new $$Ref('test46_Test1_pollen__shutdown__E');
    Test1.targetInit = new $$Ref('test46_Test1_targetInit__I');
    Test1.Test0 = function() {
        var $$text = '';
        (Test1.myQ) = new $units['pollen.data.Qint8'].Qint8().new_host(10);
        return $$text;
    }
    Test1.$$hostInit = function() {
        var $$text = '';
        Test1.myQ = new $units['pollen.data.Qint8'].Qint8('test46_Test1_myQ__V');
        return $$text;
    }
    Test1.pollen__uses__ = function() {
        $$bind($units['pollen.data.Qint8'], 'pollen$used', true);
    }
    Test1.$$privateInit = function() {
    }
    return Test1;
}
var $$u = $$c();
$units['test46.Test1'] = $$u;
$units.push($$u);

