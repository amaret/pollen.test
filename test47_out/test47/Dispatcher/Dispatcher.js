
/*
 * ======== MODULE test47.Dispatcher ========
 */

var $$c = function() {
    const Dispatcher = {};
    Dispatcher.Dispatcher = Dispatcher
    Dispatcher.$name = 'test47.Dispatcher';
    Dispatcher.pollen$used = 0;
    Dispatcher.Ev = $units['test47.Ev'];
    Dispatcher.EvQueue = $units['test47.EvQueue'];
    Dispatcher.post = new $$Ref('test47_Dispatcher_post__E');
    Dispatcher.run = new $$Ref('test47_Dispatcher_run__E');
    Dispatcher.targetInit = new $$Ref('test47_Dispatcher_targetInit__I');
    Dispatcher.$$hostInit = function() {
        var $$text = '';
        Dispatcher.myEventQueue = new $units['test47.EvQueue'].EvQueue('test47_Dispatcher_myEventQueue__V'); Dispatcher.myEventQueue.new_host(10);
        return $$text;
    }
    Dispatcher.pollen__uses__ = function() {
        $$bind($units['test47.Ev'], 'pollen$used', true);
        $$bind($units['test47.EvQueue'], 'pollen$used', true);
    }
    Dispatcher.$$privateInit = function() {
    }
    return Dispatcher;
}
var $$u = $$c();
$units['test47.Dispatcher'] = $$u;
$units.push($$u);

