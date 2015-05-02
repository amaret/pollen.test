
/*
 * ======== MODULE pollen.math.Random16 ========
 */

var $$c = function() {
    const Random16 = {};
    Random16.Random16 = Random16
    Random16.$name = 'pollen.math.Random16';
    Random16.pollen$used = 0;
    Random16.srand16 = new $$Ref('pollen_math_Random16_srand16__E');
    Random16.rand16 = new $$Ref('pollen_math_Random16_rand16__E');
    Random16.rand16f = new $$Ref('pollen_math_Random16_rand16f__E');
    Random16.targetInit = new $$Ref('pollen_math_Random16_targetInit__I');
    Random16.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Random16.pollen__uses__ = function() {
    }
    Random16.$$privateInit = function() {
        Random16.seed = 0xACE1;
        Random16.lfsr = (Random16.seed);
        Random16.period = 0;
    }
    return Random16;
}
var $$u = $$c();
$units['pollen.math.Random16'] = $$u;
$units.push($$u);

