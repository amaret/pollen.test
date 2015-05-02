
/*
 * ======== MODULE test84.MPT2 ========
 */

var $$c = function() {
    const MPT2 = {};
    MPT2.MPT2 = MPT2
    MPT2.$name = 'test84.MPT2';
    MPT2.pollen$used = 0;
    MPT2.foo = new $$Ref('test84_MPT2_foo__E');
    MPT2.targetInit = new $$Ref('test84_MPT2_targetInit__I');
    MPT2.port = 0;
    MPT2.pin = 2;
    MPT2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    MPT2.pollen__uses__ = function() {
    }
    MPT2.$$privateInit = function() {
    }
    return MPT2;
}
var $$u = $$c();
$units['test84.MPT2'] = $$u;
$units.push($$u);

