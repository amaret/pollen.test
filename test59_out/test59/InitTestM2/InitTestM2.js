
/*
 * ======== MODULE test59.InitTestM2 ========
 */

var $$c = function() {
    const InitTestM2 = {};
    InitTestM2.InitTestM2 = InitTestM2
    InitTestM2.$name = 'test59.InitTestM2';
    InitTestM2.pollen$used = 0;
    InitTestM2.foo = new $$Ref('test59_InitTestM2_foo__E');
    InitTestM2.targetInit = new $$Ref('test59_InitTestM2_targetInit__I');
    InitTestM2.$$hostInit = function() {
        var $$text = '';
        $$printf("InitTestM2 host init\n");
        return $$text;
    }
    InitTestM2.pollen__uses__ = function() {
    }
    InitTestM2.$$privateInit = function() {
    }
    return InitTestM2;
}
var $$u = $$c();
$units['test59.InitTestM2'] = $$u;
$units.push($$u);

