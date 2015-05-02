
/*
 * ======== MODULE test18.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'test18.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.disable = new $$Ref('test18_GlobalInterrupts_disable__E');
    GlobalInterrupts.enable = new $$Ref('test18_GlobalInterrupts_enable__E');
    GlobalInterrupts.restore = new $$Ref('test18_GlobalInterrupts_restore__E');
    GlobalInterrupts.targetInit = new $$Ref('test18_GlobalInterrupts_targetInit__I');
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
$units['test18.GlobalInterrupts'] = $$u;
$units.push($$u);

