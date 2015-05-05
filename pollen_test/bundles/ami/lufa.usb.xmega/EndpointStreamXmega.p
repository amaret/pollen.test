from lufa.usb import CommonDefines
from lufa.usb import USBMode
from lufa.usb import USBTask

from lufa.usb import EndpointDefines

module EndpointStreamXmega {
  
  +{
    #ifndef __EndpointStreamXmega_P__
    #define __EndpointStreamXmega_P__
  }+

  +{
    #if (ARCH == ARCH_XMEGA) && defined(USB_CAN_BE_DEVICE)
  }+

  //////////////////////////////////////////
  // EndpointStream_XMEGA.h
  //////////////////////////////////////////

 
  //////////////////////////////////////////
  // EndpointStream_XMEGA.c
  //////////////////////////////////////////

  +{
    #if !defined(CONTROL_ONLY_DEVICE)
      uint8_t Endpoint_Discard_Stream(uint16_t Length,
                                      uint16_t* const BytesProcessed)
      {
        uint8_t  ErrorCode;
        uint16_t BytesInTransfer = 0;
        
        if ((ErrorCode = Endpoint_WaitUntilReady()))
          return ErrorCode;
          
        if (BytesProcessed != NULL)
          Length -= *BytesProcessed;

        while (Length)
        {
          if (!(Endpoint_IsReadWriteAllowed()))
          {
            Endpoint_ClearOUT();

            if (BytesProcessed != NULL)
            {
              *BytesProcessed += BytesInTransfer;
              return ENDPOINT_RWSTREAM_IncompleteTransfer;
            }

            if ((ErrorCode = Endpoint_WaitUntilReady()))
              return ErrorCode;
          }
          else
          {
            Endpoint_Discard_8();

            Length--;
            BytesInTransfer++;
          }
        }
        
        return ENDPOINT_RWSTREAM_NoError;
      }

      uint8_t Endpoint_Null_Stream(uint16_t Length,
                                   uint16_t* const BytesProcessed)
      {
        uint8_t  ErrorCode;
        uint16_t BytesInTransfer = 0;
        
        if ((ErrorCode = Endpoint_WaitUntilReady()))
          return ErrorCode;
          
        if (BytesProcessed != NULL)
          Length -= *BytesProcessed;

        while (Length)
        {
          if (!(Endpoint_IsReadWriteAllowed()))
          {
            Endpoint_ClearIN();

            if (BytesProcessed != NULL)
            {
              *BytesProcessed += BytesInTransfer;
              return ENDPOINT_RWSTREAM_IncompleteTransfer;
            }

            if ((ErrorCode = Endpoint_WaitUntilReady()))
              return ErrorCode;
          }
          else
          {
            Endpoint_Write_8(0);

            Length--;
            BytesInTransfer++;
          }
        }
        
        return ENDPOINT_RWSTREAM_NoError;
      }

      #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_Stream_LE
      #define  TEMPLATE_BUFFER_TYPE                      const void*
      #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearIN()
      #define  TEMPLATE_BUFFER_OFFSET(Length)            0
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(*BufferPtr)
      uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
      {
        uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
        uint16_t BytesInTransfer = 0;
        uint8_t  ErrorCode;

        if ((ErrorCode = Endpoint_WaitUntilReady()))
          return ErrorCode;

        if (BytesProcessed != NULL)
        {
          Length -= *BytesProcessed;
          TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
        }

        while (Length)
        {
          if (!(Endpoint_IsReadWriteAllowed()))
          {
            TEMPLATE_CLEAR_ENDPOINT();

            #if !defined(INTERRUPT_CONTROL_ENDPOINT)
            USB_USBTask();
            #endif

            if (BytesProcessed != NULL)
            {
              *BytesProcessed += BytesInTransfer;
              return ENDPOINT_RWSTREAM_IncompleteTransfer;
            }

            if ((ErrorCode = Endpoint_WaitUntilReady()))
              return ErrorCode;
          }
          else
          {
            TEMPLATE_TRANSFER_BYTE(DataStream);
            TEMPLATE_BUFFER_MOVE(DataStream, 1);
            Length--;
            BytesInTransfer++;
          }
        }

        return ENDPOINT_RWSTREAM_NoError;
      }
      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE



      #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_Stream_BE
      #define  TEMPLATE_BUFFER_TYPE                      const void*
      #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearIN()
      #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(*BufferPtr)
      uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
      {
        uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
        uint16_t BytesInTransfer = 0;
        uint8_t  ErrorCode;

        if ((ErrorCode = Endpoint_WaitUntilReady()))
          return ErrorCode;

        if (BytesProcessed != NULL)
        {
          Length -= *BytesProcessed;
          TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
        }

        while (Length)
        {
          if (!(Endpoint_IsReadWriteAllowed()))
          {
            TEMPLATE_CLEAR_ENDPOINT();

            #if !defined(INTERRUPT_CONTROL_ENDPOINT)
            USB_USBTask();
            #endif

            if (BytesProcessed != NULL)
            {
              *BytesProcessed += BytesInTransfer;
              return ENDPOINT_RWSTREAM_IncompleteTransfer;
            }

            if ((ErrorCode = Endpoint_WaitUntilReady()))
              return ErrorCode;
          }
          else
          {
            TEMPLATE_TRANSFER_BYTE(DataStream);
            TEMPLATE_BUFFER_MOVE(DataStream, 1);
            Length--;
            BytesInTransfer++;
          }
        }

        return ENDPOINT_RWSTREAM_NoError;
      }
      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE


      #define  TEMPLATE_FUNC_NAME                        Endpoint_Read_Stream_LE
      #define  TEMPLATE_BUFFER_TYPE                      void*
      #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearOUT()
      #define  TEMPLATE_BUFFER_OFFSET(Length)            0
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         *BufferPtr = Endpoint_Read_8()
      uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
      {
        uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
        uint16_t BytesInTransfer = 0;
        uint8_t  ErrorCode;

        if ((ErrorCode = Endpoint_WaitUntilReady()))
          return ErrorCode;

        if (BytesProcessed != NULL)
        {
          Length -= *BytesProcessed;
          TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
        }

        while (Length)
        {
          if (!(Endpoint_IsReadWriteAllowed()))
          {
            TEMPLATE_CLEAR_ENDPOINT();

            #if !defined(INTERRUPT_CONTROL_ENDPOINT)
            USB_USBTask();
            #endif

            if (BytesProcessed != NULL)
            {
              *BytesProcessed += BytesInTransfer;
              return ENDPOINT_RWSTREAM_IncompleteTransfer;
            }

            if ((ErrorCode = Endpoint_WaitUntilReady()))
              return ErrorCode;
          }
          else
          {
            TEMPLATE_TRANSFER_BYTE(DataStream);
            TEMPLATE_BUFFER_MOVE(DataStream, 1);
            Length--;
            BytesInTransfer++;
          }
        }

        return ENDPOINT_RWSTREAM_NoError;
      }
      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE


      #define  TEMPLATE_FUNC_NAME                        Endpoint_Read_Stream_BE
      #define  TEMPLATE_BUFFER_TYPE                      void*
      #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearOUT()
      #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         *BufferPtr = Endpoint_Read_8()
      uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
      {
        uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
        uint16_t BytesInTransfer = 0;
        uint8_t  ErrorCode;

        if ((ErrorCode = Endpoint_WaitUntilReady()))
          return ErrorCode;

        if (BytesProcessed != NULL)
        {
          Length -= *BytesProcessed;
          TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
        }

        while (Length)
        {
          if (!(Endpoint_IsReadWriteAllowed()))
          {
            TEMPLATE_CLEAR_ENDPOINT();

            #if !defined(INTERRUPT_CONTROL_ENDPOINT)
            USB_USBTask();
            #endif

            if (BytesProcessed != NULL)
            {
              *BytesProcessed += BytesInTransfer;
              return ENDPOINT_RWSTREAM_IncompleteTransfer;
            }

            if ((ErrorCode = Endpoint_WaitUntilReady()))
              return ErrorCode;
          }
          else
          {
            TEMPLATE_TRANSFER_BYTE(DataStream);
            TEMPLATE_BUFFER_MOVE(DataStream, 1);
            Length--;
            BytesInTransfer++;
          }
        }

        return ENDPOINT_RWSTREAM_NoError;
      }
      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE


      #if defined(ARCH_HAS_FLASH_ADDRESS_SPACE)
        #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_PStream_LE
        #define  TEMPLATE_BUFFER_TYPE                      const void*
        #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearIN()
        #define  TEMPLATE_BUFFER_OFFSET(Length)            0
        #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
        #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(pgm_read_byte(BufferPtr))
        uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
        {
          uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
          uint16_t BytesInTransfer = 0;
          uint8_t  ErrorCode;

          if ((ErrorCode = Endpoint_WaitUntilReady()))
            return ErrorCode;

          if (BytesProcessed != NULL)
          {
            Length -= *BytesProcessed;
            TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
          }

          while (Length)
          {
            if (!(Endpoint_IsReadWriteAllowed()))
            {
              TEMPLATE_CLEAR_ENDPOINT();

              #if !defined(INTERRUPT_CONTROL_ENDPOINT)
              USB_USBTask();
              #endif

              if (BytesProcessed != NULL)
              {
                *BytesProcessed += BytesInTransfer;
                return ENDPOINT_RWSTREAM_IncompleteTransfer;
              }

              if ((ErrorCode = Endpoint_WaitUntilReady()))
                return ErrorCode;
            }
            else
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInTransfer++;
            }
          }

          return ENDPOINT_RWSTREAM_NoError;
        }
        #undef TEMPLATE_FUNC_NAME
        #undef TEMPLATE_BUFFER_TYPE
        #undef TEMPLATE_TRANSFER_BYTE
        #undef TEMPLATE_CLEAR_ENDPOINT
        #undef TEMPLATE_BUFFER_OFFSET
        #undef TEMPLATE_BUFFER_MOVE


        #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_PStream_BE
        #define  TEMPLATE_BUFFER_TYPE                      const void*
        #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearIN()
        #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
        #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
        #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(pgm_read_byte(BufferPtr))
        uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                    uint16_t Length,
                                    uint16_t* const BytesProcessed)
        {
          uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
          uint16_t BytesInTransfer = 0;
          uint8_t  ErrorCode;

          if ((ErrorCode = Endpoint_WaitUntilReady()))
            return ErrorCode;

          if (BytesProcessed != NULL)
          {
            Length -= *BytesProcessed;
            TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
          }

          while (Length)
          {
            if (!(Endpoint_IsReadWriteAllowed()))
            {
              TEMPLATE_CLEAR_ENDPOINT();

              #if !defined(INTERRUPT_CONTROL_ENDPOINT)
              USB_USBTask();
              #endif

              if (BytesProcessed != NULL)
              {
                *BytesProcessed += BytesInTransfer;
                return ENDPOINT_RWSTREAM_IncompleteTransfer;
              }

              if ((ErrorCode = Endpoint_WaitUntilReady()))
                return ErrorCode;
            }
            else
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInTransfer++;
            }
          }

          return ENDPOINT_RWSTREAM_NoError;
        }
        #undef TEMPLATE_FUNC_NAME
        #undef TEMPLATE_BUFFER_TYPE
        #undef TEMPLATE_TRANSFER_BYTE
        #undef TEMPLATE_CLEAR_ENDPOINT
        #undef TEMPLATE_BUFFER_OFFSET
        #undef TEMPLATE_BUFFER_MOVE
      #endif

      #if defined(ARCH_HAS_EEPROM_ADDRESS_SPACE)
        #undef TEMPLATE_FUNC_NAME
        #undef TEMPLATE_BUFFER_TYPE
        #undef TEMPLATE_TRANSFER_BYTE
        #undef TEMPLATE_CLEAR_ENDPOINT
        #undef TEMPLATE_BUFFER_OFFSET
        #undef TEMPLATE_BUFFER_MOVE

        #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_EStream_LE
        #define  TEMPLATE_BUFFER_TYPE                      const void*
        #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearIN()
        #define  TEMPLATE_BUFFER_OFFSET(Length)            0
        #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
        #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(eeprom_read_byte(BufferPtr))
        uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
        {
          uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
          uint16_t BytesInTransfer = 0;
          uint8_t  ErrorCode;

          if ((ErrorCode = Endpoint_WaitUntilReady()))
            return ErrorCode;

          if (BytesProcessed != NULL)
          {
            Length -= *BytesProcessed;
            TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
          }

          while (Length)
          {
            if (!(Endpoint_IsReadWriteAllowed()))
            {
              TEMPLATE_CLEAR_ENDPOINT();

              #if !defined(INTERRUPT_CONTROL_ENDPOINT)
              USB_USBTask();
              #endif

              if (BytesProcessed != NULL)
              {
                *BytesProcessed += BytesInTransfer;
                return ENDPOINT_RWSTREAM_IncompleteTransfer;
              }

              if ((ErrorCode = Endpoint_WaitUntilReady()))
                return ErrorCode;
            }
            else
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInTransfer++;
            }
          }

          return ENDPOINT_RWSTREAM_NoError;
        }
        #undef TEMPLATE_FUNC_NAME
        #undef TEMPLATE_BUFFER_TYPE
        #undef TEMPLATE_TRANSFER_BYTE
        #undef TEMPLATE_CLEAR_ENDPOINT
        #undef TEMPLATE_BUFFER_OFFSET
        #undef TEMPLATE_BUFFER_MOVE

        #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_EStream_BE
        #define  TEMPLATE_BUFFER_TYPE                      const void*
        #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearIN()
        #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
        #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
        #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(eeprom_read_byte(BufferPtr))
        uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
        {
          uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
          uint16_t BytesInTransfer = 0;
          uint8_t  ErrorCode;

          if ((ErrorCode = Endpoint_WaitUntilReady()))
            return ErrorCode;

          if (BytesProcessed != NULL)
          {
            Length -= *BytesProcessed;
            TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
          }

          while (Length)
          {
            if (!(Endpoint_IsReadWriteAllowed()))
            {
              TEMPLATE_CLEAR_ENDPOINT();

              #if !defined(INTERRUPT_CONTROL_ENDPOINT)
              USB_USBTask();
              #endif

              if (BytesProcessed != NULL)
              {
                *BytesProcessed += BytesInTransfer;
                return ENDPOINT_RWSTREAM_IncompleteTransfer;
              }

              if ((ErrorCode = Endpoint_WaitUntilReady()))
                return ErrorCode;
            }
            else
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInTransfer++;
            }
          }

          return ENDPOINT_RWSTREAM_NoError;
        }

        #undef TEMPLATE_FUNC_NAME
        #undef TEMPLATE_BUFFER_TYPE
        #undef TEMPLATE_TRANSFER_BYTE
        #undef TEMPLATE_CLEAR_ENDPOINT
        #undef TEMPLATE_BUFFER_OFFSET
        #undef TEMPLATE_BUFFER_MOVE

        #define  TEMPLATE_FUNC_NAME                        Endpoint_Read_EStream_LE
        #define  TEMPLATE_BUFFER_TYPE                      void*
        #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearOUT()
        #define  TEMPLATE_BUFFER_OFFSET(Length)            0
        #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
        #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         eeprom_update_byte(BufferPtr, Endpoint_Read_8())
        uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
        {
          uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
          uint16_t BytesInTransfer = 0;
          uint8_t  ErrorCode;

          if ((ErrorCode = Endpoint_WaitUntilReady()))
            return ErrorCode;

          if (BytesProcessed != NULL)
          {
            Length -= *BytesProcessed;
            TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
          }

          while (Length)
          {
            if (!(Endpoint_IsReadWriteAllowed()))
            {
              TEMPLATE_CLEAR_ENDPOINT();

              #if !defined(INTERRUPT_CONTROL_ENDPOINT)
              USB_USBTask();
              #endif

              if (BytesProcessed != NULL)
              {
                *BytesProcessed += BytesInTransfer;
                return ENDPOINT_RWSTREAM_IncompleteTransfer;
              }

              if ((ErrorCode = Endpoint_WaitUntilReady()))
                return ErrorCode;
            }
            else
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInTransfer++;
            }
          }

          return ENDPOINT_RWSTREAM_NoError;
        }
        #undef TEMPLATE_FUNC_NAME
        #undef TEMPLATE_BUFFER_TYPE
        #undef TEMPLATE_TRANSFER_BYTE
        #undef TEMPLATE_CLEAR_ENDPOINT
        #undef TEMPLATE_BUFFER_OFFSET
        #undef TEMPLATE_BUFFER_MOVE


        #define  TEMPLATE_FUNC_NAME                        Endpoint_Read_EStream_BE
        #define  TEMPLATE_BUFFER_TYPE                      void*
        #define  TEMPLATE_CLEAR_ENDPOINT()                 Endpoint_ClearOUT()
        #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
        #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
        #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         eeprom_update_byte(BufferPtr, Endpoint_Read_8())
        uint8_t TEMPLATE_FUNC_NAME (TEMPLATE_BUFFER_TYPE const Buffer,
                                  uint16_t Length,
                                  uint16_t* const BytesProcessed)
        {
          uint8_t* DataStream      = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
          uint16_t BytesInTransfer = 0;
          uint8_t  ErrorCode;

          if ((ErrorCode = Endpoint_WaitUntilReady()))
            return ErrorCode;

          if (BytesProcessed != NULL)
          {
            Length -= *BytesProcessed;
            TEMPLATE_BUFFER_MOVE(DataStream, *BytesProcessed);
          }

          while (Length)
          {
            if (!(Endpoint_IsReadWriteAllowed()))
            {
              TEMPLATE_CLEAR_ENDPOINT();

              #if !defined(INTERRUPT_CONTROL_ENDPOINT)
              USB_USBTask();
              #endif

              if (BytesProcessed != NULL)
              {
                *BytesProcessed += BytesInTransfer;
                return ENDPOINT_RWSTREAM_IncompleteTransfer;
              }

              if ((ErrorCode = Endpoint_WaitUntilReady()))
                return ErrorCode;
            }
            else
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInTransfer++;
            }
          }

          return ENDPOINT_RWSTREAM_NoError;
        }
      #endif

    #endif

    #undef TEMPLATE_FUNC_NAME
    #undef TEMPLATE_BUFFER_TYPE
    #undef TEMPLATE_TRANSFER_BYTE
    #undef TEMPLATE_BUFFER_OFFSET
    #undef TEMPLATE_BUFFER_MOVE

    #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_Control_Stream_LE
    #define  TEMPLATE_BUFFER_OFFSET(Length)            0
    #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
    #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(*BufferPtr)
    uint8_t TEMPLATE_FUNC_NAME (const void* const Buffer,
                            uint16_t Length)
    {
      uint8_t* DataStream     = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
      bool     LastPacketFull = false;

      Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint | ENDPOINT_DIR_IN);

      if (Length > USB_ControlRequest.wLength)
        Length = USB_ControlRequest.wLength;
      else if (!(Length))
        Endpoint_ClearIN();

      while (Length || LastPacketFull)
      {
        uint8_t USB_DeviceState_LCL = USB_DeviceState;

        if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
          return ENDPOINT_RWCSTREAM_DeviceDisconnected;
        else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
          return ENDPOINT_RWCSTREAM_BusSuspended;
        else if (Endpoint_IsSETUPReceived())
          return ENDPOINT_RWCSTREAM_HostAborted;
        else if (Endpoint_IsOUTReceived())
          break;

        if (Endpoint_IsINReady())
        {
          uint16_t BytesInEndpoint = Endpoint_BytesInEndpoint();

          while (Length && (BytesInEndpoint < USB_Device_ControlEndpointSize))
          {
            TEMPLATE_TRANSFER_BYTE(DataStream);
            TEMPLATE_BUFFER_MOVE(DataStream, 1);
            Length--;
            BytesInEndpoint++;
          }

          LastPacketFull = (BytesInEndpoint == USB_Device_ControlEndpointSize);
          Endpoint_ClearIN();
        }
      }

      while (!(Endpoint_IsOUTReceived()))
      {
        uint8_t USB_DeviceState_LCL = USB_DeviceState;

        if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
          return ENDPOINT_RWCSTREAM_DeviceDisconnected;
        else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
          return ENDPOINT_RWCSTREAM_BusSuspended;
      }

      return ENDPOINT_RWCSTREAM_NoError;
    }
    #undef TEMPLATE_FUNC_NAME
    #undef TEMPLATE_BUFFER_TYPE
    #undef TEMPLATE_TRANSFER_BYTE
    #undef TEMPLATE_CLEAR_ENDPOINT
    #undef TEMPLATE_BUFFER_OFFSET
    #undef TEMPLATE_BUFFER_MOVE


    #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_Control_Stream_BE
    #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
    #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
    #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(*BufferPtr)
        uint8_t TEMPLATE_FUNC_NAME (const void* const Buffer,
                            uint16_t Length)
    {
      uint8_t* DataStream     = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
      bool     LastPacketFull = false;

      Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint | ENDPOINT_DIR_IN);

      if (Length > USB_ControlRequest.wLength)
        Length = USB_ControlRequest.wLength;
      else if (!(Length))
        Endpoint_ClearIN();

      while (Length || LastPacketFull)
      {
        uint8_t USB_DeviceState_LCL = USB_DeviceState;

        if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
          return ENDPOINT_RWCSTREAM_DeviceDisconnected;
        else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
          return ENDPOINT_RWCSTREAM_BusSuspended;
        else if (Endpoint_IsSETUPReceived())
          return ENDPOINT_RWCSTREAM_HostAborted;
        else if (Endpoint_IsOUTReceived())
          break;

        if (Endpoint_IsINReady())
        {
          uint16_t BytesInEndpoint = Endpoint_BytesInEndpoint();

          while (Length && (BytesInEndpoint < USB_Device_ControlEndpointSize))
          {
            TEMPLATE_TRANSFER_BYTE(DataStream);
            TEMPLATE_BUFFER_MOVE(DataStream, 1);
            Length--;
            BytesInEndpoint++;
          }

          LastPacketFull = (BytesInEndpoint == USB_Device_ControlEndpointSize);
          Endpoint_ClearIN();
        }
      }

      while (!(Endpoint_IsOUTReceived()))
      {
        uint8_t USB_DeviceState_LCL = USB_DeviceState;

        if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
          return ENDPOINT_RWCSTREAM_DeviceDisconnected;
        else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
          return ENDPOINT_RWCSTREAM_BusSuspended;
      }

      return ENDPOINT_RWCSTREAM_NoError;
    }
    #undef TEMPLATE_FUNC_NAME
    #undef TEMPLATE_BUFFER_TYPE
    #undef TEMPLATE_TRANSFER_BYTE
    #undef TEMPLATE_CLEAR_ENDPOINT
    #undef TEMPLATE_BUFFER_OFFSET
    #undef TEMPLATE_BUFFER_MOVE


    #define  TEMPLATE_FUNC_NAME                        Endpoint_Read_Control_Stream_LE
    #define  TEMPLATE_BUFFER_OFFSET(Length)            0
    #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
    #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         *BufferPtr = Endpoint_Read_8()
    uint8_t TEMPLATE_FUNC_NAME (void* const Buffer,
                                  uint16_t Length)
      {
        uint8_t* DataStream = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));

        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint & ~ENDPOINT_DIR_IN);

        if (!(Length))
          Endpoint_ClearOUT();

        while (Length)
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
          else if (Endpoint_IsSETUPReceived())
            return ENDPOINT_RWCSTREAM_HostAborted;

          if (Endpoint_IsOUTReceived())
          {
            while (Length && Endpoint_BytesInEndpoint())
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
            }

            Endpoint_ClearOUT();
          }
        }

        while (!(Endpoint_IsINReady()))
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
        }

        return ENDPOINT_RWCSTREAM_NoError;
      }
    #undef TEMPLATE_FUNC_NAME
    #undef TEMPLATE_BUFFER_TYPE
    #undef TEMPLATE_TRANSFER_BYTE
    #undef TEMPLATE_CLEAR_ENDPOINT
    #undef TEMPLATE_BUFFER_OFFSET
    #undef TEMPLATE_BUFFER_MOVE


    #define  TEMPLATE_FUNC_NAME                        Endpoint_Read_Control_Stream_BE
    #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
    #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
    #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         *BufferPtr = Endpoint_Read_8()
    uint8_t TEMPLATE_FUNC_NAME (void* const Buffer,
                                  uint16_t Length)
      {
        uint8_t* DataStream = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));

        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint & ~ENDPOINT_DIR_IN);

        if (!(Length))
          Endpoint_ClearOUT();

        while (Length)
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
          else if (Endpoint_IsSETUPReceived())
            return ENDPOINT_RWCSTREAM_HostAborted;

          if (Endpoint_IsOUTReceived())
          {
            while (Length && Endpoint_BytesInEndpoint())
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
            }

            Endpoint_ClearOUT();
          }
        }

        while (!(Endpoint_IsINReady()))
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
        }

        return ENDPOINT_RWCSTREAM_NoError;
      }

      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE

    #if defined(ARCH_HAS_FLASH_ADDRESS_SPACE)
      #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_Control_PStream_LE
      #define  TEMPLATE_BUFFER_OFFSET(Length)            0
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(pgm_read_byte(BufferPtr))
      uint8_t TEMPLATE_FUNC_NAME (const void* const Buffer,
                              uint16_t Length)
      {
        uint8_t* DataStream     = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
        bool     LastPacketFull = false;

        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint | ENDPOINT_DIR_IN);

        if (Length > USB_ControlRequest.wLength)
          Length = USB_ControlRequest.wLength;
        else if (!(Length))
          Endpoint_ClearIN();

        while (Length || LastPacketFull)
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
          else if (Endpoint_IsSETUPReceived())
            return ENDPOINT_RWCSTREAM_HostAborted;
          else if (Endpoint_IsOUTReceived())
            break;

          if (Endpoint_IsINReady())
          {
            uint16_t BytesInEndpoint = Endpoint_BytesInEndpoint();

            while (Length && (BytesInEndpoint < USB_Device_ControlEndpointSize))
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInEndpoint++;
            }

            LastPacketFull = (BytesInEndpoint == USB_Device_ControlEndpointSize);
            Endpoint_ClearIN();
          }
        }

        while (!(Endpoint_IsOUTReceived()))
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
        }

        return ENDPOINT_RWCSTREAM_NoError;
      }
      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE


      #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_Control_PStream_BE
      #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(pgm_read_byte(BufferPtr))
      uint8_t TEMPLATE_FUNC_NAME (const void* const Buffer, uint16_t Length)
      {
        uint8_t* DataStream     = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
        bool     LastPacketFull = false;

        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint | ENDPOINT_DIR_IN);

        if (Length > USB_ControlRequest.wLength)
          Length = USB_ControlRequest.wLength;
        else if (!(Length))
          Endpoint_ClearIN();

        while (Length || LastPacketFull)
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
          else if (Endpoint_IsSETUPReceived())
            return ENDPOINT_RWCSTREAM_HostAborted;
          else if (Endpoint_IsOUTReceived())
            break;

          if (Endpoint_IsINReady())
          {
            uint16_t BytesInEndpoint = Endpoint_BytesInEndpoint();

            while (Length && (BytesInEndpoint < USB_Device_ControlEndpointSize))
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInEndpoint++;
            }

            LastPacketFull = (BytesInEndpoint == USB_Device_ControlEndpointSize);
            Endpoint_ClearIN();
          }
        }

        while (!(Endpoint_IsOUTReceived()))
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
        }

        return ENDPOINT_RWCSTREAM_NoError;
      }
    #endif

    #undef TEMPLATE_FUNC_NAME
    #undef TEMPLATE_BUFFER_TYPE
    #undef TEMPLATE_TRANSFER_BYTE
    #undef TEMPLATE_CLEAR_ENDPOINT
    #undef TEMPLATE_BUFFER_OFFSET
    #undef TEMPLATE_BUFFER_MOVE


    #if defined(ARCH_HAS_EEPROM_ADDRESS_SPACE)
      #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_Control_EStream_LE
      #define  TEMPLATE_BUFFER_OFFSET(Length)            0
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(eeprom_read_byte(BufferPtr))
      uint8_t TEMPLATE_FUNC_NAME (const void* const Buffer,
                              uint16_t Length)
      {
        uint8_t* DataStream     = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
        bool     LastPacketFull = false;

        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint | ENDPOINT_DIR_IN);

        if (Length > USB_ControlRequest.wLength)
          Length = USB_ControlRequest.wLength;
        else if (!(Length))
          Endpoint_ClearIN();

        while (Length || LastPacketFull)
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
          else if (Endpoint_IsSETUPReceived())
            return ENDPOINT_RWCSTREAM_HostAborted;
          else if (Endpoint_IsOUTReceived())
            break;

          if (Endpoint_IsINReady())
          {
            uint16_t BytesInEndpoint = Endpoint_BytesInEndpoint();

            while (Length && (BytesInEndpoint < USB_Device_ControlEndpointSize))
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInEndpoint++;
            }

            LastPacketFull = (BytesInEndpoint == USB_Device_ControlEndpointSize);
            Endpoint_ClearIN();
          }
        }

        while (!(Endpoint_IsOUTReceived()))
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
        }

        return ENDPOINT_RWCSTREAM_NoError;
      }      

      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE

      #define  TEMPLATE_FUNC_NAME                        Endpoint_Write_Control_EStream_BE
      #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         Endpoint_Write_8(eeprom_read_byte(BufferPtr))
      uint8_t TEMPLATE_FUNC_NAME (const void* const Buffer,
                              uint16_t Length)
      {
        uint8_t* DataStream     = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));
        bool     LastPacketFull = false;

        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint | ENDPOINT_DIR_IN);

        if (Length > USB_ControlRequest.wLength)
          Length = USB_ControlRequest.wLength;
        else if (!(Length))
          Endpoint_ClearIN();

        while (Length || LastPacketFull)
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
          else if (Endpoint_IsSETUPReceived())
            return ENDPOINT_RWCSTREAM_HostAborted;
          else if (Endpoint_IsOUTReceived())
            break;

          if (Endpoint_IsINReady())
          {
            uint16_t BytesInEndpoint = Endpoint_BytesInEndpoint();

            while (Length && (BytesInEndpoint < USB_Device_ControlEndpointSize))
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
              BytesInEndpoint++;
            }

            LastPacketFull = (BytesInEndpoint == USB_Device_ControlEndpointSize);
            Endpoint_ClearIN();
          }
        }

        while (!(Endpoint_IsOUTReceived()))
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
        }

        return ENDPOINT_RWCSTREAM_NoError;
      }

      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE


      #define  TEMPLATE_FUNC_NAME                        Endpoint_Read_Control_EStream_LE
      #define  TEMPLATE_BUFFER_OFFSET(Length)            0
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr += Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         eeprom_update_byte(BufferPtr, Endpoint_Read_8())
      uint8_t TEMPLATE_FUNC_NAME (void* const Buffer,
                                  uint16_t Length)
      {
        uint8_t* DataStream = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));

        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint & ~ENDPOINT_DIR_IN);

        if (!(Length))
          Endpoint_ClearOUT();

        while (Length)
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
          else if (Endpoint_IsSETUPReceived())
            return ENDPOINT_RWCSTREAM_HostAborted;

          if (Endpoint_IsOUTReceived())
          {
            while (Length && Endpoint_BytesInEndpoint())
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
            }

            Endpoint_ClearOUT();
          }
        }

        while (!(Endpoint_IsINReady()))
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
        }

        return ENDPOINT_RWCSTREAM_NoError;
      }

      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE


      #define  TEMPLATE_FUNC_NAME                        Endpoint_Read_Control_EStream_BE
      #define  TEMPLATE_BUFFER_OFFSET(Length)            (Length - 1)
      #define  TEMPLATE_BUFFER_MOVE(BufferPtr, Amount)   BufferPtr -= Amount
      #define  TEMPLATE_TRANSFER_BYTE(BufferPtr)         eeprom_update_byte(BufferPtr, Endpoint_Read_8())
      uint8_t TEMPLATE_FUNC_NAME (void* const Buffer,
                                  uint16_t Length)
      {
        uint8_t* DataStream = ((uint8_t*)Buffer + TEMPLATE_BUFFER_OFFSET(Length));

        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint & ~ENDPOINT_DIR_IN);

        if (!(Length))
          Endpoint_ClearOUT();

        while (Length)
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
          else if (Endpoint_IsSETUPReceived())
            return ENDPOINT_RWCSTREAM_HostAborted;

          if (Endpoint_IsOUTReceived())
          {
            while (Length && Endpoint_BytesInEndpoint())
            {
              TEMPLATE_TRANSFER_BYTE(DataStream);
              TEMPLATE_BUFFER_MOVE(DataStream, 1);
              Length--;
            }

            Endpoint_ClearOUT();
          }
        }

        while (!(Endpoint_IsINReady()))
        {
          uint8_t USB_DeviceState_LCL = USB_DeviceState;

          if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
            return ENDPOINT_RWCSTREAM_DeviceDisconnected;
          else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
            return ENDPOINT_RWCSTREAM_BusSuspended;
        }

        return ENDPOINT_RWCSTREAM_NoError;
      }
      #undef TEMPLATE_FUNC_NAME
      #undef TEMPLATE_BUFFER_TYPE
      #undef TEMPLATE_TRANSFER_BYTE
      #undef TEMPLATE_CLEAR_ENDPOINT
      #undef TEMPLATE_BUFFER_OFFSET
      #undef TEMPLATE_BUFFER_MOVE

    #endif


  }+

  +{ #endif /* (ARCH == ARCH_XMEGA) && defined(USB_CAN_BE_DEVICE) */ }+

  +{ #endif /* __EndpointStreamXmega_P__ */ }+
}