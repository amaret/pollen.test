
/*
 * ======== MODULE test78.FakePin ========
 */

var $$c = function() {
    const FakePin = {};
    FakePin.FakePin = FakePin
    FakePin.$name = 'test78.FakePin';
    FakePin.pollen$used = 0;
    FakePin.targetInit = new $$Ref('test78_FakePin_targetInit__I');
    FakePin.foo = function() {
        var $$text = '';
        $$printf("FakePin.foo:    enter/exit\n");
        return $$text;
    }
    FakePin.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    FakePin.pollen__uses__ = function() {
    }
    FakePin.$$privateInit = function() {
    }
    return FakePin;
}
var $$u = $$c();
$units['test78.FakePin'] = $$u;
$units.push($$u);

