
/*
 * ======== CLASS pollen.event.Event ========
 */

var $$c = function() {
    const Event = {};
    Event.Event = Event
    Event.$name = 'pollen.event.Event';
    Event.pollen$used = 0;
    Event.Event$$id = 1;
    Event.Event = function(cn) {
        this.$$id = Event.Event$$id++;
        this.$$cname = cn ? cn : 'pollen_event_Event_Event__'+this.$$id+'__S';
        this.$$tname = 'pollen_event_Event_Event';
        this.$$uname = 'pollen.event.Event';
        this.eventHandler = 0;
    }
    Event.Event.prototype = new $$Struct('pollen.event.Event.Event');
    Event.Event.prototype.$$isAggFld = {};
    Event.Event.prototype.$$isAggFld.eventHandler = false;
    Event.Event.prototype.new_host = function( h ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                this.eventHandler = (h);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Event.Event.prototype.setHandlerOnHost = function( h ) {
        var $$text = '';
        (this.eventHandler) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    Event.pollen__uses__ = function() {
    }
    Event.Event.prototype.$$privateInit = function() {
    }
    Event.Event.prototype.$$hostInitLastPass = function() {
    }
    return Event;
}
var $$u = $$c();
$units['pollen.event.Event'] = $$u;
$units.push($$u);

