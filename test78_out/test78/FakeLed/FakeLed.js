
/*
 * ======== MODULE test78.FakeLed ========
 */

var $$c = function() {
    const FakeLed = {};
    FakeLed.FakeLed = FakeLed
    FakeLed.$name = 'test78.FakeLed';
    FakeLed.pollen$used = 0;
    FakeLed.FakePin = $units['test78.FakePin'];
    FakeLed.targetInit = new $$Ref('test78_FakeLed_targetInit__I');
    FakeLed.$$hostInit = function() {
        var $$text = '';
        $$printf("FakeLed.hostInit: enter/exit\n");
        return $$text;
    }
    FakeLed.testFunction = function() {
        var $$text = '';
        $$printf("FakeLed.testFunction: enter\n");
        $units['test78.FakePin'].foo();
        $units['test78.FakePin'].foo();
        $$printf("FakeLed.testFunction: exit\n");
        return $$text;
    }
    FakeLed.pollen__uses__ = function() {
        $$bind($units['test78.FakePin'], 'pollen$used', true);
    }
    FakeLed.$$privateInit = function() {
        FakeLed.pin = 0;
    }
    return FakeLed;
}
var $$u = $$c();
$units['test78.FakeLed'] = $$u;
$units.push($$u);

