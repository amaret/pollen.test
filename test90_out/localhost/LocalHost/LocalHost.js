
/*
 * ======== COMPOSITION localhost.LocalHost ========
 */

var $$c = function() {
    const LocalHost = {};
    LocalHost.LocalHost = LocalHost
    LocalHost.$name = 'localhost.LocalHost';
    LocalHost.pollen$used = 0;
    LocalHost.TimerMilli = $units['local.mcu.TimerMilli'];
    LocalHost.GlobalInterrupts = $units['local.mcu.GlobalInterrupts'];
    LocalHost.ConsolePrint = $units['local.mcu.ConsolePrint'];
    LocalHost.ColorLed = $units['local.parts.ColorLed'];
    LocalHost.Led0 = $units['pollen.parts.Led0'];
    LocalHost.Led1 = $units['pollen.parts.Led1'];
    LocalHost.Led2 = $units['pollen.parts.Led2'];
    LocalHost.Newsroom = $units['pollen.event.Newsroom'];
    LocalHost.TimerManager = $units['pollen.time.TimerManager'];
    LocalHost.Lifecycle = $units['localhost.Lifecycle'];
    LocalHost.pollen__presets__ = function() {
        var $$text = '';
        var $$v = 'local_mcu_GlobalInterrupts';
        var $$s = $$bind($units['localhost.LocalHost'], 'Newsroom.GI', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.GlobalInterrupts'].pollen$used = true;}


        var $$v = 'local_mcu_TimerMilli';
        var $$s = $$bind($units['localhost.LocalHost'], 'TimerManager.hwTimer', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.TimerMilli'].pollen$used = true;}


        var $$v = 'local_mcu_Pin0';
        var $$s = $$bind($units['localhost.LocalHost'], 'Led0.pin', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.Pin0'].pollen$used = true;}


        var $$v = 'local_mcu_Pin1';
        var $$s = $$bind($units['localhost.LocalHost'], 'Led1.pin', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.Pin1'].pollen$used = true;}


        var $$v = 'local_mcu_Pin2';
        var $$s = $$bind($units['localhost.LocalHost'], 'Led2.pin', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.Pin2'].pollen$used = true;}


        var $$v = 'local_mcu_ConsolePrint';
        var $$s = $$bind($units['localhost.LocalHost'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['local.mcu.ConsolePrint'].pollen$used = true;}


        return $$text;
    }
    return LocalHost;
}
var $$u = $$c();
$units['localhost.LocalHost'] = $$u;
$units.push($$u);

