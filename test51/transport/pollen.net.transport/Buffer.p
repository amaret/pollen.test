package pollen.net.transport

class Buffer {
    uint16 dlen = 0
    host uint16 maxBufferSize = 62 // can override in clients via preset
    //host uint8 buffer[maxBufferSize] 
    uint8 buffer[maxBufferSize] 

    public uint8[] getBuffer() {
        return @buffer
    }

    public uint16 getDataLength() {
        return @dlen
    }

    public  setDataLength(uint16 s) {
        @dlen = s
    }

    public uint16 getSize() {
        return @maxBufferSize
    }

    public host Buffer() {
        for (uint16 i = 0; i < maxBufferSize; i++) {
            buffer[i] = 0
        }
    }
}


