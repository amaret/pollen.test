
/*
 * ======== MODULE test4.OtherInterrupts ========
 */

var $$c = function() {
    const OtherInterrupts = {};
    OtherInterrupts.OtherInterrupts = OtherInterrupts
    OtherInterrupts.$name = 'test4.OtherInterrupts';
    OtherInterrupts.pollen$used = 0;
    OtherInterrupts.disable = new $$Ref('test4_OtherInterrupts_disable__E');
    OtherInterrupts.enable = new $$Ref('test4_OtherInterrupts_enable__E');
    OtherInterrupts.other_disable = new $$Ref('test4_OtherInterrupts_other_disable__E');
    OtherInterrupts.other_enable = new $$Ref('test4_OtherInterrupts_other_enable__E');
    OtherInterrupts.targetInit = new $$Ref('test4_OtherInterrupts_targetInit__I');
    OtherInterrupts.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    OtherInterrupts.pollen__uses__ = function() {
    }
    OtherInterrupts.$$privateInit = function() {
    }
    return OtherInterrupts;
}
var $$u = $$c();
$units['test4.OtherInterrupts'] = $$u;
$units.push($$u);

