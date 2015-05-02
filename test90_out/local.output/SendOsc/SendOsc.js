
/*
 * ======== MODULE local.output.SendOsc ========
 */

var $$c = function() {
    const SendOsc = {};
    SendOsc.SendOsc = SendOsc
    SendOsc.$name = 'local.output.SendOsc';
    SendOsc.pollen$used = 0;
    SendOsc.Text = $units['pollen.text.Text'];
    SendOsc.sendRGB = new $$Ref('local_output_SendOsc_sendRGB__E');
    SendOsc.sprint = new $$Ref('local_output_SendOsc_sprint__I');
    SendOsc.targetInit = new $$Ref('local_output_SendOsc_targetInit__I');
    SendOsc.$$hostInit = function() {
        var $$text = '';
        SendOsc.data = new $$Array(50, function($$cn,$$idx){ return 0;}, 'local_output_SendOsc_data__A', false); SendOsc.data.$$assign((new $$Array(50, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]));
        return $$text;
    }
    SendOsc.pollen__uses__ = function() {
        $$bind($units['pollen.text.Text'], 'pollen$used', true);
    }
    SendOsc.$$privateInit = function() {
        SendOsc.header = "oscsend 127.0.0.1 7000 /led/1 iii ";
        SendOsc.data = new $$Array(50, function($$cn,$$idx){ return 0;}, 'local_output_SendOsc_data__A', false); SendOsc.data.$$assign((new $$Array(50, function($$cn,$$idx){ return 0;}, '__new_'+($$Array.$$idx++)+'__A', false)).$$assign([ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]));
    }
    return SendOsc;
}
var $$u = $$c();
$units['local.output.SendOsc'] = $$u;
$units.push($$u);

