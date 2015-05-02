
/*
 * ======== COMPOSITION test42.TestComp ========
 */

var $$c = function() {
    const TestComp = {};
    TestComp.TestComp = TestComp
    TestComp.$name = 'test42.TestComp';
    TestComp.pollen$used = 0;
    TestComp.TestMod = $units['test42.TestMod'];
    return TestComp;
}
var $$u = $$c();
$units['test42.TestComp'] = $$u;
$units.push($$u);

