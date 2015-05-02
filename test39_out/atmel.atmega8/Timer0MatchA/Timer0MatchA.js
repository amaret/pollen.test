
/*
 * ======== MODULE atmel.atmega8.Timer0MatchA ========
 */

var $$c = function() {
    const Timer0MatchA = {};
    Timer0MatchA.Timer0MatchA = Timer0MatchA
    Timer0MatchA.$name = 'atmel.atmega8.Timer0MatchA';
    Timer0MatchA.pollen$used = 0;
    Timer0MatchA.enable = new $$Ref('atmel_atmega8_Timer0MatchA_enable__E');
    Timer0MatchA.disable = new $$Ref('atmel_atmega8_Timer0MatchA_disable__E');
    Timer0MatchA.clear = new $$Ref('atmel_atmega8_Timer0MatchA_clear__E');
    Timer0MatchA.isEnabled = new $$Ref('atmel_atmega8_Timer0MatchA_isEnabled__E');
    Timer0MatchA.targetInit = new $$Ref('atmel_atmega8_Timer0MatchA_targetInit__I');
    Timer0MatchA.name = "TIMER0_COMPA_vect";
    Timer0MatchA.enableRegister = "TIMSK0";
    Timer0MatchA.enableBit = "OCIE0A";
    Timer0MatchA.clearRegister = "TIFR0";
    Timer0MatchA.clearBit = "OCF0A";
    Timer0MatchA.setHandlerOnHost = function( h ) {
        var $$text = '';
        (Timer0MatchA.handler) = (h);
        return $$text;
    }
    Timer0MatchA.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Timer0MatchA.pollen__uses__ = function() {
    }
    Timer0MatchA.$$privateInit = function() {
    }
    return Timer0MatchA;
}
var $$u = $$c();
$units['atmel.atmega8.Timer0MatchA'] = $$u;
$units.push($$u);

