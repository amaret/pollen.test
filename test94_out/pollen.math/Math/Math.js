
/*
 * ======== COMPOSITION pollen.math.Math ========
 */

var $$c = function() {
    const Math = {};
    Math.Math = Math
    Math.$name = 'pollen.math.Math';
    Math.pollen$used = 0;
    Math.Absolute = $units['pollen.math.Absolute'];
    Math.FloorCeil = $units['pollen.math.FloorCeil'];
    Math.MinMax = $units['pollen.math.MinMax'];
    Math.Random8 = $units['pollen.math.Random8'];
    Math.Random16 = $units['pollen.math.Random16'];
    Math.Range = $units['pollen.math.Range'];
    return Math;
}
var $$u = $$c();
$units['pollen.math.Math'] = $$u;
$units.push($$u);

