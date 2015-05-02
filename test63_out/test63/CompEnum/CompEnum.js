
/*
 * ======== COMPOSITION test63.CompEnum ========
 */

var $$c = function() {
    const CompEnum = {};
    CompEnum.CompEnum = CompEnum
    CompEnum.$name = 'test63.CompEnum';
    CompEnum.pollen$used = 0;
    CompEnum.CEnum1_SCLK = 2;
    CompEnum.CEnum1_ACLK = 7;
    CompEnum.CEnum1_NEXT = 8;
    CompEnum.CEnum1_LAST = 9;
    return CompEnum;
}
var $$u = $$c();
$units['test63.CompEnum'] = $$u;
$units.push($$u);

