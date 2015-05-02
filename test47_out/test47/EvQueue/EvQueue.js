
/*
 * ======== CLASS test47.EvQueue ========
 */

var $$c = function() {
    const EvQueue = {};
    EvQueue.EvQueue = EvQueue
    EvQueue.$name = 'test47.EvQueue';
    EvQueue.pollen$used = 0;
    EvQueue.E = $units['test47.Ev'];
    EvQueue.EvQueue$$id = 1;
    EvQueue.EvQueue = function(cn) {
        this.$$id = EvQueue.EvQueue$$id++;
        this.$$cname = cn ? cn : 'test47_EvQueue_EvQueue__'+this.$$id+'__S';
        this.$$tname = 'test47_EvQueue_EvQueue';
        this.$$uname = 'test47.EvQueue';
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    EvQueue.EvQueue.prototype = new $$Struct('test47.EvQueue.EvQueue');
    EvQueue.EvQueue.prototype.$$isAggFld = {};
    EvQueue.EvQueue.prototype.$$isAggFld.capacity = false;
    EvQueue.EvQueue.prototype.$$isAggFld.elements = true;
    EvQueue.EvQueue.prototype.$$isAggFld.length = false;
    EvQueue.EvQueue.prototype.$$isAggFld.head = false;
    EvQueue.EvQueue.prototype.$$isAggFld.tail = false;
    EvQueue.EvQueue.prototype.$$isAggFld.maxLength = false;
    EvQueue.EvQueue.prototype.new_host = function( max ) {
        var $$text = '';
        this.$$privateInit();
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'test47_EvQueue_elements__A', false); this.elements.$$assign((new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host(), new $units['test47.Ev'].Ev().new_host() ]));
        if (arguments.length == 1) {
                this.length = 0;
                this.head = 0;
                this.tail = 0;
                this.maxLength = (max);
        }
        this.$$hostInitLastPass();
        return this;
    }
    EvQueue.EvQueue.prototype.setCapacity = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        this.$$hostInitLastPass();
        return $$text;
    }
    EvQueue.pollen__uses__ = function() {
    }
    EvQueue.EvQueue.prototype.$$privateInit = function() {
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    EvQueue.EvQueue.prototype.$$hostInitLastPass = function() {
    }
    return EvQueue;
}
var $$u = $$c();
$units['test47.EvQueue'] = $$u;
$units.push($$u);

