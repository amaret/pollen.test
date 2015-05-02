
/*
 * ======== CLASS test1.Cls3 ========
 */

var $$c = function() {
    const Cls3 = {};
    Cls3.Cls3 = Cls3
    Cls3.$name = 'test1.Cls3';
    Cls3.pollen$used = 0;
    Cls3.GImod = $units['test1.GlobalInterrupts'];
    Cls3.Cls2 = $units['test1.Cls2'];
    Cls3.Cls4$$id = 1;
    Cls3.Cls4 = function(cn) {
        this.$$id = Cls3.Cls4$$id++;
        this.$$cname = cn ? cn : 'test1_Cls3_Cls4__'+this.$$id+'__S';
        this.$$tname = 'test1_Cls3_Cls4';
        this.$$uname = 'test1.Cls3';
        this.i = 7;
        this.gi_class_nest = 0;
    }
    Cls3.Cls4.prototype = new $$Struct('test1.Cls3.Cls4');
    Cls3.Cls4.prototype.$$isAggFld = {};
    Cls3.Cls4.prototype.$$isAggFld.i = false;
    Cls3.Cls4.prototype.$$isAggFld.gi_class_nest = false;
    Cls3.Cls4.prototype.new_host = function( p ) {
        var $$text = '';
        this.$$privateInit();
        if (arguments.length == 1) {
                (this.i) = (p);
                var $$v = 'test1_GlobalInterrupts';
        var $$s = $$bind($units['test1.Cls3'], 'Cls4.gi_class_nest', $$v);{ $$v.pollen$used = true;
        $units['test1.GlobalInterrupts'].pollen$used = true;}


        }
        this.$$hostInitLastPass();
        return this;
    }
    Cls3.Cls4.prototype.$$privateInit = function() {
        this.i = 7;
        this.gi_class_nest = 0;
    }
    Cls3.Cls4.prototype.$$hostInitLastPass = function() {
    }
    Cls3.Cls3$$id = 1;
    Cls3.Cls3 = function(cn) {
        this.$$id = Cls3.Cls3$$id++;
        this.$$cname = cn ? cn : 'test1_Cls3_Cls3__'+this.$$id+'__S';
        this.$$tname = 'test1_Cls3_Cls3';
        this.$$uname = 'test1.Cls3';
        this.gi_class = 0;
    }
    Cls3.Cls3.prototype = new $$Struct('test1.Cls3.Cls3');
    Cls3.Cls3.prototype.$$isAggFld = {};
    Cls3.Cls3.prototype.$$isAggFld.gi_class = false;
    Cls3.Cls3.prototype.$$isAggFld.c1 = false;
    Cls3.Cls3.prototype.$$isAggFld.c2 = false;
    Cls3.Cls3.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.c1 = new $units['test1.Cls3'].Cls4('test1_Cls3_c1__V'); this.c1.new_host(3);
        this.c2 = new $units['test1.Cls2'].Cls2('test1_Cls3_c2__V');
        (this.c2) = new $units['test1.Cls2'].Cls2().new_host();
        var $$v = 'test1_GlobalInterrupts';
        var $$s = $$bind($units['test1.Cls3'], 'gi_class', $$v);{ $$v.pollen$used = true;
        $units['test1.GlobalInterrupts'].pollen$used = true;}


        this.$$hostInitLastPass();
        return this;
    }
    Cls3.pollen__uses__ = function() {
        $$bind($units['test1.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['test1.Cls2'], 'pollen$used', true);
    }
    Cls3.Cls3.prototype.$$privateInit = function() {
        this.gi_class = 0;
    }
    Cls3.Cls3.prototype.$$hostInitLastPass = function() {
    }
    return Cls3;
}
var $$u = $$c();
$units['test1.Cls3'] = $$u;
$units.push($$u);

