
/*
 * ======== COMPOSITION test45.C1 ========
 */

var $$c = function() {
    const C1 = {};
    C1.C1 = C1
    C1.$name = 'test45.C1';
    C1.pollen$used = 0;
    C1.N = $units['test45.M'];
    return C1;
}
var $$u = $$c();
$units['test45.C1'] = $$u;
$units.push($$u);

