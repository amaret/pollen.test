
/*
 * ======== MODULE test122.SleepWakeImpl ========
 */

var $$c = function() {
    const SleepWakeImpl = {};
    SleepWakeImpl.SleepWakeImpl = SleepWakeImpl
    SleepWakeImpl.$name = 'test122.SleepWakeImpl';
    SleepWakeImpl.pollen$used = 0;
    SleepWakeImpl.sleep = new $$Ref('test122_SleepWakeImpl_sleep__E');
    SleepWakeImpl.wake = new $$Ref('test122_SleepWakeImpl_wake__E');
    SleepWakeImpl.targetInit = new $$Ref('test122_SleepWakeImpl_targetInit__I');
    SleepWakeImpl.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    SleepWakeImpl.pollen__uses__ = function() {
    }
    SleepWakeImpl.$$privateInit = function() {
    }
    return SleepWakeImpl;
}
var $$u = $$c();
$units['test122.SleepWakeImpl'] = $$u;
$units.push($$u);

