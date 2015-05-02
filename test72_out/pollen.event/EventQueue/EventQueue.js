
/*
 * ======== CLASS pollen.event.EventQueue ========
 */

var $$c = function() {
    const EventQueue = {};
    EventQueue.EventQueue = EventQueue
    EventQueue.$name = 'pollen.event.EventQueue';
    EventQueue.pollen$used = 0;
    EventQueue.Event = $units['pollen.event.Event'];
    EventQueue.EventQueue$$id = 1;
    EventQueue.EventQueue = function(cn) {
        this.$$id = EventQueue.EventQueue$$id++;
        this.$$cname = cn ? cn : 'pollen_event_EventQueue_EventQueue__'+this.$$id+'__S';
        this.$$tname = 'pollen_event_EventQueue_EventQueue';
        this.$$uname = 'pollen.event.EventQueue';
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    EventQueue.EventQueue.prototype = new $$Struct('pollen.event.EventQueue.EventQueue');
    EventQueue.EventQueue.prototype.$$isAggFld = {};
    EventQueue.EventQueue.prototype.$$isAggFld.capacity = false;
    EventQueue.EventQueue.prototype.$$isAggFld.elements = true;
    EventQueue.EventQueue.prototype.$$isAggFld.length = false;
    EventQueue.EventQueue.prototype.$$isAggFld.head = false;
    EventQueue.EventQueue.prototype.$$isAggFld.tail = false;
    EventQueue.EventQueue.prototype.$$isAggFld.maxLength = false;
    EventQueue.EventQueue.prototype.new_host = function( max ) {
        var $$text = '';
        this.$$privateInit();
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_event_EventQueue_elements__A', false); this.elements.$$assign((new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null, null, null, null, null, null, null, null ]));
        if (arguments.length == 1) {
                this.length = 0;
                this.head = 0;
                this.tail = 0;
                this.maxLength = (max);
                if ((max) > this.capacity) {
            this.capacity = (max);
        }
        }
        this.$$hostInitLastPass();
        return this;
    }
    EventQueue.EventQueue.prototype.setCapacityOnHost = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        this.$$hostInitLastPass();
        return $$text;
    }
    EventQueue.pollen__uses__ = function() {
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
    }
    EventQueue.EventQueue.prototype.$$privateInit = function() {
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_event_EventQueue_elements__A', false); this.elements.$$assign((new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ null, null, null, null, null, null, null, null, null, null ]));
    }
    EventQueue.EventQueue.prototype.$$hostInitLastPass = function() {
    }
    return EventQueue;
}
var $$u = $$c();
$units['pollen.event.EventQueue'] = $$u;
$units.push($$u);

