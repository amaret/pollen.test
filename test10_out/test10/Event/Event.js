
/*
 * ======== CLASS test10.Event ========
 */

var $$c = function() {
    const Event = {};
    Event.Event = Event
    Event.$name = 'test10.Event';
    Event.pollen$used = 0;
    Event.Event$$id = 1;
    Event.Event = function(cn) {
        this.$$id = Event.Event$$id++;
        this.$$cname = cn ? cn : 'test10_Event_Event__'+this.$$id+'__S';
        this.$$tname = 'test10_Event_Event';
        this.$$uname = 'test10.Event';
        this.code = 0;
        this.handler = 0;
    }
    Event.Event.prototype = new $$Struct('test10.Event.Event');
    Event.Event.prototype.$$isAggFld = {};
    Event.Event.prototype.$$isAggFld.code = false;
    Event.Event.prototype.$$isAggFld.handler = false;
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
    }
    Event.Event.prototype.$$hostInitLastPass = function() {
    }
    return Event;
}
var $$u = $$c();
$units['test10.Event'] = $$u;
$units.push($$u);

