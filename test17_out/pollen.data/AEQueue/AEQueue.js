
/*
 * ======== CLASS pollen.data.AEQueue ========
 */

var $$c = function() {
    const AEQueue = {};
    AEQueue.AEQueue = AEQueue
    AEQueue.$name = 'pollen.data.AEQueue';
    AEQueue.pollen$used = 0;
    AEQueue.AEQueue$$id = 1;
    AEQueue.AEQueue = function(cn) {
        this.$$id = AEQueue.AEQueue$$id++;
        this.$$cname = cn ? cn : 'pollen_data_AEQueue_AEQueue__'+this.$$id+'__S';
        this.$$tname = 'pollen_data_AEQueue_AEQueue';
        this.$$uname = 'pollen.data.AEQueue';
        this.capacity = (AEQueue.cap);
        this.head = 0;
        this.tail = 0;
        this.num = 0;
    }
    AEQueue.AEQueue.prototype = new $$Struct('pollen.data.AEQueue.AEQueue');
    AEQueue.AEQueue.prototype.$$isAggFld = {};
    AEQueue.AEQueue.prototype.$$isAggFld.capacity = false;
    AEQueue.AEQueue.prototype.$$isAggFld.elements = true;
    AEQueue.AEQueue.prototype.$$isAggFld.head = false;
    AEQueue.AEQueue.prototype.$$isAggFld.tail = false;
    AEQueue.AEQueue.prototype.$$isAggFld.num = false;
    AEQueue.AEQueue.prototype.setCapacity = function( cap ) {
        var $$text = '';
        this.capacity = (cap);
        this.$$hostInitLastPass();
        return $$text;
    }
    AEQueue.AEQueue.prototype.getCapacity = function() {
        var $$text = '';
        return(  (this.capacity)  );
        this.$$hostInitLastPass();
        return $$text;
    }
    AEQueue.AEQueue.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    AEQueue.cap = 10;
    AEQueue.pollen__uses__ = function() {
    }
    AEQueue.AEQueue.prototype.$$privateInit = function() {
        this.capacity = (AEQueue.cap);
        this.head = 0;
        this.tail = 0;
        this.num = 0;
    }
    AEQueue.AEQueue.prototype.$$hostInitLastPass = function() {
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_data_AEQueue_elements__A', false);
    }
    return AEQueue;
}
var $$u = $$c();
$units['pollen.data.AEQueue'] = $$u;
$units.push($$u);

