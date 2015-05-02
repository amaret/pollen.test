
/*
 * ======== COMPOSITION virtual.LocalHost ========
 */

var $$c = function() {
    const LocalHost = {};
    LocalHost.LocalHost = LocalHost
    LocalHost.$name = 'virtual.LocalHost';
    LocalHost.pollen$used = 0;
    LocalHost.TimerMilli = $units['virtual.mcu.TimerMilli'];
    LocalHost.GlobalInterrupts = $units['virtual.mcu.GlobalInterrupts'];
    LocalHost.Print = $units['virtual.mcu.ConsolePrint'];
    LocalHost.Newsroom = $units['pollen.event.Newsroom'];
    LocalHost.pollen__presets__ = function() {
        var $$text = '';
        var $$v = 'virtual_mcu_GlobalInterrupts';
        var $$s = $$bind($units['virtual.LocalHost'], 'Newsroom.GI', $$v);{ $$v.pollen$used = true;
        $units['virtual.mcu.GlobalInterrupts'].pollen$used = true;}


        return $$text;
    }
    return LocalHost;
}
var $$u = $$c();
$units['virtual.LocalHost'] = $$u;
$units.push($$u);

