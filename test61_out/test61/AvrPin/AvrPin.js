
/*
 * ======== MODULE test61.AvrPin ========
 */

var $$c = function() {
    const AvrPin = {};
    AvrPin.AvrPin = AvrPin
    AvrPin.$name = 'test61.AvrPin';
    AvrPin.pollen$used = 0;
    AvrPin.set = new $$Ref('test61_AvrPin_set__E');
    AvrPin.clear = new $$Ref('test61_AvrPin_clear__E');
    AvrPin.toggle = new $$Ref('test61_AvrPin_toggle__E');
    AvrPin.get = new $$Ref('test61_AvrPin_get__E');
    AvrPin.makeInput = new $$Ref('test61_AvrPin_makeInput__E');
    AvrPin.isInput = new $$Ref('test61_AvrPin_isInput__E');
    AvrPin.makeOutput = new $$Ref('test61_AvrPin_makeOutput__E');
    AvrPin.isOutput = new $$Ref('test61_AvrPin_isOutput__E');
    AvrPin.targetInit = new $$Ref('test61_AvrPin_targetInit__I');
    AvrPin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    AvrPin.pollen__uses__ = function() {
    }
    AvrPin.$$privateInit = function() {
        AvrPin.PORTB = 0;
        AvrPin.DDRB = 0;
    }
    return AvrPin;
}
var $$u = $$c();
$units['test61.AvrPin'] = $$u;
$units.push($$u);

