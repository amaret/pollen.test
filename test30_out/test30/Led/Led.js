
/*
 * ======== MODULE test30.Led ========
 */

var $$c = function() {
    const Led = {};
    Led.Led = Led
    Led.$name = 'test30.Led';
    Led.pollen$used = 0;
    Led.targetInit = new $$Ref('test30_Led_targetInit__I');
    Led.on = new $$Ref('test30_Led_on__E');
    Led.off = new $$Ref('test30_Led_off__E');
    Led.toggle = new $$Ref('test30_Led_toggle__E');
    Led.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Led.pollen__uses__ = function() {
    }
    Led.$$privateInit = function() {
        Led.pin = 0;
    }
    return Led;
}
var $$u = $$c();
$units['test30.Led'] = $$u;
$units.push($$u);

