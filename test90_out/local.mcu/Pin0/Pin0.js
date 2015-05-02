
/*
 * ======== MODULE local.mcu.Pin0 ========
 */

var $$c = function() {
    const Pin0 = {};
    Pin0.Pin0 = Pin0
    Pin0.$name = 'local.mcu.Pin0';
    Pin0.pollen$used = 0;
    Pin0.targetInit = new $$Ref('local_mcu_Pin0_targetInit__I');
    Pin0.set = new $$Ref('local_mcu_Pin0_set__E');
    Pin0.clear = new $$Ref('local_mcu_Pin0_clear__E');
    Pin0.toggle = new $$Ref('local_mcu_Pin0_toggle__E');
    Pin0.get = new $$Ref('local_mcu_Pin0_get__E');
    Pin0.makeInput = new $$Ref('local_mcu_Pin0_makeInput__E');
    Pin0.isInput = new $$Ref('local_mcu_Pin0_isInput__E');
    Pin0.makeOutput = new $$Ref('local_mcu_Pin0_makeOutput__E');
    Pin0.isOutput = new $$Ref('local_mcu_Pin0_isOutput__E');
    Pin0.pname = "Pin";
    Pin0.pnum = 0;
    Pin0.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Pin0.pollen__uses__ = function() {
    }
    Pin0.$$privateInit = function() {
        Pin0.name = null;
        Pin0.num = 0;
        Pin0.state = 0;
        Pin0.input = 0;
        Pin0.pollen__unitname = "Pin0";
    }
    return Pin0;
}
var $$u = $$c();
$units['local.mcu.Pin0'] = $$u;
$units.push($$u);

