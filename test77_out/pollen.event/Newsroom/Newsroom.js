
/*
 * ======== MODULE pollen.event.Newsroom ========
 */

var $$c = function() {
    const Newsroom = {};
    Newsroom.Newsroom = Newsroom
    Newsroom.$name = 'pollen.event.Newsroom';
    Newsroom.pollen$used = 0;
    Newsroom.Event = $units['pollen.event.Event'];
    Newsroom.EventQueue = $units['pollen.event.EventQueue'];
    Newsroom.targetInit = new $$Ref('pollen_event_Newsroom_targetInit__I');
    Newsroom.post = new $$Ref('pollen_event_Newsroom_post__E');
    Newsroom.postFromInterrupt = new $$Ref('pollen_event_Newsroom_postFromInterrupt__E');
    Newsroom.run = new $$Ref('pollen_event_Newsroom_run__E');
    Newsroom.dispatch = new $$Ref('pollen_event_Newsroom_dispatch__I');
    Newsroom.$$hostInit = function() {
        var $$text = '';
        Newsroom.events = new $units['pollen.event.EventQueue'].EventQueue('pollen_event_Newsroom_events__V'); Newsroom.events.new_host(0);
        return $$text;
    }
    Newsroom.registerEventOnHost = function() {
        var $$text = '';
        Newsroom.events.setCapacityOnHost(Newsroom.events.getCapacityOnHost() + 1);
        $$printf("Newsroom event registered. Event capacity = ", Newsroom.events.getCapacityOnHost(), "\n");
        return $$text;
    }
    Newsroom.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['pollen.event.EventQueue'], 'pollen$used', true);
    }
    Newsroom.$$privateInit = function() {
        Newsroom.GI = 0;
    }
    return Newsroom;
}
var $$u = $$c();
$units['pollen.event.Newsroom'] = $$u;
$units.push($$u);

