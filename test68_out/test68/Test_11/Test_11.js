
/*
 * ======== MODULE test68.Test_11 ========
 */

var $$c = function() {
    const Test_11 = {};
    Test_11.Test_11 = Test_11
    Test_11.$name = 'test68.Test_11';
    Test_11.pollen$used = 0;
    Test_11.Dispatcher = $units['pollen.event.Dispatcher'];
    Test_11.Event = $units['pollen.event.Event'];
    Test_11.Console = $units['virtual.mcu.ConsolePrint'];
    Test_11.GlobalInterrupts = $units['virtual.mcu.GlobalInterrupts'];
    Test_11.PrintImpl = $units['test54.PrintImpl'];
    Test_11.pollen__run = new $$Ref('test68_Test_11_pollen__run__E');
    Test_11.pollen__shutdown = new $$Ref('test68_Test_11_pollen__shutdown__E');
    Test_11.tick1 = new $$Ref('test68_Test_11_tick1__I');
    Test_11.tick2 = new $$Ref('test68_Test_11_tick2__I');
    Test_11.tick3 = new $$Ref('test68_Test_11_tick3__I');
    Test_11.tick4 = new $$Ref('test68_Test_11_tick4__I');
    Test_11.tick5 = new $$Ref('test68_Test_11_tick5__I');
    Test_11.targetInit = new $$Ref('test68_Test_11_targetInit__I');
    Test_11.$$hostInit = function() {
        var $$text = '';
        Test_11.events = new $$Array((Test_11.NumEvents), function($$cn,$$idx){ return 0;}, 'test68_Test_11_events__A', false); Test_11.events.$$assign((new $$Array((Test_11.NumEvents), function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['pollen.event.Event'].Event().new_host((Test_11.tick1)), new $units['pollen.event.Event'].Event().new_host((Test_11.tick2)), new $units['pollen.event.Event'].Event().new_host((Test_11.tick3)), new $units['pollen.event.Event'].Event().new_host((Test_11.tick4)), new $units['pollen.event.Event'].Event().new_host((Test_11.tick5)) ]));
        var $$v = 'virtual_mcu_GlobalInterrupts';
        var $$s = $$bind($units['test68.Test_11'], 'Dispatcher.GI', $$v);{ $$v.pollen$used = true;
        $units['virtual.mcu.GlobalInterrupts'].pollen$used = true;}


        return $$text;
    }
    Test_11.pollen__uses__ = function() {
        $$bind($units['pollen.event.Dispatcher'], 'pollen$used', true);
        $$bind($units['pollen.event.Event'], 'pollen$used', true);
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['virtual.mcu.GlobalInterrupts'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    Test_11.$$privateInit = function() {
        Test_11.NumEvents = 5;
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test68.Test_11'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return Test_11;
}
var $$u = $$c();
$units['test68.Test_11'] = $$u;
$units.push($$u);

