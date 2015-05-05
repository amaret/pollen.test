import MidiClassDeviceCommon
import USBMode

module MidiClassDevice {
  

  +{
    #ifndef __MidiClassDevice_P__
    #define __MidiClassDevice_P__
  }+

  /////////////////////////
  // MidiClassDevice.h
  /////////////////////////
  +{
    /* Type Define: */
      /** \brief MIDI Class Device Mode Configuration and State Structure.
       *
       *  Class state structure. An instance of this structure should be made for each MIDI interface
       *  within the user application, and passed to each of the MIDI class driver functions as the
       *  \c MIDIInterfaceInfo parameter. This stores each MIDI interface's configuration and state information.
       */
      typedef struct
      {
        struct
        {
          uint8_t  StreamingInterfaceNumber; /**< Index of the Audio Streaming interface within the device this structure controls. */

          USB_Endpoint_Table_t DataINEndpoint; /**< Data IN endpoint configuration table. */
          USB_Endpoint_Table_t DataOUTEndpoint; /**< Data OUT endpoint configuration table. */
        } Config; /**< Config data for the USB class interface within the device. All elements in this section
                   *   <b>must</b> be set or the interface will fail to enumerate and operate correctly.
                   */

        struct
        {
          uint8_t RESERVED; // No state information for this class
        } State; /**< State data for the USB class interface within the device. All elements in this section
                  *   are reset to their defaults when the interface is enumerated.
                  */
      } USB_ClassInfo_MIDI_Device_t;

    /* Function Prototypes: */
      /** Configures the endpoints of a given MIDI interface, ready for use. This should be linked to the library
       *  \ref EVENT_USB_Device_ConfigurationChanged() event so that the endpoints are configured when the configuration
       *  containing the given MIDI interface is selected.
       *
       *  \param[in,out] MIDIInterfaceInfo  Pointer to a structure containing a MIDI Class configuration and state.
       *
       *  \return Boolean \c true if the endpoints were successfully configured, \c false otherwise.
       */
      bool MIDI_Device_ConfigureEndpoints(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo) ATTR_NON_NULL_PTR_ARG(1);

      /** General management task for a given MIDI class interface, required for the correct operation of the interface. This should
       *  be called frequently in the main program loop, before the master USB management task \ref USB_USBTask().
       *
       *  \param[in,out] MIDIInterfaceInfo  Pointer to a structure containing a MIDI Class configuration and state.
       */
      void MIDI_Device_USBTask(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo) ATTR_NON_NULL_PTR_ARG(1);

      /** Sends a MIDI event packet to the host. If no host is connected, the event packet is discarded. Events are queued into the
       *  endpoint bank until either the endpoint bank is full, or \ref MIDI_Device_Flush() is called. This allows for multiple
       *  MIDI events to be packed into a single endpoint packet, increasing data throughput.
       *
       *  \pre This function must only be called when the Host state machine is in the \ref HOST_STATE_Configured state or the
       *       call will fail.
       *
       *  \param[in,out] MIDIInterfaceInfo  Pointer to a structure containing a MIDI Class configuration and state.
       *  \param[in]     Event              Pointer to a populated \ref MIDI_EventPacket_t structure containing the MIDI event to send.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t MIDI_Device_SendEventPacket(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo,
                                          const MIDI_EventPacket_t* const Event) ATTR_NON_NULL_PTR_ARG(1) ATTR_NON_NULL_PTR_ARG(2);


      /** Flushes the MIDI send buffer, sending any queued MIDI events to the host. This should be called to override the
       *  \ref MIDI_Device_SendEventPacket() function's packing behavior, to flush queued events.
       *
       *  \param[in,out] MIDIInterfaceInfo  Pointer to a structure containing a MIDI Class configuration and state.
       *
       *  \return A value from the \ref Endpoint_WaitUntilReady_ErrorCodes_t enum.
       */
      uint8_t MIDI_Device_Flush(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo) ATTR_NON_NULL_PTR_ARG(1);

      /** Receives a MIDI event packet from the host. Events are unpacked from the endpoint, thus if the endpoint bank contains
       *  multiple MIDI events from the host in the one packet, multiple calls to this function will return each individual event.
       *
       *  \pre This function must only be called when the Host state machine is in the \ref HOST_STATE_Configured state or the
       *       call will fail.
       *
       *  \param[in,out] MIDIInterfaceInfo  Pointer to a structure containing a MIDI Class configuration and state.
       *  \param[out]    Event              Pointer to a USB_MIDI_EventPacket_t structure where the received MIDI event is to be placed.
       *
       *  \return Boolean \c true if a MIDI event packet was received, \c false otherwise.
       */
      bool MIDI_Device_ReceiveEventPacket(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo,
                                          MIDI_EventPacket_t* const Event) ATTR_NON_NULL_PTR_ARG(1) ATTR_NON_NULL_PTR_ARG(2);

    /* Inline Functions: */
      /** Processes incoming control requests from the host, that are directed to the given MIDI class interface. This should be
       *  linked to the library \ref EVENT_USB_Device_ControlRequest() event.
       *
       *  \param[in,out] MIDIInterfaceInfo  Pointer to a structure containing a MIDI Class configuration and state.
       */
      static inline void MIDI_Device_ProcessControlRequest(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo) ATTR_NON_NULL_PTR_ARG(1);
      static inline void MIDI_Device_ProcessControlRequest(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo)
      {
        (void)MIDIInterfaceInfo;
      }
  }+

  /////////////////////////
  // MidiClassDevice.c
  /////////////////////////

  +{
      bool MIDI_Device_ConfigureEndpoints(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo)
      {
        memset(&MIDIInterfaceInfo->State, 0x00, sizeof(MIDIInterfaceInfo->State));

        MIDIInterfaceInfo->Config.DataINEndpoint.Type  = EP_TYPE_BULK;
        MIDIInterfaceInfo->Config.DataOUTEndpoint.Type = EP_TYPE_BULK;

        if (!(Endpoint_ConfigureEndpointTable(&MIDIInterfaceInfo->Config.DataINEndpoint, 1)))
          return false;

        if (!(Endpoint_ConfigureEndpointTable(&MIDIInterfaceInfo->Config.DataOUTEndpoint, 1)))
          return false;

        return true;
      }

      void MIDI_Device_USBTask(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo)
      {
        if (USB_DeviceState != DEVICE_STATE_Configured)
          return;

        #if !defined(NO_CLASS_DRIVER_AUTOFLUSH)
        Endpoint_SelectEndpoint(MIDIInterfaceInfo->Config.DataINEndpoint.Address);
        
        if (Endpoint_IsINReady())
          MIDI_Device_Flush(MIDIInterfaceInfo);
        #endif
      }

      uint8_t MIDI_Device_SendEventPacket(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo,
                                          const MIDI_EventPacket_t* const Event)
      {
        if (USB_DeviceState != DEVICE_STATE_Configured)
          return ENDPOINT_RWSTREAM_DeviceDisconnected;

        uint8_t ErrorCode;

        Endpoint_SelectEndpoint(MIDIInterfaceInfo->Config.DataINEndpoint.Address);

        if ((ErrorCode = Endpoint_Write_Stream_LE(Event, sizeof(MIDI_EventPacket_t), NULL)) != ENDPOINT_RWSTREAM_NoError)
          return ErrorCode;

        if (!(Endpoint_IsReadWriteAllowed()))
          Endpoint_ClearIN();

        return ENDPOINT_RWSTREAM_NoError;
      }

      uint8_t MIDI_Device_Flush(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo)
      {
        if (USB_DeviceState != DEVICE_STATE_Configured)
          return ENDPOINT_RWSTREAM_DeviceDisconnected;

        uint8_t ErrorCode;

        Endpoint_SelectEndpoint(MIDIInterfaceInfo->Config.DataINEndpoint.Address);

        if (Endpoint_BytesInEndpoint())
        {
          Endpoint_ClearIN();

          if ((ErrorCode = Endpoint_WaitUntilReady()) != ENDPOINT_READYWAIT_NoError)
            return ErrorCode;
        }

        return ENDPOINT_READYWAIT_NoError;
      }

      bool MIDI_Device_ReceiveEventPacket(USB_ClassInfo_MIDI_Device_t* const MIDIInterfaceInfo,
                                          MIDI_EventPacket_t* const Event)
      {
        if (USB_DeviceState != DEVICE_STATE_Configured)
          return false;

        Endpoint_SelectEndpoint(MIDIInterfaceInfo->Config.DataOUTEndpoint.Address);

        if (!(Endpoint_IsReadWriteAllowed()))
          return false;

        Endpoint_Read_Stream_LE(Event, sizeof(MIDI_EventPacket_t), NULL);

        if (!(Endpoint_IsReadWriteAllowed()))
          Endpoint_ClearOUT();

        return true;
      }
    
  }+

  +{ #endif /* #ifndef __MidiClassDevice_P__ */ }+

}