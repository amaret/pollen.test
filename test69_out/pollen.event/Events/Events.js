
/*
 * ======== MODULE pollen.event.Events ========
 */

var $$c = function() {
    const Events = {};
    Events.Events = Events
    Events.$name = 'pollen.event.Events';
    Events.pollen$used = 0;
    Events.CP = $units['virtual.mcu.ConsolePrint'];
    Events.Event$$id = 1;
    Events.Event = function(cn) {
        this.$$id = Events.Event$$id++;
        this.$$cname = cn ? cn : 'pollen_event_Events_Event__'+this.$$id+'__S';
        this.$$tname = 'pollen_event_Events_Event';
        this.$$uname = 'pollen.event.Events';
        this.handler = 0;
    }
    Events.Event.prototype = new $$Struct('pollen.event.Events.Event');
    Events.Event.prototype.$$isAggFld = {};
    Events.Event.prototype.$$isAggFld.handler = false;
    Events.Event.prototype.new_host = function( h ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                $$printf("in Event new_host\n");
                Events.registerEvent();
                (this.handler) = (h);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Events.Event.prototype.setHandlerOnHost = function( h ) {
        var $$text = '';
        (this.handler) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    Events.Event.prototype.$$privateInit = function() {
    }
    Events.Event.prototype.$$hostInitLastPass = function() {
    }
    Events.targetInit = new $$Ref('pollen_event_Events_targetInit__I');
    Events.test = new $$Ref('pollen_event_Events_test__E');
    Events.$$hostInit = function() {
        var $$text = '';
        $$printf("in Events(), numEvents=", (Events.numEvents), "\n");
        return $$text;
    }
    Events.registerEvent = function() {
        var $$text = '';
        $$printf("in registerEvent(), numEvents=", (Events.numEvents), "\n");
        ++(Events.numEvents);
        $$printf("in registerEvent(), Event Registered: ", (Events.numEvents), " \n");
        return $$text;
    }
    Events.pollen__uses__ = function() {
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
    }
    Events.$$privateInit = function() {
        Events.numEvents = 0;
    }
    return Events;
}
var $$u = $$c();
$units['pollen.event.Events'] = $$u;
$units.push($$u);

