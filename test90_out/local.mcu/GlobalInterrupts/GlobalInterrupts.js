
/*
 * ======== MODULE local.mcu.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'local.mcu.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.enable = new $$Ref('local_mcu_GlobalInterrupts_enable__E');
    GlobalInterrupts.disable = new $$Ref('local_mcu_GlobalInterrupts_disable__E');
    GlobalInterrupts.restore = new $$Ref('local_mcu_GlobalInterrupts_restore__E');
    GlobalInterrupts.isEnabled = new $$Ref('local_mcu_GlobalInterrupts_isEnabled__E');
    GlobalInterrupts.targetInit = new $$Ref('local_mcu_GlobalInterrupts_targetInit__I');
    GlobalInterrupts.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    GlobalInterrupts.pollen__uses__ = function() {
    }
    GlobalInterrupts.$$privateInit = function() {
        GlobalInterrupts.enabled = false;
    }
    return GlobalInterrupts;
}
var $$u = $$c();
$units['local.mcu.GlobalInterrupts'] = $$u;
$units.push($$u);

