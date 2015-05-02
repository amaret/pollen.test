
/*
 * ======== MODULE test29.Blink4 ========
 */

var $$c = function() {
    const Blink4 = {};
    Blink4.Blink4 = Blink4
    Blink4.$name = 'test29.Blink4';
    Blink4.pollen$used = 0;
    Blink4.AvrPin = $units['test29.AvrPin'];
    Blink4.Led = $units['test29.Led'];
    Blink4.pollen__run = new $$Ref('test29_Blink4_pollen__run__E');
    Blink4.delay = new $$Ref('test29_Blink4_delay__I');
    Blink4.targetInit = new $$Ref('test29_Blink4_targetInit__I');
    Blink4.$$hostInit = function() {
        var $$text = '';
        var $$v = 'test29_AvrPin';
        var $$s = $$bind($units['test29.Blink4'], 'Led.pin', $$v);{ $$v.pollen$used = true;
        $units['test29.AvrPin'].pollen$used = true;}


        return $$text;
    }
    Blink4.pollen__uses__ = function() {
        $$bind($units['test29.AvrPin'], 'pollen$used', true);
        $$bind($units['test29.Led'], 'pollen$used', true);
    }
    Blink4.$$privateInit = function() {
    }
    return Blink4;
}
var $$u = $$c();
$units['test29.Blink4'] = $$u;
$units.push($$u);

