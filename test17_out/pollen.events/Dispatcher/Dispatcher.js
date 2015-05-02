
/*
 * ======== MODULE pollen.events.Dispatcher ========
 */

var $$c = function() {
    const Dispatcher = {};
    Dispatcher.Dispatcher = Dispatcher
    Dispatcher.$name = 'pollen.events.Dispatcher';
    Dispatcher.pollen$used = 0;
    Dispatcher.AE = $units['pollen.events.AE'];
    Dispatcher.AEQueue = $units['pollen.data.AEQueue'];
    Dispatcher.post = new $$Ref('pollen_events_Dispatcher_post__E');
    Dispatcher.postFromInterrupt = new $$Ref('pollen_events_Dispatcher_postFromInterrupt__E');
    Dispatcher.run = new $$Ref('pollen_events_Dispatcher_run__E');
    Dispatcher.targetInit = new $$Ref('pollen_events_Dispatcher_targetInit__I');
    Dispatcher.bindGlobalInterrupts = function( g ) {
        var $$text = '';
        
        return $$text;
    }
    Dispatcher.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Dispatcher.pollen__uses__ = function() {
        $$bind($units['pollen.events.AE'], 'pollen$used', true);
        $$bind($units['pollen.data.AEQueue'], 'pollen$used', true);
    }
    Dispatcher.$$privateInit = function() {
    }
    return Dispatcher;
}
var $$u = $$c();
$units['pollen.events.Dispatcher'] = $$u;
$units.push($$u);

