
/*
 * ======== MODULE test3.PrintTest ========
 */

var $$c = function() {
    const PrintTest = {};
    PrintTest.PrintTest = PrintTest
    PrintTest.$name = 'test3.PrintTest';
    PrintTest.pollen$used = 0;
    PrintTest.forTest = new $$Ref('test3_PrintTest_forTest__I');
    PrintTest.forTest2 = new $$Ref('test3_PrintTest_forTest2__I');
    PrintTest.pollen__run = new $$Ref('test3_PrintTest_pollen__run__E');
    PrintTest.otherTest = new $$Ref('test3_PrintTest_otherTest__I');
    PrintTest.printStr = new $$Ref('test3_PrintTest_printStr__I');
    PrintTest.targetInit = new $$Ref('test3_PrintTest_targetInit__I');
    PrintTest.hostOtherTest = function() {
        var $$text = '';
        (PrintTest.hv) = 3;
        return $$text;
    }
    PrintTest.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    PrintTest.pollen__uses__ = function() {
    }
    PrintTest.$$privateInit = function() {
        PrintTest.f1 = 0;
        PrintTest.f2 = 0;
        PrintTest.f3 = 0;
        PrintTest.hv = 0;
        PrintTest.pollen__unitname = "PrintTest";
    }
    return PrintTest;
}
var $$u = $$c();
$units['test3.PrintTest'] = $$u;
$units.push($$u);

