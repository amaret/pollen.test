
/*
 * ======== MODULE pollen.event.Dispatcher ========
 */

var $$c = function() {
    const Dispatcher = {};
    Dispatcher.Dispatcher = Dispatcher
    Dispatcher.$name = 'pollen.event.Dispatcher';
    Dispatcher.pollen$used = 0;
    Dispatcher.Event = $units['pollen.event.Event'];
    Dispatcher.EventQueue = $units['pollen.event.EventQueue'];
    Dispatcher.targetInit = new $$Ref('pollen_event_Dispatcher_targetInit__I');
    Dispatcher.post = new $$Ref('pollen_event_Dispatcher_post__E');
    Dispatcher.postFromInterrupt = new $$Ref('pollen_event_Dispatcher_postFromInterrupt__E');
    Dispatcher.run = new $$Ref('pollen_event_Dispatcher_run__E');
    Dispatcher.dispatch = new $$Ref('pollen_event_Dispatcher_dispatch__I');
    Dispatcher.$$hostInit = function() {
        var $$text = '';
        Dispatcher.events = new $units['pollen.event.EventQueue'].EventQueue('pollen_event_Dispatcher_events__V'); Dispatcher.events.new_host((Dispatcher.capacity));
        return $$text;
    }
    Dispatcher.registerEvent = function() {
        var $$text = '';
        Dispatcher.events.setCapacityOnHost(++(Dispatcher.capacity));
        $$printf("Event registered. Capacity=", (Dispatcher.capacity));
        return $$text;
    }
    Dispatcher.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['pollen.event.EventQueue'], 'pollen$used', true);
    }
    Dispatcher.$$privateInit = function() {
        Dispatcher.capacity = 5;
        Dispatcher.GI = 0;
    }
    return Dispatcher;
}
var $$u = $$c();
$units['pollen.event.Dispatcher'] = $$u;
$units.push($$u);

