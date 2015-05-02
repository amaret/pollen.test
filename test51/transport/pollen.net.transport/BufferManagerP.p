package pollen.net.transport

import Buffer


protocol BufferManagerP {


    public uint8[] getBuffer() 

    public uint16 getSize() 

    public uint16 getDataLength() 

    public setDataLength( uint16 len ) 

    public freeBuffer( ) 

    public uint8[] getEmptyBuffer() 

    public bool hasEmptyBuffer() 
}
