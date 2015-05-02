
/*
 * ======== MODULE test63.HelloWorld ========
 */

var $$c = function() {
    const HelloWorld = {};
    HelloWorld.HelloWorld = HelloWorld
    HelloWorld.$name = 'test63.HelloWorld';
    HelloWorld.pollen$used = 0;
    HelloWorld.PrintImpl = $units['test61.PrintImpl'];
    HelloWorld.LocalEnum1_SCLK = 2;
    HelloWorld.LocalEnum1_ACLK = 7;
    HelloWorld.LocalEnum1_NEXT = 8;
    HelloWorld.LocalEnum1_LAST = 9;
    HelloWorld.LocalEnum2_FIRST2 = 0;
    HelloWorld.LocalEnum2_NEXT2 = 1;
    HelloWorld.LocalEnum2_LAST2 = 2;
    HelloWorld.pollen__run = new $$Ref('test63_HelloWorld_pollen__run__E');
    HelloWorld.targ_test = new $$Ref('test63_HelloWorld_targ_test__I');
    HelloWorld.targetInit = new $$Ref('test63_HelloWorld_targetInit__I');
    HelloWorld.$$hostInit = function() {
        var $$text = '';
        HelloWorld.test();
        return $$text;
    }
    HelloWorld.test = function() {
        var $$text = '';
        var x;
        var y;
        var z;
        var z1;
        x = (HelloWorld.LocalEnum1_SCLK);
        y = (HelloWorld.LocalEnum1_ACLK);
        z = (HelloWorld.LocalEnum1_NEXT);
        z1 = (HelloWorld.LocalEnum1_LAST);
        if ((x) == 2 && (y) == 7 && (z) == 8 && (z1) == 9) {
            $$printf("PASS LocalEnum1 (host) \n");
        }
        else {
            $$printf((x), " ", (y), " ", (z), " ", (z1), "\n ");
            $$printf("FAIL LocalEnum1 (host) \n ");
        }
        (x) = (HelloWorld.LocalEnum2_FIRST2);
        (y) = (HelloWorld.LocalEnum2_NEXT2);
        (z) = (HelloWorld.LocalEnum2_LAST2);
        if ((x) == 0 && (y) == 1 && (z) == 2) {
            $$printf("PASS LocalEnum2 (host) \n");
        }
        else {
            $$printf((x), " ", (y), " ", (z), "\n ");
            $$printf("FAIL LocalEnum2 (host) \n ");
        }
        (x) = ($units['test63.CompEnum'].CEnum1_NEXT);
        (y) = ($units['test63.ProtoEnum'].PEnum2_NEXT);
        (z) = ($units['test63.ModEnum'].ModEnum_Y2);
        if ((x) == 8 && (y) == 1 && (z) == 2) {
            $$printf("PASS Comp, Proto, Mod enums (host) \n");
        }
        else {
            $$printf((x), " ", (y), " ", (z), "\n ");
            $$printf("FAIL Comp, Proto, Mod enums (host) \n");
        }
        return $$text;
    }
    HelloWorld.pollen__uses__ = function() {
        $$bind($units['test63.ModEnum'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    HelloWorld.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test63.HelloWorld'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return HelloWorld;
}
var $$u = $$c();
$units['test63.HelloWorld'] = $$u;
$units.push($$u);

