
/*
 * ======== COMPOSITION test34.TestComp ========
 */

var $$c = function() {
    const TestComp = {};
    TestComp.TestComp = TestComp
    TestComp.$name = 'test34.TestComp';
    TestComp.pollen$used = 0;
    TestComp.TestMod = $units['test34.TestMod'];
    return TestComp;
}
var $$u = $$c();
$units['test34.TestComp'] = $$u;
$units.push($$u);

