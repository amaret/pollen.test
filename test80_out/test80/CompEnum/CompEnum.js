
/*
 * ======== COMPOSITION test80.CompEnum ========
 */

var $$c = function() {
    const CompEnum = {};
    CompEnum.CompEnum = CompEnum
    CompEnum.$name = 'test80.CompEnum';
    CompEnum.pollen$used = 0;
    CompEnum.CEnum1_SCLK = 02;
    CompEnum.CEnum1_ACLK = 0x7;
    CompEnum.CEnum1_NEXT = 999999;
    CompEnum.CEnum1_LAST = 64;
    return CompEnum;
}
var $$u = $$c();
$units['test80.CompEnum'] = $$u;
$units.push($$u);

