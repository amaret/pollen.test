package em.net.transport

interface BufferManagerI {

    type Buffer: opaque {
        function getBuffer(): UInt8[]
        function getSize(): UInt16
        function getDataLength(): UInt16
        host function initH( size: UInt16 ): Void
        function setDataLength( len: UInt16 ): Void        
    }

    function freeBuffer( buf: Buffer& ): Void
    function getEmptyBuffer(): Buffer&
    function hasEmptyBuffer(): Bool
}
