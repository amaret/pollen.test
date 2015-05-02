
/*
 * ======== COMPOSITION test78.HostCallComp ========
 */

var $$c = function() {
    const HostCallComp = {};
    HostCallComp.HostCallComp = HostCallComp
    HostCallComp.$name = 'test78.HostCallComp';
    HostCallComp.pollen$used = 0;
    HostCallComp.Pin = $units['test78.FakePin'];
    HostCallComp.Led = $units['test78.FakeLed'];
    HostCallComp.pollen__presets__ = function() {
        var $$text = '';
        $$printf("HostCallComp.preset: enter\n");
        var $$v = 'test78_FakePin';
        var $$s = $$bind($units['test78.HostCallComp'], 'FakeLed.pin', $$v);{ $$v.pollen$used = true;
        $units['test78.FakePin'].pollen$used = true;}


        $$printf("HostCallComp.preset: exit\n");
        return $$text;
    }
    return HostCallComp;
}
var $$u = $$c();
$units['test78.HostCallComp'] = $$u;
$units.push($$u);

