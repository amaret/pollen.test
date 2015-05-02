
/*
 * ======== test78.FakeProto ========
 */

var $$c = function() {
    const FakeProto = {};
    FakeProto.FakeProto = FakeProto
    FakeProto.$name = 'test78.FakeProto';
    FakeProto.pollen$used = 0;
    FakeProto.pollen__uses__ = function() {
    }
    FakeProto.$$privateInit = function() {
    }
    return FakeProto;
}
var $$u = $$c();
$units['test78.FakeProto'] = $$u;
$units.push($$u);

