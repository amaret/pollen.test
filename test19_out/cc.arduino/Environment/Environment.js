
/*
 * ======== COMPOSITION cc.arduino.Environment ========
 */

var $$c = function() {
    const Environment = {};
    Environment.Environment = Environment
    Environment.$name = 'cc.arduino.Environment';
    Environment.pollen$used = 0;
    Environment.PrintImpl = $units['cc.arduino.PrintImpl'];
    Environment.$$hostInit = function() {
        var $$text = '';
        var $$v = 'cc_arduino_PrintImpl';
        var $$s = $$bind($units['cc.arduino.Environment'], 'pollenPrintProxy', $$v);{ $$v.pollen$used = true;
        $units['cc.arduino.PrintImpl'].pollen$used = true;}


        return $$text;
    }
    return Environment;
}
var $$u = $$c();
$units['cc.arduino.Environment'] = $$u;
$units.push($$u);

