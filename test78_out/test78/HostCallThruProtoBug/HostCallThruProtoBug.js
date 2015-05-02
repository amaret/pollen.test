
/*
 * ======== MODULE test78.HostCallThruProtoBug ========
 */

var $$c = function() {
    const HostCallThruProtoBug = {};
    HostCallThruProtoBug.HostCallThruProtoBug = HostCallThruProtoBug
    HostCallThruProtoBug.$name = 'test78.HostCallThruProtoBug';
    HostCallThruProtoBug.pollen$used = 0;
    HostCallThruProtoBug.PrintImpl = $units['test54.PrintImpl'];
    HostCallThruProtoBug.pollen__run = new $$Ref('test78_HostCallThruProtoBug_pollen__run__E');
    HostCallThruProtoBug.pollen__shutdown = new $$Ref('test78_HostCallThruProtoBug_pollen__shutdown__E');
    HostCallThruProtoBug.targetInit = new $$Ref('test78_HostCallThruProtoBug_targetInit__I');
    HostCallThruProtoBug.$$hostInit = function() {
        var $$text = '';
        $$printf("HostCallThruProtoBug.hostInit: enter\n");
        $units['test78.FakeLed'].testFunction();
        $$printf("HostCallThruProtoBug.hostInit: exit\n");
        return $$text;
    }
    HostCallThruProtoBug.pollen__uses__ = function() {
        $$bind($units['test78.FakePin'], 'pollen$used', true);
        $$bind($units['test78.FakeLed'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    HostCallThruProtoBug.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test78.HostCallThruProtoBug'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return HostCallThruProtoBug;
}
var $$u = $$c();
$units['test78.HostCallThruProtoBug'] = $$u;
$units.push($$u);

