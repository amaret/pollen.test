from lufa.usb import CommonDefines
from lufa.usb import EndpointDefines
from lufa.usb import USBTask
from lufa.usb import USBInterrupt
from lufa.usb import USBController

module EndpointXmega {
  
  +{
    #ifndef __EndpointXmega_P__
    #define __EndpointXmega_P__
  }+

  +{ 
    #if (ARCH == ARCH_XMEGA) && defined(USB_CAN_BE_DEVICE)
  }+

  //////////////////////////////////////////
  // Endpoint_XMEGA.h
  //////////////////////////////////////////

  +{

    /* Inline Functions: */


      /** Get the endpoint address of the currently selected endpoint. This is typically used to save
       *  the currently selected endpoint so that it can be restored after another endpoint has been
       *  manipulated.
       *
       *  \return Index of the currently selected endpoint.
       */
      static inline uint8_t Endpoint_GetCurrentEndpoint(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline uint8_t Endpoint_GetCurrentEndpoint(void)
      {
        return USB_Endpoint_SelectedEndpoint;
      }

      /** Aborts all pending IN transactions on the currently selected endpoint, once the bank
       *  has been queued for transmission to the host via \ref Endpoint_ClearIN(). This function
       *  will terminate all queued transactions, resetting the endpoint banks ready for a new
       *  packet.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       */
      static inline void Endpoint_AbortPendingIN(void)
      {
        USB_Endpoint_SelectedHandle->STATUS |= USB_EP_BUSNACK0_bm;
      }

      /** Determines if the currently selected endpoint is configured.
       *
       *  \return Boolean \c true if the currently selected endpoint has been configured, \c false otherwise.
       */
      static inline bool Endpoint_IsConfigured(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline bool Endpoint_IsConfigured(void)
      {
        return ((USB_Endpoint_SelectedHandle->CTRL & USB_EP_TYPE_gm) ? true : false);
      }

      /** Determines the currently selected endpoint's direction.
       *
       *  \return The currently selected endpoint's direction, as a \c ENDPOINT_DIR_* mask.
       */
      static inline uint8_t Endpoint_GetEndpointDirection(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline uint8_t Endpoint_GetEndpointDirection(void)
      {
        return (USB_Endpoint_SelectedEndpoint & ENDPOINT_DIR_IN);
      }

      /** Reads two bytes from the currently selected endpoint's bank in little endian format, for OUT
       *  direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \return Next two bytes in the currently selected endpoint's FIFO buffer.
       */
      static inline uint16_t Endpoint_Read_16_LE(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline uint16_t Endpoint_Read_16_LE(void)
      {
        uint16_t Byte0 = Endpoint_Read_8();
        uint16_t Byte1 = Endpoint_Read_8();

        return ((Byte1 << 8) | Byte0);
      }

      /** Reads two bytes from the currently selected endpoint's bank in big endian format, for OUT
       *  direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \return Next two bytes in the currently selected endpoint's FIFO buffer.
       */
      static inline uint16_t Endpoint_Read_16_BE(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline uint16_t Endpoint_Read_16_BE(void)
      {
        uint16_t Byte0 = Endpoint_Read_8();
        uint16_t Byte1 = Endpoint_Read_8();

        return ((Byte0 << 8) | Byte1);
      }

      /** Writes two bytes to the currently selected endpoint's bank in big endian format, for IN
       *  direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \param[in] Data  Data to write to the currently selected endpoint's FIFO buffer.
       */
      static inline void Endpoint_Write_16_BE(const uint16_t Data) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_Write_16_BE(const uint16_t Data)
      {
        Endpoint_Write_8(Data >> 8);
        Endpoint_Write_8(Data & 0xFF);
      }

      /** Discards two bytes from the currently selected endpoint's bank, for OUT direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       */
      static inline void Endpoint_Discard_16(void) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_Discard_16(void)
      {
        Endpoint_Discard_8();
        Endpoint_Discard_8();
      }

      /** Reads four bytes from the currently selected endpoint's bank in little endian format, for OUT
       *  direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \return Next four bytes in the currently selected endpoint's FIFO buffer.
       */
      static inline uint32_t Endpoint_Read_32_LE(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline uint32_t Endpoint_Read_32_LE(void)
      {
        uint32_t Byte0 = Endpoint_Read_8();
        uint32_t Byte1 = Endpoint_Read_8();
        uint32_t Byte2 = Endpoint_Read_8();
        uint32_t Byte3 = Endpoint_Read_8();

        return ((Byte3 << 24) | (Byte2 << 16) | (Byte1 << 8) | Byte0);
      }

      /** Reads four bytes from the currently selected endpoint's bank in big endian format, for OUT
       *  direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \return Next four bytes in the currently selected endpoint's FIFO buffer.
       */
      static inline uint32_t Endpoint_Read_32_BE(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline uint32_t Endpoint_Read_32_BE(void)
      {
        uint32_t Byte0 = Endpoint_Read_8();
        uint32_t Byte1 = Endpoint_Read_8();
        uint32_t Byte2 = Endpoint_Read_8();
        uint32_t Byte3 = Endpoint_Read_8();

        return ((Byte0 << 24) | (Byte1 << 16) | (Byte2 << 8) | Byte3);
      }

      /** Writes four bytes to the currently selected endpoint's bank in little endian format, for IN
       *  direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \param[in] Data  Data to write to the currently selected endpoint's FIFO buffer.
       */
      static inline void Endpoint_Write_32_LE(const uint32_t Data) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_Write_32_LE(const uint32_t Data)
      {
        Endpoint_Write_8(Data & 0xFF);
        Endpoint_Write_8(Data >> 8);
        Endpoint_Write_8(Data >> 16);
        Endpoint_Write_8(Data >> 24);
      }

      /** Writes four bytes to the currently selected endpoint's bank in big endian format, for IN
       *  direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \param[in] Data  Data to write to the currently selected endpoint's FIFO buffer.
       */
      static inline void Endpoint_Write_32_BE(const uint32_t Data) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_Write_32_BE(const uint32_t Data)
      {
        Endpoint_Write_8(Data >> 24);
        Endpoint_Write_8(Data >> 16);
        Endpoint_Write_8(Data >> 8);
        Endpoint_Write_8(Data & 0xFF);
      }

      /** Discards four bytes from the currently selected endpoint's bank, for OUT direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       */
      static inline void Endpoint_Discard_32(void) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_Discard_32(void)
      {
        Endpoint_Discard_8();
        Endpoint_Discard_8();
        Endpoint_Discard_8();
        Endpoint_Discard_8();
      }

  }+

  //////////////////////////////////////////
  // Endpoint_XMEGA.c
  //////////////////////////////////////////  

  +{
    #if !defined(FIXED_CONTROL_ENDPOINT_SIZE)
    uint8_t USB_Device_ControlEndpointSize = ENDPOINT_CONTROLEP_DEFAULT_SIZE;
    #endif

    Endpoint_FIFOPair_t       USB_Endpoint_FIFOs[ENDPOINT_TOTAL_ENDPOINTS];

    volatile uint8_t          USB_Endpoint_SelectedEndpoint;
    volatile USB_EP_t*        USB_Endpoint_SelectedHandle;
    volatile Endpoint_FIFO_t* USB_Endpoint_SelectedFIFO;

    bool Endpoint_IsINReady(void)
    {
      Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint | ENDPOINT_DIR_IN);

      return ((USB_Endpoint_SelectedHandle->STATUS & USB_EP_BUSNACK0_bm) ? true : false);
    }

    bool Endpoint_IsOUTReceived(void)
    {
      Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint & ~ENDPOINT_DIR_IN);

      if (USB_Endpoint_SelectedHandle->STATUS & USB_EP_TRNCOMPL0_bm)
      {
        USB_Endpoint_SelectedFIFO->Length = USB_Endpoint_SelectedHandle->CNT;
        return true;
      }

      return false;
    }

    bool Endpoint_IsSETUPReceived(void)
    {
      Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint & ~ENDPOINT_DIR_IN);

      if (USB_Endpoint_SelectedHandle->STATUS & USB_EP_SETUP_bm)
      {
        USB_Endpoint_SelectedFIFO->Length = USB_Endpoint_SelectedHandle->CNT;
        return true;
      }

      return false;
    }

    void Endpoint_ClearSETUP(void)
    {
      Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint & ~ENDPOINT_DIR_IN);
      USB_Endpoint_SelectedHandle->STATUS &= ~(USB_EP_SETUP_bm | USB_EP_TRNCOMPL0_bm | USB_EP_BUSNACK0_bm | USB_EP_OVF_bm);
      USB_Endpoint_SelectedHandle->STATUS |= USB_EP_TOGGLE_bm;
      USB_Endpoint_SelectedFIFO->Position  = 0;

      Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint | ENDPOINT_DIR_IN);
      USB_Endpoint_SelectedHandle->STATUS |= USB_EP_TOGGLE_bm;
      USB_Endpoint_SelectedFIFO->Position  = 0;
    }

    void Endpoint_ClearIN(void)
    {
      USB_Endpoint_SelectedHandle->CNT     = USB_Endpoint_SelectedFIFO->Position;
      USB_Endpoint_SelectedHandle->STATUS &= ~(USB_EP_TRNCOMPL0_bm | USB_EP_BUSNACK0_bm | USB_EP_OVF_bm);
      USB_Endpoint_SelectedFIFO->Position  = 0;
    }

    void Endpoint_ClearOUT(void)
    {
      USB_Endpoint_SelectedHandle->STATUS &= ~(USB_EP_TRNCOMPL0_bm | USB_EP_BUSNACK0_bm | USB_EP_OVF_bm);
      USB_Endpoint_SelectedFIFO->Position  = 0;
    }

    void Endpoint_StallTransaction(void)
    {
      USB_Endpoint_SelectedHandle->CTRL |= USB_EP_STALL_bm;

      if ((USB_Endpoint_SelectedHandle->CTRL & USB_EP_TYPE_gm) == USB_EP_TYPE_CONTROL_gc)
      {
        Endpoint_SelectEndpoint(USB_Endpoint_SelectedEndpoint ^ ENDPOINT_DIR_IN);
        USB_Endpoint_SelectedHandle->CTRL |= USB_EP_STALL_bm;
      }
    }

    uint8_t Endpoint_Read_8(void)
    {
      return USB_Endpoint_SelectedFIFO->Data[USB_Endpoint_SelectedFIFO->Position++];
    }

    void Endpoint_Write_8(const uint8_t Data)
    {
      USB_Endpoint_SelectedFIFO->Data[USB_Endpoint_SelectedFIFO->Position++] = Data;
    }

    void Endpoint_SelectEndpoint(const uint8_t Address)
    {
      uint8_t EndpointNumber = (Address & ENDPOINT_EPNUM_MASK);

      USB_Endpoint_SelectedEndpoint = Address;

      Endpoint_FIFOPair_t* EndpointFIFOPair = &USB_Endpoint_FIFOs[EndpointNumber];
      USB_EndpointTable_t* EndpointTable    = (USB_EndpointTable_t*)USB.EPPTR;

      if (Address & ENDPOINT_DIR_IN)
      {
        USB_Endpoint_SelectedFIFO   = &EndpointFIFOPair->IN;
        USB_Endpoint_SelectedHandle = &EndpointTable->Endpoints[EndpointNumber].IN;
      }
      else
      {
        USB_Endpoint_SelectedFIFO   = &EndpointFIFOPair->OUT;
        USB_Endpoint_SelectedHandle = &EndpointTable->Endpoints[EndpointNumber].OUT;
      }
    }

    bool Endpoint_ConfigureEndpointTable(const USB_Endpoint_Table_t* const Table,
                                         const uint8_t Entries)
    {
      for (uint8_t i = 0; i < Entries; i++)
      {
        if (!(Table[i].Address))
          continue;

        if (!(Endpoint_ConfigureEndpoint(Table[i].Address, Table[i].Type, Table[i].Size, Table[i].Banks)))
        {
          return false;
        }
      }

      return true;
    }

    bool Endpoint_ConfigureEndpoint_PRV(const uint8_t Address,
                                        const uint8_t Config,
                                        const uint8_t Size)
    {
      Endpoint_SelectEndpoint(Address);

      USB_Endpoint_SelectedHandle->CTRL    = 0;
      USB_Endpoint_SelectedHandle->STATUS  = (Address & ENDPOINT_DIR_IN) ? USB_EP_BUSNACK0_bm : 0;
      USB_Endpoint_SelectedHandle->CTRL    = Config;
      USB_Endpoint_SelectedHandle->CNT     = 0;
      USB_Endpoint_SelectedHandle->DATAPTR = (intptr_t)USB_Endpoint_SelectedFIFO->Data;

      USB_Endpoint_SelectedFIFO->Length    = (Address & ENDPOINT_DIR_IN) ? Size : 0;
      USB_Endpoint_SelectedFIFO->Position  = 0;

      return true;
    }

    void Endpoint_ClearEndpoints(void)
    {
      for (uint8_t EPNum = 0; EPNum < ENDPOINT_TOTAL_ENDPOINTS; EPNum++)
      {
        ((USB_EndpointTable_t*)USB.EPPTR)->Endpoints[EPNum].IN.CTRL  = 0;
        ((USB_EndpointTable_t*)USB.EPPTR)->Endpoints[EPNum].OUT.CTRL = 0;
      }
    }

    void Endpoint_ClearStatusStage(void)
    {
      if (USB_ControlRequest.bmRequestType & REQDIR_DEVICETOHOST)
      {
        while (!(Endpoint_IsOUTReceived()))
        {
          if (USB_DeviceState == DEVICE_STATE_Unattached)
            return;
        }

        Endpoint_ClearOUT();
      }
      else
      {
        while (!(Endpoint_IsINReady()))
        {
          if (USB_DeviceState == DEVICE_STATE_Unattached)
            return;
        }

        Endpoint_ClearIN();
      }
    }

    #if !defined(CONTROL_ONLY_DEVICE)
    uint8_t Endpoint_WaitUntilReady(void)
    {
      #if (USB_STREAM_TIMEOUT_MS < 0xFF)
      uint8_t  TimeoutMSRem = USB_STREAM_TIMEOUT_MS;
      #else
      uint16_t TimeoutMSRem = USB_STREAM_TIMEOUT_MS;
      #endif

      uint16_t PreviousFrameNumber = USB_Device_GetFrameNumber();

      for (;;)
      {
        if (Endpoint_GetEndpointDirection() == ENDPOINT_DIR_IN)
        {
          if (Endpoint_IsINReady())
            return ENDPOINT_READYWAIT_NoError;
        }
        else
        {
          if (Endpoint_IsOUTReceived())
            return ENDPOINT_READYWAIT_NoError;
        }

        uint8_t USB_DeviceState_LCL = USB_DeviceState;

        if (USB_DeviceState_LCL == DEVICE_STATE_Unattached)
          return ENDPOINT_READYWAIT_DeviceDisconnected;
        else if (USB_DeviceState_LCL == DEVICE_STATE_Suspended)
          return ENDPOINT_READYWAIT_BusSuspended;
        else if (Endpoint_IsStalled())
          return ENDPOINT_READYWAIT_EndpointStalled;

        uint16_t CurrentFrameNumber = USB_Device_GetFrameNumber();

        if (CurrentFrameNumber != PreviousFrameNumber)
        {
          PreviousFrameNumber = CurrentFrameNumber;

          if (!(TimeoutMSRem--))
            return ENDPOINT_READYWAIT_Timeout;
        }
      }
    }
    #endif

  }+


  +{ #endif /* (ARCH == ARCH_XMEGA) */ }+


  +{ #endif /* __EndpointXmega_P__ */ }+

}
