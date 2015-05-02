
/*
 * ======== CLASS pollen.data.Qint8 ========
 */

var $$c = function() {
    const Qint8 = {};
    Qint8.Qint8 = Qint8
    Qint8.$name = 'pollen.data.Qint8';
    Qint8.pollen$used = 0;
    Qint8.Qint8$$id = 1;
    Qint8.Qint8 = function(cn) {
        this.$$id = Qint8.Qint8$$id++;
        this.$$cname = cn ? cn : 'pollen_data_Qint8_Qint8__'+this.$$id+'__S';
        this.$$tname = 'pollen_data_Qint8_Qint8';
        this.$$uname = 'pollen.data.Qint8';
        this.capacity = 0;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
    }
    Qint8.Qint8.prototype = new $$Struct('pollen.data.Qint8.Qint8');
    Qint8.Qint8.prototype.$$isAggFld = {};
    Qint8.Qint8.prototype.$$isAggFld.capacity = false;
    Qint8.Qint8.prototype.$$isAggFld.elements = true;
    Qint8.Qint8.prototype.$$isAggFld.length = false;
    Qint8.Qint8.prototype.$$isAggFld.head = false;
    Qint8.Qint8.prototype.$$isAggFld.tail = false;
    Qint8.Qint8.prototype.new_host = function( capacity ) {
        var $$text = '';
        this.$$privateInit();
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_data_Qint8_elements__A', false);
        if (arguments.length == 1) {
                this.capacity = (capacity);
                this.length = 0;
                this.head = 0;
                this.tail = 0;
        }
        this.$$hostInitLastPass();
        return this;
    }
    Qint8.Qint8.prototype.setCapacity = function( capacity ) {
        var $$text = '';
        this.capacity = (capacity);
        this.$$hostInitLastPass();
        return $$text;
    }
    Qint8.pollen__uses__ = function() {
    }
    Qint8.Qint8.prototype.$$privateInit = function() {
        this.capacity = 0;
        this.length = 0;
        this.head = 0;
        this.tail = 0;
        this.elements = new $$Array((this.capacity), function($$cn,$$idx){ return 0;}, 'pollen_data_Qint8_elements__A', false);
    }
    Qint8.Qint8.prototype.$$hostInitLastPass = function() {
    }
    return Qint8;
}
var $$u = $$c();
$units['pollen.data.Qint8'] = $$u;
$units.push($$u);

