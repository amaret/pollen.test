package pollen.net.transport

from pollen.net.transport import BufferManagerP
from pollen.net.transport import BufferManagerProviderP

module BufferManager implements BufferManagerP {

    BufferManagerProviderP provider

    public uint16 getSize() {
        return provider.getSize()
    }

    public uint8[] getBuffer() {
        return provider.getBuffer()
    }

    public uint16 getDataLength() {
        return provider.getDataLength()
    }

    public setDataLength( uint16 len ) {
        provider.setDataLength(len)
    }

    public freeBuffer( ) {
        provider.freeBuffer()
    }

    public uint8[] getEmptyBuffer() {
        return provider.getEmptyBuffer()
    }

    public bool hasEmptyBuffer() {
        return provider.hasEmptyBuffer()
    }
}
