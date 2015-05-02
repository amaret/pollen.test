
/*
 * ======== MODULE mcu.atmel.atmega.Timer0MatchA ========
 */

var $$c = function() {
    const Timer0MatchA = {};
    Timer0MatchA.Timer0MatchA = Timer0MatchA
    Timer0MatchA.$name = 'mcu.atmel.atmega.Timer0MatchA';
    Timer0MatchA.pollen$used = 0;
    Timer0MatchA.setHandler = new $$Ref('mcu_atmel_atmega_Timer0MatchA_setHandler__E');
    Timer0MatchA.enable = new $$Ref('mcu_atmel_atmega_Timer0MatchA_enable__E');
    Timer0MatchA.enabled = new $$Ref('mcu_atmel_atmega_Timer0MatchA_enabled__E');
    Timer0MatchA.disable = new $$Ref('mcu_atmel_atmega_Timer0MatchA_disable__E');
    Timer0MatchA.clear = new $$Ref('mcu_atmel_atmega_Timer0MatchA_clear__E');
    Timer0MatchA.isr = new $$Ref('mcu_atmel_atmega_Timer0MatchA_isr__I');
    Timer0MatchA.targetInit = new $$Ref('mcu_atmel_atmega_Timer0MatchA_targetInit__I');
    Timer0MatchA.name = "TIMER0_COMPA_vect";
    Timer0MatchA.enableRegister = "TIMSK0";
    Timer0MatchA.enableBit = "OCIE0A";
    Timer0MatchA.clearRegister = "TIFR0";
    Timer0MatchA.clearBit = "OCF0A";
    Timer0MatchA.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Timer0MatchA.pollen__uses__ = function() {
    }
    Timer0MatchA.$$privateInit = function() {
        Timer0MatchA.h = 0;
    }
    return Timer0MatchA;
}
var $$u = $$c();
$units['mcu.atmel.atmega.Timer0MatchA'] = $$u;
$units.push($$u);

