
/*
 * ======== MODULE test28.MspPin ========
 */

var $$c = function() {
    const MspPin = {};
    MspPin.MspPin = MspPin
    MspPin.$name = 'test28.MspPin';
    MspPin.pollen$used = 0;
    MspPin.set = new $$Ref('test28_MspPin_set__E');
    MspPin.clear = new $$Ref('test28_MspPin_clear__E');
    MspPin.toggle = new $$Ref('test28_MspPin_toggle__E');
    MspPin.get = new $$Ref('test28_MspPin_get__E');
    MspPin.makeInput = new $$Ref('test28_MspPin_makeInput__E');
    MspPin.isInput = new $$Ref('test28_MspPin_isInput__E');
    MspPin.makeOutput = new $$Ref('test28_MspPin_makeOutput__E');
    MspPin.isOutput = new $$Ref('test28_MspPin_isOutput__E');
    MspPin.targetInit = new $$Ref('test28_MspPin_targetInit__I');
    MspPin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    MspPin.pollen__uses__ = function() {
    }
    MspPin.$$privateInit = function() {
    }
    return MspPin;
}
var $$u = $$c();
$units['test28.MspPin'] = $$u;
$units.push($$u);

