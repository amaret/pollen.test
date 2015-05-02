
/*
 * ======== COMPOSITION test18.Environment ========
 */

var $$c = function() {
    const Environment = {};
    Environment.Environment = Environment
    Environment.$name = 'test18.Environment';
    Environment.pollen$used = 0;
    return Environment;
}
var $$u = $$c();
$units['test18.Environment'] = $$u;
$units.push($$u);

