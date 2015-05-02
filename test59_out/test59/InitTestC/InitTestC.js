
/*
 * ======== COMPOSITION test59.InitTestC ========
 */

var $$c = function() {
    const InitTestC = {};
    InitTestC.InitTestC = InitTestC
    InitTestC.$name = 'test59.InitTestC';
    InitTestC.pollen$used = 0;
    InitTestC.InitTestM2 = $units['test59.InitTestM2'];
    InitTestC.$$hostInit = function() {
        var $$text = '';
        $$printf("InitTestC host init\n");
        return $$text;
    }
    return InitTestC;
}
var $$u = $$c();
$units['test59.InitTestC'] = $$u;
$units.push($$u);

