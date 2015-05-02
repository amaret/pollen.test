
/*
 * ======== MODULE test80.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test80.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.PrintImpl = $units['test61.PrintImpl'];
    HelloWorld.LocalEnum1_SCLK = 2;
    HelloWorld.LocalEnum1_ACLK = 7;
    HelloWorld.LocalEnum1_NEXT = 8;
    HelloWorld.LocalEnum1_LAST = 9;
    HelloWorld.LocalEnum2_FIRST2 = 0;
    HelloWorld.LocalEnum2_NEXT2 = 1;
    HelloWorld.LocalEnum2_LAST2 = 2;
    HelloWorld.pollen__run = new $$Ref('test80_HelloWorld_pollen__run__E');
    HelloWorld.targ_test = new $$Ref('test80_HelloWorld_targ_test__I');
    HelloWorld.targ_test2 = new $$Ref('test80_HelloWorld_targ_test2__I');
    HelloWorld.targetInit = new $$Ref('test80_HelloWorld_targetInit__I');
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        HelloWorld.test((HelloWorld.LocalEnum1_SCLK));
        HelloWorld.test2(($units['test80.CompEnum'].CEnum1_ACLK), ($units['test80.ModEnum'].ModEnum_Y2), ($units['test80.ProtoEnum'].PEnum1_ACLK));
        return $$text;
    }
    HelloWorld.test = function( i ) {
        var $$text = '';
        var j;
        j = (i);
        if ((i) == (HelloWorld.LocalEnum1_SCLK)) {
            $$printf("host test 1 passed \n");
        }
        else {
            $$printf("host test 1 failed \n");
        }
        return $$text;
    }
    HelloWorld.test2 = function( i, j, k ) {
        var $$text = '';
        if ((i) == ($units['test80.CompEnum'].CEnum1_ACLK)) {
            $$printf("host test2 case 1 passed \n");
        }
        else {
            $$printf("host test2 case 1 failed \n");
        }
        if ((j) == ($units['test80.ModEnum'].ModEnum_Y2)) {
            $$printf("host test2 case 2 passed \n");
        }
        else {
            $$printf("host test2 case 2 failed \n");
        }
        if ((k) == ($units['test80.ProtoEnum'].PEnum1_ACLK)) {
            $$printf("host test2 case 3 passed \n");
        }
        else {
            $$printf("host test2 case 3 failed \n");
        }
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test80.ModEnum'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
        HelloWorld.x = (HelloWorld.LocalEnum1_SCLK);
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test80.HelloWorld'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return HelloWorld;
}
var $$u = $$c();
$units['test80.HelloWorld'] = $$u;
$units.push($$u);

