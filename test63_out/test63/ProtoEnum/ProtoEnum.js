
/*
 * ======== test63.ProtoEnum ========
 */

var $$c = function() {
    const ProtoEnum = {};
    ProtoEnum.ProtoEnum = ProtoEnum
    ProtoEnum.$name = 'test63.ProtoEnum';
    ProtoEnum.pollen$used = 0;
    ProtoEnum.PEnum1_SCLK = 2;
    ProtoEnum.PEnum1_ACLK = 7;
    ProtoEnum.PEnum1_NEXT = 8;
    ProtoEnum.PEnum1_LAST = 9;
    ProtoEnum.PEnum2_FIRST = 0;
    ProtoEnum.PEnum2_NEXT = 1;
    ProtoEnum.PEnum2_LAST = 2;
    ProtoEnum.pollen__uses__ = function() {
    }
    ProtoEnum.$$privateInit = function() {
    }
    return ProtoEnum;
}
var $$u = $$c();
$units['test63.ProtoEnum'] = $$u;
$units.push($$u);

