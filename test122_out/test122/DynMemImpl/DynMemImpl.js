
/*
 * ======== MODULE test122.DynMemImpl ========
 */

var $$c = function() {
    const DynMemImpl = {};
    DynMemImpl.DynMemImpl = DynMemImpl
    DynMemImpl.$name = 'test122.DynMemImpl';
    DynMemImpl.pollen$used = 0;
    DynMemImpl.free = new $$Ref('test122_DynMemImpl_free__E');
    DynMemImpl.malloc = new $$Ref('test122_DynMemImpl_malloc__E');
    DynMemImpl.targetInit = new $$Ref('test122_DynMemImpl_targetInit__I');
    DynMemImpl.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    DynMemImpl.pollen__uses__ = function() {
    }
    DynMemImpl.$$privateInit = function() {
    }
    return DynMemImpl;
}
var $$u = $$c();
$units['test122.DynMemImpl'] = $$u;
$units.push($$u);

