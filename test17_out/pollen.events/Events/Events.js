
/*
 * ======== COMPOSITION pollen.events.Events ========
 */

var $$c = function() {
    const Events = {};
    Events.Events = Events
    Events.$name = 'pollen.events.Events';
    Events.pollen$used = 0;
    Events.Dispatcher = $units['pollen.events.Dispatcher'];
    Events.bindGlobalInterrupts = function( gi ) {
        var $$text = '';
        $units['pollen.events.Dispatcher'].bindGlobalInterrupts((gi));
        return $$text;
    }
    return Events;
}
var $$u = $$c();
$units['pollen.events.Events'] = $$u;
$units.push($$u);

