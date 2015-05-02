
/*
 * ======== CLASS pollen.data.HandlerQueue ========
 */

var $$c = function() {
    const HandlerQueue = {};
    HandlerQueue.HandlerQueue = HandlerQueue
    HandlerQueue.$name = 'pollen.data.HandlerQueue';
    HandlerQueue.pollen$used = 0;
    HandlerQueue.HandlerQueue$$id = 1;
    HandlerQueue.HandlerQueue = function(cn) {
        this.$$id = HandlerQueue.HandlerQueue$$id++;
        this.$$cname = cn ? cn : 'pollen_data_HandlerQueue_HandlerQueue__'+this.$$id+'__S';
        this.$$tname = 'pollen_data_HandlerQueue_HandlerQueue';
        this.$$uname = 'pollen.data.HandlerQueue';
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
    }
    HandlerQueue.HandlerQueue.prototype = new $$Struct('pollen.data.HandlerQueue.HandlerQueue');
    HandlerQueue.HandlerQueue.prototype.$$isAggFld = {};
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.capacity = false;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.elements = true;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.length = false;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.head = false;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.tail = false;
    HandlerQueue.HandlerQueue.prototype.$$isAggFld.maxLength = false;
    HandlerQueue.HandlerQueue.prototype.new_host = function( max ) {
        var $$text = '';
        this.$$privateInit();
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_data_HandlerQueue_elements__A', false);
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
    HandlerQueue.HandlerQueue.prototype.setCapacity = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        this.$$hostInitLastPass();
        return $$text;
    }
    HandlerQueue.pollen__uses__ = function() {
    }
    HandlerQueue.HandlerQueue.prototype.$$privateInit = function() {
        this.capacity = 10;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.maxLength = 0;
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_data_HandlerQueue_elements__A', false);
    }
    HandlerQueue.HandlerQueue.prototype.$$hostInitLastPass = function() {
    }
    return HandlerQueue;
}
var $$u = $$c();
$units['pollen.data.HandlerQueue'] = $$u;
$units.push($$u);

