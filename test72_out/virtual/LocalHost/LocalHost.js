
/*
 * ======== COMPOSITION virtual.LocalHost ========
 */

var $$c = function() {
    const LocalHost = {};
    LocalHost.LocalHost = LocalHost
    LocalHost.$name = 'virtual.LocalHost';
    LocalHost.pollen$used = 0;
    LocalHost.Print = $units['virtual.mcu.ConsolePrint'];
    LocalHost.Dispatcher = $units['pollen.event.Dispatcher'];
    LocalHost.$$hostInit = function() {
        var $$text = '';
        var $$v = 'virtual_mcu_GlobalInterrupts';
        var $$s = $$bind($units['virtual.LocalHost'], 'Dispatcher.GI', $$v);{ $$v.pollen$used = true;
        $units['virtual.mcu.GlobalInterrupts'].pollen$used = true;}


        return $$text;
    }
    return LocalHost;
}
var $$u = $$c();
$units['virtual.LocalHost'] = $$u;
$units.push($$u);

