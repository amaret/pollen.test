
/*
 * ======== MODULE local.mcu.ConsolePrint ========
 */

var $$c = function() {
    const ConsolePrint = {};
    ConsolePrint.ConsolePrint = ConsolePrint
    ConsolePrint.$name = 'local.mcu.ConsolePrint';
    ConsolePrint.pollen$used = 0;
    ConsolePrint.printBool = new $$Ref('local_mcu_ConsolePrint_printBool__E');
    ConsolePrint.printInt = new $$Ref('local_mcu_ConsolePrint_printInt__E');
    ConsolePrint.printReal = new $$Ref('local_mcu_ConsolePrint_printReal__E');
    ConsolePrint.printUint = new $$Ref('local_mcu_ConsolePrint_printUint__E');
    ConsolePrint.printStr = new $$Ref('local_mcu_ConsolePrint_printStr__E');
    ConsolePrint.targetInit = new $$Ref('local_mcu_ConsolePrint_targetInit__I');
    ConsolePrint.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    ConsolePrint.pollen__uses__ = function() {
    }
    ConsolePrint.$$privateInit = function() {
        ConsolePrint.HEADER = "\033[95m";
        ConsolePrint.OKBLUE = "\033[94m";
        ConsolePrint.OKGREEN = "\033[92m";
        ConsolePrint.WARNING = "\033[93m";
        ConsolePrint.FAIL = "\033[91m";
        ConsolePrint.ENDC = "\033[0m";
    }
    return ConsolePrint;
}
var $$u = $$c();
$units['local.mcu.ConsolePrint'] = $$u;
$units.push($$u);

