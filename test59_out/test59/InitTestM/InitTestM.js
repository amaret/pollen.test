
/*
 * ======== MODULE test59.InitTestM ========
 */

var $$c = function() {
    const InitTestM = {};
    InitTestM.InitTestM = InitTestM
    InitTestM.$name = 'test59.InitTestM';
    InitTestM.pollen$used = 0;
    InitTestM.pollen__run = new $$Ref('test59_InitTestM_pollen__run__E');
    InitTestM.pollen__shutdown = new $$Ref('test59_InitTestM_pollen__shutdown__E');
    InitTestM.targetInit = new $$Ref('test59_InitTestM_targetInit__I');
    InitTestM.$$hostInit = function() {
        var $$text = '';
        $$printf("InitTestM host init\n");
        $$printf("Init order should be: \n");
        $$printf("1. InitTestM2 2. InitTestC 3. InitTestM \n");
        return $$text;
    }
    InitTestM.pollen__uses__ = function() {
        $$bind($units['test59.InitTestM2'], 'pollen$used', true);
    }
    InitTestM.$$privateInit = function() {
    }
    return InitTestM;
}
var $$u = $$c();
$units['test59.InitTestM'] = $$u;
$units.push($$u);

