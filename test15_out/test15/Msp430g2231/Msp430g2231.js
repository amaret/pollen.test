
/*
 * ======== MODULE test15.Msp430g2231 ========
 */

var $$c = function() {
    const Msp430g2231 = {};
    Msp430g2231.Msp430g2231 = Msp430g2231
    Msp430g2231.$name = 'test15.Msp430g2231';
    Msp430g2231.pollen$used = 0;
    Msp430g2231.reset = new $$Ref('test15_Msp430g2231_reset__E');
    Msp430g2231.shutdown = new $$Ref('test15_Msp430g2231_shutdown__E');
    Msp430g2231.pollen__run = new $$Ref('test15_Msp430g2231_pollen__run__E');
    Msp430g2231.wait = new $$Ref('test15_Msp430g2231_wait__E');
    Msp430g2231.nop = new $$Ref('test15_Msp430g2231_nop__E');
    Msp430g2231.targetInit = new $$Ref('test15_Msp430g2231_targetInit__I');
    Msp430g2231.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Msp430g2231.pollen__uses__ = function() {
    }
    Msp430g2231.$$privateInit = function() {
        Msp430g2231.mclkFrequency = 1000000;
        Msp430g2231.smclkFrequency = 1000000;
        Msp430g2231.aclkFrequency = 0;
    }
    return Msp430g2231;
}
var $$u = $$c();
$units['test15.Msp430g2231'] = $$u;
$units.push($$u);

