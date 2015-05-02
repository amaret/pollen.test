
/*
 * ======== MODULE test45.M ========
 */

var $$c = function() {
    const M = {};
    M.M = M
    M.$name = 'test45.M';
    M.pollen$used = 0;
    M.foo = new $$Ref('test45_M_foo__E');
    M.bar = new $$Ref('test45_M_bar__E');
    M.targetInit = new $$Ref('test45_M_targetInit__I');
    M.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    M.pollen__uses__ = function() {
    }
    M.$$privateInit = function() {
    }
    return M;
}
var $$u = $$c();
$units['test45.M'] = $$u;
$units.push($$u);

