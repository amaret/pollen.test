package pollen.net.transport

from pollen.net.transport import BufferManagerProviderP
from pollen.net.transport import Buffer

module SingleBufferManager implements BufferManagerProviderP {

    host new Buffer buf2()
    host Buffer buf
    bool bufUsed

    host SingleBufferManager() {
        buf = new Buffer()
        bufUsed = false
    }

    public uint8[] getBuffer() {
        return buf.getBuffer()
    }

    public uint16 getDataLength() {
        return buf.getDataLength()
    }

    public setDataLength(uint16 s) {
        buf.setDataLength(s)
    }

    public uint16 getSize() {
        return buf.getSize()
    }

    public freeBuffer( ) {
        bufUsed = false
    }

    public uint8[] getEmptyBuffer() {

        if (!bufUsed) {
            bufUsed = true
            return getBuffer()
        } else {
            return null
        }
    }

    public bool hasEmptyBuffer() {
        return !bufUsed
    }

}
