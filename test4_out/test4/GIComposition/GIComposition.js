
/*
 * ======== COMPOSITION test4.GIComposition ========
 */

var $$c = function() {
    const GIComposition = {};
    GIComposition.GIComposition = GIComposition
    GIComposition.$name = 'test4.GIComposition';
    GIComposition.pollen$used = 0;
    GIComposition.GlobalInterrupts = $units['test4.GlobalInterrupts'];
    GIComposition.OtherI = $units['test4.OtherInterrupts'];
    GIComposition.AsInterrupts2 = $units['test4.OtherInterrupts'];
    return GIComposition;
}
var $$u = $$c();
$units['test4.GIComposition'] = $$u;
$units.push($$u);

