
/*
 * ======== MODULE test56.On1 ========
 */

var $$c = function() {
    const On1 = {};
    On1.On1 = On1
    On1.$name = 'test56.On1';
    On1.pollen$used = 0;
    On1.on = new $$Ref('test56_On1_on__E');
    On1.on_0 = new $$Ref('test56_On1_on_0__E');
    On1.on_2_1 = new $$Ref('test56_On1_on_2_1__E');
    On1.targetInit = new $$Ref('test56_On1_targetInit__I');
    On1.on_2_0 = function() {
        var $$text = '';
        $$printf(">>In On1.on_2_0(), host fcn, no args \n");
        return $$text;
    }
    On1.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    On1.pollen__uses__ = function() {
    }
    On1.$$privateInit = function() {
    }
    return On1;
}
var $$u = $$c();
$units['test56.On1'] = $$u;
$units.push($$u);

