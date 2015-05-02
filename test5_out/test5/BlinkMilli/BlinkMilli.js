
/*
 * ======== MODULE test5.BlinkMilli ========
 */

var $$c = function() {
    const BlinkMilli = {};
    BlinkMilli.BlinkMilli = BlinkMilli
    BlinkMilli.$name = 'test5.BlinkMilli';
    BlinkMilli.pollen$used = 0;
    BlinkMilli.TimerMilli = $units['pollen.time.TimerMilli'];
    BlinkMilli.madams_chkArray = new $$Ref('test5_BlinkMilli_madams_chkArray__I');
    BlinkMilli.toggle = new $$Ref('test5_BlinkMilli_toggle__I');
    BlinkMilli.pollen__run = new $$Ref('test5_BlinkMilli_pollen__run__E');
    BlinkMilli.pollen__reset = new $$Ref('test5_BlinkMilli_pollen__reset__E');
    BlinkMilli.targetInit = new $$Ref('test5_BlinkMilli_targetInit__I');
    BlinkMilli.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    BlinkMilli.pollen__uses__ = function() {
        $$bind($units['mcu.atmel.atmega328p.Atmega328p'], 'pollen$used', true);
        $$bind($units['mcu.atmel.atmega.Timer0MatchA'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerMilli'], 'pollen$used', true);
        $$bind($units['pollen.events.Dispatcher'], 'pollen$used', true);
    }
    BlinkMilli.$$privateInit = function() {
    }
    return BlinkMilli;
}
var $$u = $$c();
$units['test5.BlinkMilli'] = $$u;
$units.push($$u);

