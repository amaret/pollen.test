
/*
 * ======== MODULE pollen.math.Random8 ========
 */

var $$c = function() {
    const Random8 = {};
    Random8.Random8 = Random8
    Random8.$name = 'pollen.math.Random8';
    Random8.pollen$used = 0;
    Random8.srand8 = new $$Ref('pollen_math_Random8_srand8__E');
    Random8.rand8 = new $$Ref('pollen_math_Random8_rand8__E');
    Random8.rand8f = new $$Ref('pollen_math_Random8_rand8f__E');
    Random8.targetInit = new $$Ref('pollen_math_Random8_targetInit__I');
    Random8.$$hostInit = function() {
        var $$text = '';
        (Random8.seed) = 0xAC;
        (Random8.lfsr) = (Random8.seed);
        (Random8.period) = 0;
        return $$text;
    }
    Random8.pollen__uses__ = function() {
    }
    Random8.$$privateInit = function() {
        Random8.seed = 0xAC;
        Random8.lfsr = (Random8.seed);
        Random8.period = 0;
    }
    return Random8;
}
var $$u = $$c();
$units['pollen.math.Random8'] = $$u;
$units.push($$u);

