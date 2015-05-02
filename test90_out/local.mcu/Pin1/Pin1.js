
/*
 * ======== MODULE local.mcu.Pin1 ========
 */

var $$c = function() {
    const Pin1 = {};
    Pin1.Pin1 = Pin1
    Pin1.$name = 'local.mcu.Pin1';
    Pin1.pollen$used = 0;
    Pin1.targetInit = new $$Ref('local_mcu_Pin1_targetInit__I');
    Pin1.set = new $$Ref('local_mcu_Pin1_set__E');
    Pin1.clear = new $$Ref('local_mcu_Pin1_clear__E');
    Pin1.toggle = new $$Ref('local_mcu_Pin1_toggle__E');
    Pin1.get = new $$Ref('local_mcu_Pin1_get__E');
    Pin1.makeInput = new $$Ref('local_mcu_Pin1_makeInput__E');
    Pin1.isInput = new $$Ref('local_mcu_Pin1_isInput__E');
    Pin1.makeOutput = new $$Ref('local_mcu_Pin1_makeOutput__E');
    Pin1.isOutput = new $$Ref('local_mcu_Pin1_isOutput__E');
    Pin1.pname = "Pin";
    Pin1.pnum = 1;
    Pin1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Pin1.pollen__uses__ = function() {
    }
    Pin1.$$privateInit = function() {
        Pin1.name = null;
        Pin1.num = 0;
        Pin1.state = 0;
        Pin1.input = 0;
        Pin1.pollen__unitname = "Pin1";
    }
    return Pin1;
}
var $$u = $$c();
$units['local.mcu.Pin1'] = $$u;
$units.push($$u);

