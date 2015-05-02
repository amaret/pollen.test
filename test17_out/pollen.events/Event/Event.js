
/*
 * ======== CLASS pollen.events.Event ========
 */

var $$c = function() {
    const Event = {};
    Event.Event = Event
    Event.$name = 'pollen.events.Event';
    Event.pollen$used = 0;
    Event.Event$$id = 1;
    Event.Event = function(cn) {
        this.$$id = Event.Event$$id++;
        this.$$cname = cn ? cn : 'pollen_events_Event_Event__'+this.$$id+'__S';
        this.$$tname = 'pollen_events_Event_Event';
        this.$$uname = 'pollen.events.Event';
        this.priority = 0;
        this.handler = null;
        this.data = 0;
    }
    Event.Event.prototype = new $$Struct('pollen.events.Event.Event');
    Event.Event.prototype.$$isAggFld = {};
    Event.Event.prototype.$$isAggFld.priority = false;
    Event.Event.prototype.$$isAggFld.handler = false;
    Event.Event.prototype.$$isAggFld.data = false;
    Event.Event.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Event.pollen__uses__ = function() {
    }
    Event.Event.prototype.$$privateInit = function() {
        this.priority = 0;
        this.handler = null;
        this.data = 0;
    }
    Event.Event.prototype.$$hostInitLastPass = function() {
    }
    return Event;
}
var $$u = $$c();
$units['pollen.events.Event'] = $$u;
$units.push($$u);

