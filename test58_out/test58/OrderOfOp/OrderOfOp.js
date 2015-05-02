
/*
 * ======== MODULE test58.OrderOfOp ========
 */

var $$c = function() {
    const OrderOfOp = {};
    OrderOfOp.OrderOfOp = OrderOfOp
    OrderOfOp.$name = 'test58.OrderOfOp';
    OrderOfOp.pollen$used = 0;
    OrderOfOp.IncArrTest = $units['test58.IncArrTest'];
    OrderOfOp.pollen__run = new $$Ref('test58_OrderOfOp_pollen__run__E');
    OrderOfOp.targetInit = new $$Ref('test58_OrderOfOp_targetInit__I');
    OrderOfOp.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    OrderOfOp.pollen__uses__ = function() {
        $$bind($units['test58.IncArrTest'], 'pollen$used', true);
    }
    OrderOfOp.$$privateInit = function() {
        OrderOfOp.NOFADE = 0;
        OrderOfOp.fading = (OrderOfOp.NOFADE);
        OrderOfOp.fadecount = 0;
    }
    return OrderOfOp;
}
var $$u = $$c();
$units['test58.OrderOfOp'] = $$u;
$units.push($$u);

