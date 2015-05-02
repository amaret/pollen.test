
/*
 * ======== CLASS test47.Ev ========
 */

var $$c = function() {
    const Ev = {};
    Ev.Ev = Ev
    Ev.$name = 'test47.Ev';
    Ev.pollen$used = 0;
    Ev.Ev$$id = 1;
    Ev.Ev = function(cn) {
        this.$$id = Ev.Ev$$id++;
        this.$$cname = cn ? cn : 'test47_Ev_Ev__'+this.$$id+'__S';
        this.$$tname = 'test47_Ev_Ev';
        this.$$uname = 'test47.Ev';
        this.priority = 0;
        this.handler = 0;
        this.data = 0;
    }
    Ev.Ev.prototype = new $$Struct('test47.Ev.Ev');
    Ev.Ev.prototype.$$isAggFld = {};
    Ev.Ev.prototype.$$isAggFld.priority = false;
    Ev.Ev.prototype.$$isAggFld.handler = false;
    Ev.Ev.prototype.$$isAggFld.data = false;
    Ev.Ev.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.$$hostInitLastPass();
        return this;
    }
    Ev.pollen__uses__ = function() {
    }
    Ev.Ev.prototype.$$privateInit = function() {
        this.priority = 0;
        this.data = 0;
    }
    Ev.Ev.prototype.$$hostInitLastPass = function() {
    }
    return Ev;
}
var $$u = $$c();
$units['test47.Ev'] = $$u;
$units.push($$u);

