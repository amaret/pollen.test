
/*
 * ======== MODULE test70.QueueBug_01 ========
 */

var $$c = function() {
    const QueueBug_01 = {};
    QueueBug_01.QueueBug_01 = QueueBug_01
    QueueBug_01.$name = 'test70.QueueBug_01';
    QueueBug_01.pollen$used = 0;
    QueueBug_01.HandlerQueue = $units['pollen.data.HandlerQueue'];
    QueueBug_01.Console = $units['virtual.mcu.ConsolePrint'];
    QueueBug_01.PrintImpl = $units['test54.PrintImpl'];
    QueueBug_01.pollen__run = new $$Ref('test70_QueueBug_01_pollen__run__E');
    QueueBug_01.tick1 = new $$Ref('test70_QueueBug_01_tick1__I');
    QueueBug_01.tick2 = new $$Ref('test70_QueueBug_01_tick2__I');
    QueueBug_01.tick3 = new $$Ref('test70_QueueBug_01_tick3__I');
    QueueBug_01.tick4 = new $$Ref('test70_QueueBug_01_tick4__I');
    QueueBug_01.tick5 = new $$Ref('test70_QueueBug_01_tick5__I');
    QueueBug_01.pollen__shutdown = new $$Ref('test70_QueueBug_01_pollen__shutdown__E');
    QueueBug_01.targetInit = new $$Ref('test70_QueueBug_01_targetInit__I');
    QueueBug_01.$$hostInit = function() {
        var $$text = '';
        QueueBug_01.eventHandlers = new $units['pollen.data.HandlerQueue'].HandlerQueue('test70_QueueBug_01_eventHandlers__V'); QueueBug_01.eventHandlers.new_host(5);
        return $$text;
    }
    QueueBug_01.pollen__uses__ = function() {
        $$bind($units['pollen.data.HandlerQueue'], 'pollen$used', true);
        $$bind($units['virtual.mcu.ConsolePrint'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    QueueBug_01.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test70.QueueBug_01'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return QueueBug_01;
}
var $$u = $$c();
$units['test70.QueueBug_01'] = $$u;
$units.push($$u);

