package em.net.transport

from em.net.transport import BufferManagerProviderI
    
module SingleBufferManager implements BufferManagerProviderI {    
}

private {
    
    def type Buffer: struct {
        dlen: UInt16
        buffer: UInt8[]
    }    
    
    var buf: Buffer
    var bufUsed: Bool
}

def em$construct() {

    buf.initH(maxBufferSize)
    bufUsed = false    

    for (i: UInt16 = 0; i < maxBufferSize; i++) {
        buf.buffer[i] = 0
    }
}

def Buffer.getBuffer() {
    return this.buffer    
}

def Buffer.getDataLength() {
    return this.dlen
}

def Buffer.getSize() {
    return maxBufferSize
}

def Buffer.initH( size ) {
    this.buffer.length = size
    this.dlen = 0
}

def Buffer.setDataLength( len ) {
    this.dlen = len
}

def freeBuffer( buf ) {
    bufUsed = false
}

def getEmptyBuffer() {

    if (!bufUsed) {
        bufUsed = true 
        return <Buffer&> buf
    } else {
        return <Buffer&> null
    }
}

def hasEmptyBuffer() {
    return !bufUsed
}

