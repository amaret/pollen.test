
/*
 * ======== MODULE local.mcu.Pin2 ========
 */

var $$c = function() {
    const Pin2 = {};
    Pin2.Pin2 = Pin2
    Pin2.$name = 'local.mcu.Pin2';
    Pin2.pollen$used = 0;
    Pin2.targetInit = new $$Ref('local_mcu_Pin2_targetInit__I');
    Pin2.set = new $$Ref('local_mcu_Pin2_set__E');
    Pin2.clear = new $$Ref('local_mcu_Pin2_clear__E');
    Pin2.toggle = new $$Ref('local_mcu_Pin2_toggle__E');
    Pin2.get = new $$Ref('local_mcu_Pin2_get__E');
    Pin2.makeInput = new $$Ref('local_mcu_Pin2_makeInput__E');
    Pin2.isInput = new $$Ref('local_mcu_Pin2_isInput__E');
    Pin2.makeOutput = new $$Ref('local_mcu_Pin2_makeOutput__E');
    Pin2.isOutput = new $$Ref('local_mcu_Pin2_isOutput__E');
    Pin2.pname = "Pin";
    Pin2.pnum = 2;
    Pin2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Pin2.pollen__uses__ = function() {
    }
    Pin2.$$privateInit = function() {
        Pin2.name = null;
        Pin2.num = 0;
        Pin2.state = 0;
        Pin2.input = 0;
        Pin2.pollen__unitname = "Pin2";
    }
    return Pin2;
}
var $$u = $$c();
$units['local.mcu.Pin2'] = $$u;
$units.push($$u);

