
/*
 * ======== MODULE test29.AvrPin ========
 */

var $$c = function() {
    const AvrPin = {};
    AvrPin.AvrPin = AvrPin
    AvrPin.$name = 'test29.AvrPin';
    AvrPin.pollen$used = 0;
    AvrPin.set = new $$Ref('test29_AvrPin_set__E');
    AvrPin.clear = new $$Ref('test29_AvrPin_clear__E');
    AvrPin.toggle = new $$Ref('test29_AvrPin_toggle__E');
    AvrPin.get = new $$Ref('test29_AvrPin_get__E');
    AvrPin.makeInput = new $$Ref('test29_AvrPin_makeInput__E');
    AvrPin.isInput = new $$Ref('test29_AvrPin_isInput__E');
    AvrPin.makeOutput = new $$Ref('test29_AvrPin_makeOutput__E');
    AvrPin.isOutput = new $$Ref('test29_AvrPin_isOutput__E');
    AvrPin.targetInit = new $$Ref('test29_AvrPin_targetInit__I');
    AvrPin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    AvrPin.pollen__uses__ = function() {
    }
    AvrPin.$$privateInit = function() {
    }
    return AvrPin;
}
var $$u = $$c();
$units['test29.AvrPin'] = $$u;
$units.push($$u);

