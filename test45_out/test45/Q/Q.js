
/*
 * ======== MODULE test45.Q ========
 */

var $$c = function() {
    const Q = {};
    Q.Q = Q
    Q.$name = 'test45.Q';
    Q.pollen$used = 0;
    Q.cycle = new $$Ref('test45_Q_cycle__E');
    Q.reset = new $$Ref('test45_Q_reset__E');
    Q.targetInit = new $$Ref('test45_Q_targetInit__I');
    Q.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Q.pollen__uses__ = function() {
    }
    Q.$$privateInit = function() {
    }
    return Q;
}
var $$u = $$c();
$units['test45.Q'] = $$u;
$units.push($$u);

