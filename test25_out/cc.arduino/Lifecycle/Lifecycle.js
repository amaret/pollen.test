
/*
 * ======== MODULE cc.arduino.Lifecycle ========
 */

var $$c = function() {
    const Lifecycle = {};
    Lifecycle.Lifecycle = Lifecycle
    Lifecycle.$name = 'cc.arduino.Lifecycle';
    Lifecycle.pollen$used = 0;
    Lifecycle.pollen__reset = new $$Ref('cc_arduino_Lifecycle_pollen__reset__E');
    Lifecycle.pollen__ready = new $$Ref('cc_arduino_Lifecycle_pollen__ready__E');
    Lifecycle.pollen__shutdown = new $$Ref('cc_arduino_Lifecycle_pollen__shutdown__E');
    Lifecycle.pollen__hibernate = new $$Ref('cc_arduino_Lifecycle_pollen__hibernate__E');
    Lifecycle.pollen__wake = new $$Ref('cc_arduino_Lifecycle_pollen__wake__E');
    Lifecycle.pollen__free = new $$Ref('cc_arduino_Lifecycle_pollen__free__E');
    Lifecycle.targetInit = new $$Ref('cc_arduino_Lifecycle_targetInit__I');
    Lifecycle.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Lifecycle.pollen__uses__ = function() {
    }
    Lifecycle.$$privateInit = function() {
    }
    return Lifecycle;
}
var $$u = $$c();
$units['cc.arduino.Lifecycle'] = $$u;
$units.push($$u);

