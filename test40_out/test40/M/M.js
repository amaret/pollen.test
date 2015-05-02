
/*
 * ======== MODULE test40.M ========
 */

var $$c = function() {
    const M = {};
    M.M = M
    M.$name = 'test40.M';
    M.pollen$used = 0;
    M.targetInit = new $$Ref('test40_M_targetInit__I');
    M.get = new $$Ref('test40_M_get__E');
    M.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    M.pollen__uses__ = function() {
    }
    M.$$privateInit = function() {
        M.t = 0;
    }
    return M;
}
var $$u = $$c();
$units['test40.M'] = $$u;
$units.push($$u);

