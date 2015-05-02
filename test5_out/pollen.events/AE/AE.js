
/*
 * ======== CLASS pollen.events.AE ========
 */

var $$c = function() {
    const AE = {};
    AE.AE = AE
    AE.$name = 'pollen.events.AE';
    AE.pollen$used = 0;
    AE.AE$$id = 1;
    AE.AE = function(cn) {
        this.$$id = AE.AE$$id++;
        this.$$cname = cn ? cn : 'pollen_events_AE_AE__'+this.$$id+'__S';
        this.$$tname = 'pollen_events_AE_AE';
        this.$$uname = 'pollen.events.AE';
        this.priority = 0;
        this.handler = null;
        this.data = 0;
    }
    AE.AE.prototype = new $$Struct('pollen.events.AE.AE');
    AE.AE.prototype.$$isAggFld = {};
    AE.AE.prototype.$$isAggFld.priority = false;
    AE.AE.prototype.$$isAggFld.handler = false;
    AE.AE.prototype.$$isAggFld.data = false;
    AE.AE.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    AE.pollen__uses__ = function() {
    }
    AE.AE.prototype.$$privateInit = function() {
        this.priority = 0;
        this.handler = null;
        this.data = 0;
    }
    AE.AE.prototype.$$hostInitLastPass = function() {
    }
    return AE;
}
var $$u = $$c();
$units['pollen.events.AE'] = $$u;
$units.push($$u);

