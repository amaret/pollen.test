import CommonDefines
import USBMode

module Pipe {

  +{
    #ifndef __Pipe_P__
    #define __Pipe_P__
  }+

  +{
    
  /* Public Interface - May be used in end-application: */
    /* Type Defines: */
      /** Type define for a pipe table entry, used to configure pipes in groups via
       *  \ref Pipe_ConfigurePipeTable().
       */
      typedef struct
      {
        uint8_t  Address; /**< Address of the pipe to configure, or zero if the table entry is to be unused. */
        uint16_t Size; /**< Size of the pipe bank, in bytes. */
        uint8_t  EndpointAddress; /**< Address of the endpoint in the connected device. */
        uint8_t  Type; /**< Type of the endpoint, a \c EP_TYPE_* mask. */
        uint8_t  Banks; /**< Number of hardware banks to use for the pipe. */
      } USB_Pipe_Table_t;

    /* Macros: */
      /** Pipe address for the default control pipe, which always resides in address 0. This is
       *  defined for convenience to give more readable code when used with the pipe macros.
       */
      #define PIPE_CONTROLPIPE                0

      /** Pipe number mask, for masking against pipe addresses to retrieve the pipe's numerical address
       *  in the device.
       */
      #define PIPE_PIPENUM_MASK               0x0F

      /** Endpoint number mask, for masking against endpoint addresses to retrieve the endpoint's
       *  numerical address in the attached device.
       */
      #define PIPE_EPNUM_MASK                 0x0F

  /* Architecture Includes: */
    #if (ARCH == ARCH_AVR8)
      #include "AVR8/Pipe_AVR8.h"
//    #elif (ARCH == ARCH_XMEGA)
//      #include "XMEGA/Pipe_XMEGA.h"
    #endif

  }+

  +{ #endif /* __Pipe_P__ */ }+

}