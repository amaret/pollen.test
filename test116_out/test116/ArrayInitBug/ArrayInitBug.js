
/*
 * ======== MODULE test116.ArrayInitBug ========
 */

var $$c = function() {
    const ArrayInitBug = {};
    ArrayInitBug.ArrayInitBug = ArrayInitBug
    ArrayInitBug.$name = 'test116.ArrayInitBug';
    ArrayInitBug.pollen$used = 0;
    ArrayInitBug.C1 = $units['test116.C1'];
    ArrayInitBug.PrintImpl = $units['test54.PrintImpl'];
    ArrayInitBug.Pos_Zero = 0;
    ArrayInitBug.Pos_One = 1;
    ArrayInitBug.Pos_Two = 2;
    ArrayInitBug.test = new $$Ref('test116_ArrayInitBug_test__I');
    ArrayInitBug.pollen__run = new $$Ref('test116_ArrayInitBug_pollen__run__E');
    ArrayInitBug.pollen__shutdown = new $$Ref('test116_ArrayInitBug_pollen__shutdown__E');
    ArrayInitBug.targetInit = new $$Ref('test116_ArrayInitBug_targetInit__I');
    ArrayInitBug.$$hostInit = function() {
        var $$text = '';
        ArrayInitBug.array = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test116_ArrayInitBug_array__A', false); ArrayInitBug.array.$$assign((new $$Array(5, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ new $units['test116.C1'].C1().new_host(1), new $units['test116.C1'].C1().new_host(1), new $units['test116.C1'].C1().new_host(1), new $units['test116.C1'].C1().new_host(1), new $units['test116.C1'].C1().new_host(1) ]));
        return $$text;
    }
    ArrayInitBug.pollen__uses__ = function() {
        $$bind($units['test116.C1'], 'pollen$used', true);
        $$bind($units['test54.PrintImpl'], 'pollen$used', true);
    }
    ArrayInitBug.$$privateInit = function() {
var $$v = 'test54_PrintImpl';
        var $$s = $$bind($units['test116.ArrayInitBug'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test54.PrintImpl'].pollen$used = true;}

    }
    return ArrayInitBug;
}
var $$u = $$c();
$units['test116.ArrayInitBug'] = $$u;
$units.push($$u);

