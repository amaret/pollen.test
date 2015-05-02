
/*
 * ======== MODULE test61.Blink ========
 */

var $$c = function() {
    const Blink = {};
    Blink.Blink = Blink
    Blink.$name = 'test61.Blink';
    Blink.pollen$used = 0;
    Blink.PrintImpl = $units['test61.PrintImpl'];
    Blink.targetInit = new $$Ref('test61_Blink_targetInit__I');
    Blink.pollen__run = new $$Ref('test61_Blink_pollen__run__E');
    Blink.delay = new $$Ref('test61_Blink_delay__I');
    Blink.$$hostInit = function() {
        var $$text = '';
        var $$v = 'test61_AvrPin';
        var $$s = $$bind($units['test61.Blink'], 'Led.pin', $$v);if ($$v && $$v == $$s) $$v.pollen$used = true;

        return $$text;
    }
    Blink.pollen__uses__ = function() {
        $$bind($units['test61.AvrPin'], 'pollen$used', true);
        $$bind($units['test61.Led'], 'pollen$used', true);
        $$bind($units['test61.PrintImpl'], 'pollen$used', true);
    }
    Blink.$$privateInit = function() {
var $$v = 'test61_PrintImpl';
        var $$s = $$bind($units['test61.Blink'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['test61.PrintImpl'].pollen$used = true;}

    }
    return Blink;
}
var $$u = $$c();
$units['test61.Blink'] = $$u;
$units.push($$u);

