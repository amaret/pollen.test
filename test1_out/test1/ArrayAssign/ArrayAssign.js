
/*
 * ======== MODULE test1.ArrayAssign ========
 */

var $$c = function() {
    const ArrayAssign = {};
    ArrayAssign.ArrayAssign = ArrayAssign
    ArrayAssign.$name = 'test1.ArrayAssign';
    ArrayAssign.pollen$used = 0;
    ArrayAssign.bar = new $$Ref('test1_ArrayAssign_bar__I');
    ArrayAssign.foo = new $$Ref('test1_ArrayAssign_foo__I');
    ArrayAssign.pollen__run = new $$Ref('test1_ArrayAssign_pollen__run__E');
    ArrayAssign.markUsed = new $$Ref('test1_ArrayAssign_markUsed__E');
    ArrayAssign.targetInit = new $$Ref('test1_ArrayAssign_targetInit__I');
    ArrayAssign.$$hostInit = function() {
        var $$text = '';
        ArrayAssign.buffer = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test1_ArrayAssign_buffer__A', false);
        return $$text;
    }
    ArrayAssign.pollen__uses__ = function() {
    }
    ArrayAssign.$$privateInit = function() {
        ArrayAssign.buffer = new $$Array(5, function($$cn,$$idx){ return 0;}, 'test1_ArrayAssign_buffer__A', false);
    }
    return ArrayAssign;
}
var $$u = $$c();
$units['test1.ArrayAssign'] = $$u;
$units.push($$u);

