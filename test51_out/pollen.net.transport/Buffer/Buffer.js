
/*
 * ======== CLASS pollen.net.transport.Buffer ========
 */

var $$c = function() {
    const Buffer = {};
    Buffer.Buffer = Buffer
    Buffer.$name = 'pollen.net.transport.Buffer';
    Buffer.pollen$used = 0;
    Buffer.Buffer$$id = 1;
    Buffer.Buffer = function(cn) {
        this.$$id = Buffer.Buffer$$id++;
        this.$$cname = cn ? cn : 'pollen_net_transport_Buffer_Buffer__'+this.$$id+'__S';
        this.$$tname = 'pollen_net_transport_Buffer_Buffer';
        this.$$uname = 'pollen.net.transport.Buffer';
        this.dlen = 0;
        this.maxBufferSize = 62;
    }
    Buffer.Buffer.prototype = new $$Struct('pollen.net.transport.Buffer.Buffer');
    Buffer.Buffer.prototype.$$isAggFld = {};
    Buffer.Buffer.prototype.$$isAggFld.dlen = false;
    Buffer.Buffer.prototype.$$isAggFld.maxBufferSize = false;
    Buffer.Buffer.prototype.$$isAggFld.buffer = true;
    Buffer.Buffer.prototype.new_host = function() {
        var $$text = '';
        var i;
        this.$$privateInit();
        for (i = 0; (i) < (this.maxBufferSize); (i)++) {
            (this.buffer).set((i), 0);
        }
        this.$$hostInitLastPass();
        return this;
    }
    Buffer.pollen__uses__ = function() {
    }
    Buffer.Buffer.prototype.$$privateInit = function() {
        this.dlen = 0;
        this.maxBufferSize = 124;
    }
    Buffer.Buffer.prototype.$$hostInitLastPass = function() {
        this.buffer = new $$Array((this.maxBufferSize), function($$cn,$$idx){ return 0;}, 'pollen_net_transport_Buffer_buffer__A', false);
    }
    return Buffer;
}
var $$u = $$c();
$units['pollen.net.transport.Buffer'] = $$u;
$units.push($$u);

