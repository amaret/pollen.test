
/*
 * ======== MODULE virtual.mcu.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'virtual.mcu.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.enable = new $$Ref('virtual_mcu_GlobalInterrupts_enable__E');
    GlobalInterrupts.disable = new $$Ref('virtual_mcu_GlobalInterrupts_disable__E');
    GlobalInterrupts.targetInit = new $$Ref('virtual_mcu_GlobalInterrupts_targetInit__I');
    GlobalInterrupts.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    GlobalInterrupts.pollen__uses__ = function() {
    }
    GlobalInterrupts.$$privateInit = function() {
    }
    return GlobalInterrupts;
}
var $$u = $$c();
$units['virtual.mcu.GlobalInterrupts'] = $$u;
$units.push($$u);

