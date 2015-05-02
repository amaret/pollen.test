
/*
 * ======== COMPOSITION test4.Environment ========
 */

var $$c = function() {
    const Environment = {};
    Environment.Environment = Environment
    Environment.$name = 'test4.Environment';
    Environment.pollen$used = 0;
    Environment.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    return Environment;
}
var $$u = $$c();
$units['test4.Environment'] = $$u;
$units.push($$u);

