import CommonDefines
import USBMode

module PipeStream {
  
  +{
    #ifndef __PipeStream_P__
    #define __PipeStream_P__
  }+

  +{
    
  /* Public Interface - May be used in end-application: */
    /* Enums: */
      /** Enum for the possible error return codes of the Pipe_*_Stream_* functions. */
      enum Pipe_Stream_RW_ErrorCodes_t
      {
        PIPE_RWSTREAM_NoError            = 0, /**< Command completed successfully, no error. */
        PIPE_RWSTREAM_PipeStalled        = 1, /**< The device stalled the pipe during the transfer. */
        PIPE_RWSTREAM_DeviceDisconnected = 2, /**< Device was disconnected from the host during
                                                 *   the transfer.
                                                 */
        PIPE_RWSTREAM_Timeout            = 3, /**< The device failed to accept or send the next packet
                                               *   within the software timeout period set by the
                                               *   \ref USB_STREAM_TIMEOUT_MS macro.
                                               */
        PIPE_RWSTREAM_IncompleteTransfer = 4, /**< Indicates that the pipe bank became full/empty before the
                                               *   complete contents of the stream could be transferred.
                                               */
      };

  /* Architecture Includes: */
    #if (ARCH == ARCH_AVR8)
      #include "AVR8/PipeStream_AVR8.h"
    #elif (ARCH == ARCH_UC3)
      #include "UC3/PipeStream_UC3.h"
    #endif

  }+

  +{ #endif /* __PipeStream_P__ */ }+
}