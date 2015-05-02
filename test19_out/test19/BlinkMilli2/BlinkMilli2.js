
/*
 * ======== MODULE test19.BlinkMilli2 ========
 */

var $$c = function() {
    const BlinkMilli2 = {};
    BlinkMilli2.BlinkMilli2 = BlinkMilli2
    BlinkMilli2.$name = 'test19.BlinkMilli2';
    BlinkMilli2.pollen$used = 0;
    BlinkMilli2.TimerMilli = $units['pollen.time.TimerMilli'];
    BlinkMilli2.TT = $units['test19.TT'];
    BlinkMilli2.pollen__run = new $$Ref('test19_BlinkMilli2_pollen__run__E');
    BlinkMilli2.pollen__reset = new $$Ref('test19_BlinkMilli2_pollen__reset__E');
    BlinkMilli2.targetInit = new $$Ref('test19_BlinkMilli2_targetInit__I');
    BlinkMilli2.toggle = function() {
        var $$text = '';
        var lowValue;
        lowValue = true;
        $units['test19.TT'].get();
        return $$text;
    }
    BlinkMilli2.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkMilli2.pollen__uses__ = function() {
        $$bind($units['pollen.interfaces.Led'], 'pollen$used', true);
        $$bind($units['cc.arduino.PrintImpl'], 'pollen$used', true);
        $$bind($units['test19.TT'], 'pollen$used', true);
    }
    BlinkMilli2.$$privateInit = function() {
    }
    return BlinkMilli2;
}
var $$u = $$c();
$units['test19.BlinkMilli2'] = $$u;
$units.push($$u);

