
/*
 * ======== MODULE x2.x ========
 */

var $$c = function() {
    const x = {};
    x.x = x
    x.$name = 'x2.x';
    x.pollen$used = 0;
    x.z = $units['yy.z'];
    x.pollen__run = new $$Ref('x2_x_pollen__run__E');
    x.targetInit = new $$Ref('x2_x_targetInit__I');
    x.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    x.pollen__uses__ = function() {
        $$bind($units['yy.z'], 'pollen$used', true);
    }
    x.$$privateInit = function() {
    }
    return x;
}
var $$u = $$c();
$units['x2.x'] = $$u;
$units.push($$u);

