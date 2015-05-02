
/*
 * ======== MODULE localhost.Lifecycle ========
 */

var $$c = function() {
    const Lifecycle = {};
    Lifecycle.Lifecycle = Lifecycle
    Lifecycle.$name = 'localhost.Lifecycle';
    Lifecycle.pollen$used = 0;
    Lifecycle.pollen__reset = new $$Ref('localhost_Lifecycle_pollen__reset__E');
    Lifecycle.pollen__ready = new $$Ref('localhost_Lifecycle_pollen__ready__E');
    Lifecycle.pollen__shutdown = new $$Ref('localhost_Lifecycle_pollen__shutdown__E');
    Lifecycle.targetInit = new $$Ref('localhost_Lifecycle_targetInit__I');
    Lifecycle.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Lifecycle.pollen__uses__ = function() {
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
    }
    Lifecycle.$$privateInit = function() {
    }
    return Lifecycle;
}
var $$u = $$c();
$units['localhost.Lifecycle'] = $$u;
$units.push($$u);

