
/*
 * ======== MODULE local.parts.ColorLed ========
 */

var $$c = function() {
    const ColorLed = {};
    ColorLed.ColorLed = ColorLed
    ColorLed.$name = 'local.parts.ColorLed';
    ColorLed.pollen$used = 0;
    ColorLed.LedState = $units['bijou.parts.LedState'];
    ColorLed.SendOsc = $units['local.output.SendOsc'];
    ColorLed.targetInit = new $$Ref('local_parts_ColorLed_targetInit__I');
    ColorLed.setState = new $$Ref('local_parts_ColorLed_setState__E');
    ColorLed.setRGBA = new $$Ref('local_parts_ColorLed_setRGBA__E');
    ColorLed.setRGB = new $$Ref('local_parts_ColorLed_setRGB__E');
    ColorLed.getRGB = new $$Ref('local_parts_ColorLed_getRGB__E');
    ColorLed.getRGBA = new $$Ref('local_parts_ColorLed_getRGBA__E');
    ColorLed.doSetColor = new $$Ref('local_parts_ColorLed_doSetColor__I');
    ColorLed.$$hostInit = function() {
        var $$text = '';
        ColorLed.state = new $units['bijou.parts.LedState'].LedState('local_parts_ColorLed_state__V'); ColorLed.state.new_host(0);
        return $$text;
    }
    ColorLed.pollen__uses__ = function() {
        $$bind($units['bijou.parts.LedState'], 'pollen$used', true);
        $$bind($units['local.output.SendOsc'], 'pollen$used', true);
    }
    ColorLed.$$privateInit = function() {
    }
    return ColorLed;
}
var $$u = $$c();
$units['local.parts.ColorLed'] = $$u;
$units.push($$u);

