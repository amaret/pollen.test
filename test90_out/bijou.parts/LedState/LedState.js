
/*
 * ======== CLASS bijou.parts.LedState ========
 */

var $$c = function() {
    const LedState = {};
    LedState.LedState = LedState
    LedState.$name = 'bijou.parts.LedState';
    LedState.pollen$used = 0;
    LedState.LedState$$id = 1;
    LedState.LedState = function(cn) {
        this.$$id = LedState.LedState$$id++;
        this.$$cname = cn ? cn : 'bijou_parts_LedState_LedState__'+this.$$id+'__S';
        this.$$tname = 'bijou_parts_LedState_LedState';
        this.$$uname = 'bijou.parts.LedState';
        this.id = 0;
    }
    LedState.LedState.prototype = new $$Struct('bijou.parts.LedState.LedState');
    LedState.LedState.prototype.$$isAggFld = {};
    LedState.LedState.prototype.$$isAggFld.id = false;
    LedState.LedState.prototype.$$isAggFld.rgba = true;
    LedState.LedState.prototype.new_host = function( id ) {
        var $$text = '';
        this.$$privateInit();
        this.rgba = new $$Array(4, function($$cn,$$idx){ return 0;}, 'bijou_parts_LedState_rgba__A', false); this.rgba.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 0, 0, 0 ]));
        if (arguments.length == 1) {
                this.id = (id);
                (this.rgba).set(($units['bijou.parts.LedState'].Colors_Red), 0);
                (this.rgba).set(($units['bijou.parts.LedState'].Colors_Green), 0);
                (this.rgba).set(($units['bijou.parts.LedState'].Colors_Blue), 0);
                (this.rgba).set(($units['bijou.parts.LedState'].Colors_Alpha), 255);
        }
        this.$$hostInitLastPass();
        return this;
    }
    LedState.pollen__uses__ = function() {
        $$bind($units['local.mcu.Cpu'], 'pollen$used', true);
        $$bind($units['local.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['local.mcu.TimerMilli'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin0'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin1'], 'pollen$used', true);
        $$bind($units['local.mcu.Pin2'], 'pollen$used', true);
        $$bind($units['local.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['local.parts.ColorLed'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led0'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led1'], 'pollen$used', true);
        $$bind($units['pollen.parts.Led2'], 'pollen$used', true);
        $$bind($units['pollen.event.Newsroom'], 'pollen$used', true);
        $$bind($units['pollen.time.TimerManager'], 'pollen$used', true);
        $$bind($units['localhost.Lifecycle'], 'pollen$used', true);
        $$bind($units['pollen.math.Random8'], 'pollen$used', true);
        $$bind($units['pollen.math.Random16'], 'pollen$used', true);
    }
    LedState.LedState.prototype.$$privateInit = function() {
        this.id = 0;
        this.rgba = new $$Array(4, function($$cn,$$idx){ return 0;}, 'bijou_parts_LedState_rgba__A', false); this.rgba.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 0, 0, 0 ]));
    }
    LedState.LedState.prototype.$$hostInitLastPass = function() {
    }
    return LedState;
}
var $$u = $$c();
$units['bijou.parts.LedState'] = $$u;
$units.push($$u);

