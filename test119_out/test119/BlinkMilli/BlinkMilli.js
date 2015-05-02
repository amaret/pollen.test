
/*
 * ======== MODULE test119.BlinkMilli ========
 */

var $$c = function() {
    const BlinkMilli = {};
    BlinkMilli.BlinkMilli = BlinkMilli
    BlinkMilli.$name = 'test119.BlinkMilli';
    BlinkMilli.pollen$used = 0;
    BlinkMilli.PrintImpl = $units['test54.PrintImpl'];
    BlinkMilli.test = new $$Ref('test119_BlinkMilli_test__I');
    BlinkMilli.pollen__run = new $$Ref('test119_BlinkMilli_pollen__run__E');
    BlinkMilli.targetInit = new $$Ref('test119_BlinkMilli_targetInit__I');
    BlinkMilli.$$hostInit = function() {
        var $$text = '';
        var nestarr;
        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test119_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        BlinkMilli.hostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test119_BlinkMilli_hostarr__A', false); BlinkMilli.hostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
        nestarr = (new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]);
        $$printf("local arr at idx 2 is ", (nestarr.get(2)), "\n");
        return $$text;
    }
    BlinkMilli.pollen__uses__ = function() {
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    BlinkMilli.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test119.BlinkMilli'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

        BlinkMilli.nonhostarr = new $$Array(4, function($$cn,$$idx){ return 0;}, 'test119_BlinkMilli_nonhostarr__A', false); BlinkMilli.nonhostarr.$$assign((new $$Array(4, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 1, 2, 3, 4 ]));
    }
    return BlinkMilli;
}
var $$u = $$c();
$units['test119.BlinkMilli'] = $$u;
$units.push($$u);

