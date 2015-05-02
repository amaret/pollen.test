
/*
 * ======== COMPOSITION cc.arduino.ArduinoWithoutMeta ========
 */

var $$c = function() {
    const ArduinoWithoutMeta = {};
    ArduinoWithoutMeta.ArduinoWithoutMeta = ArduinoWithoutMeta
    ArduinoWithoutMeta.$name = 'cc.arduino.ArduinoWithoutMeta';
    ArduinoWithoutMeta.pollen$used = 0;
    ArduinoWithoutMeta.Mcu = $units['atmel.atmega328.Mcu'];
    ArduinoWithoutMeta.D13 = $units['atmel.atmega328.PB5'];
    ArduinoWithoutMeta.TestPin = $units['atmel.atmega328.PB5'];
    ArduinoWithoutMeta.Arduino = function() {
        var $$text = '';
        $units['atmel.atmega328.Mcu'].setFrequencyOnHost(16000000);
        return $$text;
    }
    return ArduinoWithoutMeta;
}
var $$u = $$c();
$units['cc.arduino.ArduinoWithoutMeta'] = $$u;
$units.push($$u);

