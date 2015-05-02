
/*
 * ======== MODULE test27.Blink3 ========
 */

var $$c = function() {
    const Blink3 = {};
    Blink3.Blink3 = Blink3
    Blink3.$name = 'test27.Blink3';
    Blink3.pollen$used = 0;
    Blink3.AvrPin = $units['test27.AvrPin'];
    Blink3.targetInit = new $$Ref('test27_Blink3_targetInit__I');
    Blink3.pollen__run = new $$Ref('test27_Blink3_pollen__run__E');
    Blink3.delay = new $$Ref('test27_Blink3_delay__I');
    Blink3.$$hostInit = function() {
        var $$text = '';
        var $$v = 'test27_AvrPin';
        var $$s = $$bind($units['test27.Blink3'], 'pin', $$v);{ $$v.pollen$used = true;
        $units['test27.AvrPin'].pollen$used = true;}


        return $$text;
    }
    Blink3.pollen__uses__ = function() {
        $$bind($units['test27.AvrPin'], 'pollen$used', true);
    }
    Blink3.$$privateInit = function() {
        Blink3.pin = 0;
    }
    return Blink3;
}
var $$u = $$c();
$units['test27.Blink3'] = $$u;
$units.push($$u);

