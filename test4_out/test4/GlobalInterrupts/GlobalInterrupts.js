
/*
 * ======== MODULE test4.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'test4.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.disable = new $$Ref('test4_GlobalInterrupts_disable__E');
    GlobalInterrupts.enable = new $$Ref('test4_GlobalInterrupts_enable__E');
    GlobalInterrupts.targetInit = new $$Ref('test4_GlobalInterrupts_targetInit__I');
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
$units['test4.GlobalInterrupts'] = $$u;
$units.push($$u);

