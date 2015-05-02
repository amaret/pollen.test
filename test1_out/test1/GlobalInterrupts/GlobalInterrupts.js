
/*
 * ======== MODULE test1.GlobalInterrupts ========
 */

var $$c = function() {
    const GlobalInterrupts = {};
    GlobalInterrupts.GlobalInterrupts = GlobalInterrupts
    GlobalInterrupts.$name = 'test1.GlobalInterrupts';
    GlobalInterrupts.pollen$used = 0;
    GlobalInterrupts.disable = new $$Ref('test1_GlobalInterrupts_disable__E');
    GlobalInterrupts.enable = new $$Ref('test1_GlobalInterrupts_enable__E');
    GlobalInterrupts.markUsed = new $$Ref('test1_GlobalInterrupts_markUsed__E');
    GlobalInterrupts.targetInit = new $$Ref('test1_GlobalInterrupts_targetInit__I');
    GlobalInterrupts.GlobalInterupts = function() {
        var $$text = '';
        (GlobalInterrupts.hostVar) = 3;
        return $$text;
    }
    GlobalInterrupts.getHostVar = function() {
        var $$text = '';
        return(  (GlobalInterrupts.hostVar)  );
        return $$text;
    }
    GlobalInterrupts.setHostVar = function( n ) {
        var $$text = '';
        (GlobalInterrupts.hostVar) = (n);
        return $$text;
    }
    GlobalInterrupts.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    GlobalInterrupts.pollen__uses__ = function() {
        $$bind($units['test1.Cls1'], 'pollen$used', true);
    }
    GlobalInterrupts.$$privateInit = function() {
        GlobalInterrupts.hostVar = 4;
        GlobalInterrupts.giVar = 0;
    }
    return GlobalInterrupts;
}
var $$u = $$c();
$units['test1.GlobalInterrupts'] = $$u;
$units.push($$u);

