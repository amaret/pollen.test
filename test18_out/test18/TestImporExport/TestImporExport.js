
/*
 * ======== MODULE test18.TestImporExport ========
 */

var $$c = function() {
    const TestImporExport = {};
    TestImporExport.TestImporExport = TestImporExport
    TestImporExport.$name = 'test18.TestImporExport';
    TestImporExport.pollen$used = 0;
    TestImporExport.pollen__run = new $$Ref('test18_TestImporExport_pollen__run__E');
    TestImporExport.pollen__reset = new $$Ref('test18_TestImporExport_pollen__reset__E');
    TestImporExport.targetInit = new $$Ref('test18_TestImporExport_targetInit__I');
    TestImporExport.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    TestImporExport.pollen__uses__ = function() {
        $$bind($units['test18.Atmega328p'], 'pollen$used', true);
        $$bind($units['test18.GlobalInterrupts'], 'pollen$used', true);
    }
    TestImporExport.$$privateInit = function() {
    }
    return TestImporExport;
}
var $$u = $$c();
$units['test18.TestImporExport'] = $$u;
$units.push($$u);

