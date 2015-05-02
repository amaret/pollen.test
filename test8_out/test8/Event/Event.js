
/*
 * ======== CLASS test8.Event ========
 */

var $$c = function() {
    const Event = {};
    Event.Event = Event
    Event.$name = 'test8.Event';
    Event.pollen$used = 0;
    Event.Event$$id = 1;
    Event.Event = function(cn) {
        this.$$id = Event.Event$$id++;
        this.$$cname = cn ? cn : 'test8_Event_Event__'+this.$$id+'__S';
        this.$$tname = 'test8_Event_Event';
        this.$$uname = 'test8.Event';
        this.code = 0;
        this.handler = 0;
        this.pollen__unitname = "Event";
    }
    Event.Event.prototype = new $$Struct('test8.Event.Event');
    Event.Event.prototype.$$isAggFld = {};
    Event.Event.prototype.$$isAggFld.code = false;
    Event.Event.prototype.$$isAggFld.handler = false;
    Event.Event.prototype.$$isAggFld.pollen__unitname = false;
    Event.Event.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Event.pollen__uses__ = function() {
    }
    Event.Event.prototype.$$privateInit = function() {
        this.code = 0;
        this.pollen__unitname = "Event";
    }
    Event.Event.prototype.$$hostInitLastPass = function() {
    }
    return Event;
}
var $$u = $$c();
$units['test8.Event'] = $$u;
$units.push($$u);

