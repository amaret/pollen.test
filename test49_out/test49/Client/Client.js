
/*
 * ======== MODULE test49.Client ========
 */

var $$c = function() {
    const Client = {};
    Client.Client = Client
    Client.$name = 'test49.Client';
    Client.pollen$used = 0;
    Client.Event_uint8 = $units['test49.Event_uint8'];
    Client.EFactory = $units['test49.EFactory'];
    Client.targetInit = new $$Ref('test49_Client_targetInit__E');
    Client.handle = new $$Ref('test49_Client_handle__E');
    Client.pollen__run = new $$Ref('test49_Client_pollen__run__E');
    Client.$$hostInit = function() {
        var $$text = '';
        Client.e = 0;
        (Client.x) = 7;
        return $$text;
    }
    Client.pollen__uses__ = function() {
    }
    Client.$$privateInit = function() {
        Client.econst = 8;
        Client.x = 0;
    }
    return Client;
}
var $$u = $$c();
$units['test49.Client'] = $$u;
$units.push($$u);

