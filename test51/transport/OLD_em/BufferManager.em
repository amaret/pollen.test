package em.net.transport

from em.net.transport import BufferManagerI
from em.net.transport import BufferManagerProviderI

module BufferManager implements BufferManagerI {

    proxy Provider implements BufferManagerProviderI
}

private {

    def type Buffer: struct {
        base: Provider.Buffer
    }
}

def Buffer.getBuffer() {
    return this.base.getBuffer()    
}

def Buffer.getSize() {
    return this.base.getSize()
}

def Buffer.getDataLength() {
    return this.base.getDataLength()
}

def Buffer.initH( size ) {
    this.base.initH(size)
}

def Buffer.setDataLength( len ) {
    this.base.setDataLength(len)
}

def freeBuffer( buf ) {
    Provider.freeBuffer(<Provider.Buffer*>buf)
}

def getEmptyBuffer() {
    return <Buffer&> Provider.getEmptyBuffer()	
}

def hasEmptyBuffer() {
    return Provider.hasEmptyBuffer()
}
