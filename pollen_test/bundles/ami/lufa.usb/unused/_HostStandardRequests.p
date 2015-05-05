import CommonDefines
import USBMode
import StdRequestType
import USBController

module HostStandardRequests {
  
  +{
    #ifndef __HostStandardRequests_P__
    #define __HostStandardRequests_P__
  }+

  +{
  /* Public Interface - May be used in end-application: */
    /* Macros: */
      #if !defined(USB_HOST_TIMEOUT_MS) || defined(__DOXYGEN__)
        /** Constant for the maximum software timeout period of sent USB control transactions to an attached
         *  device. If a device fails to respond to a sent control request within this period, the
         *  library will return a timeout error code.
         *
         *  This value may be overridden in the user project makefile as the value of the
         *  \ref USB_HOST_TIMEOUT_MS token, and passed to the compiler using the -D switch.
         */
        #define USB_HOST_TIMEOUT_MS                1000
      #endif

    /* Enums: */
      /** Enum for the \ref USB_Host_SendControlRequest() return code, indicating the reason for the error
       *  if the transfer of the request is unsuccessful.
       *
       *  \ingroup Group_PipeControlReq
       */
      enum USB_Host_SendControlErrorCodes_t
      {
        HOST_SENDCONTROL_Successful         = 0, /**< No error occurred in the request transfer. */
        HOST_SENDCONTROL_DeviceDisconnected = 1, /**< The attached device was disconnected during the
                                                *     request transfer.
                                                */
        HOST_SENDCONTROL_PipeError          = 2, /**< An error occurred in the pipe while sending the request. */
        HOST_SENDCONTROL_SetupStalled       = 3, /**< The attached device stalled the request, usually
                                                  *   indicating that the request is unsupported on the device.
                                                  */
        HOST_SENDCONTROL_SoftwareTimeOut    = 4, /**< The request or data transfer timed out. */
      };

    /* Global Variables: */
      /** Indicates the currently set configuration number of the attached device. This indicates the currently
       *  selected configuration value if one has been set successfully, or 0 if no configuration has been selected.
       *
       *  To set a device configuration, call the \ref USB_Host_SetDeviceConfiguration() function.
       *
       *  \attention This variable should be treated as read-only in the user application, and never manually
       *             changed in value.
       *
       *  \ingroup Group_Host
       */
      extern uint8_t USB_Host_ConfigurationNumber;

    /* Function Prototypes: */
      /** Sends the request stored in the \ref USB_ControlRequest global structure to the attached device,
       *  and transfers the data stored in the buffer to the device, or from the device to the buffer
       *  as requested. The transfer is made on the currently selected pipe.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[in] BufferPtr  Pointer to the start of the data buffer if the request has a data stage, or
       *                        \c NULL if the request transfers no data to or from the device.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      uint8_t USB_Host_SendControlRequest(void* const BufferPtr);

      /** Sends a SET CONFIGURATION standard request to the attached device, with the given configuration index.
       *
       *  This routine will automatically update the \ref USB_HostState and \ref USB_Host_ConfigurationNumber
       *  state variables according to the given function parameters and the result of the request.
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[in] ConfigNumber  Configuration index to send to the device.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      uint8_t USB_Host_SetDeviceConfiguration(const uint8_t ConfigNumber);

      /** Sends a GET CONFIGURATION standard request to the attached device, to retrieve the currently selected
       *  device configuration index.
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[out] ConfigNumber  Pointer to a location where the retrieved configuration index should be stored.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      uint8_t USB_Host_GetDeviceConfiguration(uint8_t* const ConfigNumber) ATTR_NON_NULL_PTR_ARG(1);

      /** Sends a GET DESCRIPTOR standard request to the attached device, requesting the  descriptor of the
       *  specified type and index.
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[in]  Type          Type of descriptor to retrieve, a value from the \ref USB_DescriptorTypes_t enum.
       *  \param[in]  Index         Index of the descriptor to retrieve.
       *  \param[out] Buffer        Pointer to the destination buffer where the retrieved string descriptor is to be stored.
       *  \param[in]  BufferLength  Maximum size of the string descriptor which can be stored into the buffer.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      uint8_t USB_Host_GetDescriptor(const uint8_t Type,
                                     const uint8_t Index,
                                     void* const Buffer,
                                     const uint8_t BufferLength) ATTR_NON_NULL_PTR_ARG(3);

      /** Retrieves the current feature status of the attached device, via a GET STATUS standard request. The
       *  retrieved feature status can then be examined by masking the retrieved value with the various
       *  \c FEATURE_* masks for bus/self power information and remote wakeup support.
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[out]  FeatureStatus  Location where the retrieved feature status should be stored.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      uint8_t USB_Host_GetDeviceStatus(uint8_t* const FeatureStatus) ATTR_NON_NULL_PTR_ARG(1);

      /** Clears a stall condition on the given pipe, via a CLEAR FEATURE standard request to the attached device.
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[in] EndpointAddress  Address of the endpoint to clear, including the endpoint's direction.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      uint8_t USB_Host_ClearEndpointStall(const uint8_t EndpointAddress);

      /** Selects a given alternative setting for the specified interface, via a SET INTERFACE standard request to
       *  the attached device.
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[in] InterfaceIndex  Index of the interface whose alternative setting is to be altered.
       *  \param[in] AltSetting      Index of the interface's alternative setting which is to be selected.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      uint8_t USB_Host_SetInterfaceAltSetting(const uint8_t InterfaceIndex,
                                              const uint8_t AltSetting);


      /** Retrieves the current alternative setting for the specified interface, via a GET INTERFACE standard request to
       *  the attached device.
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[in]  InterfaceIndex  Index of the interface whose alternative setting is to be altered.
       *  \param[out] AltSetting      Pointer to a location where the retrieved alternative setting value should be stored.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      uint8_t USB_Host_GetInterfaceAltSetting(const uint8_t InterfaceIndex,
                                              uint8_t* const AltSetting) ATTR_NON_NULL_PTR_ARG(2);

    /* Inline Functions: */
      /** Sends a GET DESCRIPTOR standard request to the attached device, requesting the device descriptor.
       *  This can be used to easily retrieve information about the device such as its VID, PID and power
       *  requirements. This is a convenience wrapper for \ref USB_Host_GetDescriptor().
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[out] DeviceDescriptorPtr  Pointer to the destination device descriptor structure where
       *                                   the read data is to be stored.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      static inline uint8_t USB_Host_GetDeviceDescriptor(USB_Descriptor_Device_t* const DeviceDescriptorPtr) ATTR_NON_NULL_PTR_ARG(1);
      static inline uint8_t USB_Host_GetDeviceDescriptor(USB_Descriptor_Device_t* const DeviceDescriptorPtr)
      {
        return USB_Host_GetDescriptor(DTYPE_Device, 0, DeviceDescriptorPtr, sizeof(USB_Descriptor_Device_t));
      }

      /** Sends a GET DESCRIPTOR standard request to the attached device, requesting the string descriptor
       *  of the specified index. This can be used to easily retrieve string descriptors from the device by
       *  index, after the index is obtained from the Device or Configuration descriptors. This is a convenience
       *  wrapper for \ref USB_Host_GetDescriptor().
       *
       *  \note After this routine returns, the control pipe will be selected.
       *
       *  \ingroup Group_PipeControlReq
       *
       *  \param[in]  Index        Index of the string descriptor to retrieve.
       *  \param[out] Buffer       Pointer to the destination buffer where the retrieved string descriptor is
       *                           to be stored.
       *  \param[in] BufferLength  Maximum size of the string descriptor which can be stored into the buffer.
       *
       *  \return A value from the \ref USB_Host_SendControlErrorCodes_t enum to indicate the result.
       */
      static inline uint8_t USB_Host_GetDeviceStringDescriptor(const uint8_t Index,
                                                               void* const Buffer,
                                                               const uint8_t BufferLength) ATTR_NON_NULL_PTR_ARG(2);
      static inline uint8_t USB_Host_GetDeviceStringDescriptor(const uint8_t Index,
                                                               void* const Buffer,
                                                               const uint8_t BufferLength)
      {
        return USB_Host_GetDescriptor(DTYPE_String, Index,  Buffer, BufferLength);
      }

      /* Private Interface - For use in library only: */
      #if !defined(__DOXYGEN__)
        /* Enums: */
          enum USB_WaitForTypes_t
          {
            USB_HOST_WAITFOR_SetupSent,
            USB_HOST_WAITFOR_InReceived,
            USB_HOST_WAITFOR_OutReady,
          };

        /* Function Prototypes: */
        //  #if defined(__INCLUDE_FROM_HOSTSTDREQ_C)
            static uint8_t USB_Host_SendControlRequest_PRV(void* const BufferPtr);
            static uint8_t USB_Host_WaitForIOS(const uint8_t WaitType);
        //  #endif
      #endif

  }+

  +{
    #if defined(USB_CAN_BE_HOST)

      uint8_t USB_Host_ConfigurationNumber;

      static uint8_t USB_Host_SendControlRequest_PRV(void* const BufferPtr)
      {
        uint8_t* DataStream   = (uint8_t*)BufferPtr;
        uint8_t  ReturnStatus = HOST_SENDCONTROL_Successful;
        uint16_t DataLen      = USB_ControlRequest.wLength;

        USB_Host_ResumeBus();

        if ((ReturnStatus = USB_Host_WaitMS(1)) != HOST_WAITERROR_Successful)
          return ReturnStatus;

        Pipe_SetPipeToken(PIPE_TOKEN_SETUP);
        Pipe_ClearError();

        Pipe_Unfreeze();

        #if defined(ARCH_BIG_ENDIAN)
        Pipe_Write_8(USB_ControlRequest.bmRequestType);
        Pipe_Write_8(USB_ControlRequest.bRequest);
        Pipe_Write_16_LE(USB_ControlRequest.wValue);
        Pipe_Write_16_LE(USB_ControlRequest.wIndex);
        Pipe_Write_16_LE(USB_ControlRequest.wLength);
        #else
        uint8_t* HeaderStream = (uint8_t*)&USB_ControlRequest;

        for (uint8_t HeaderByte = 0; HeaderByte < sizeof(USB_Request_Header_t); HeaderByte++)
          Pipe_Write_8(*(HeaderStream++));
        #endif

        Pipe_ClearSETUP();

        if ((ReturnStatus = USB_Host_WaitForIOS(USB_HOST_WAITFOR_SetupSent)) != HOST_SENDCONTROL_Successful)
          return ReturnStatus;

        Pipe_Freeze();

        if ((ReturnStatus = USB_Host_WaitMS(1)) != HOST_WAITERROR_Successful)
          return ReturnStatus;

        if ((USB_ControlRequest.bmRequestType & CONTROL_REQTYPE_DIRECTION) == REQDIR_DEVICETOHOST)
        {
          Pipe_SetPipeToken(PIPE_TOKEN_IN);

          if (DataStream != NULL)
          {
            while (DataLen)
            {
              Pipe_Unfreeze();

              if ((ReturnStatus = USB_Host_WaitForIOS(USB_HOST_WAITFOR_InReceived)) != HOST_SENDCONTROL_Successful)
                return ReturnStatus;

              if (!(Pipe_BytesInPipe()))
                DataLen = 0;

              while (Pipe_BytesInPipe() && DataLen)
              {
                *(DataStream++) = Pipe_Read_8();
                DataLen--;
              }

              Pipe_Freeze();
              Pipe_ClearIN();
            }
          }

          Pipe_SetPipeToken(PIPE_TOKEN_OUT);
          Pipe_Unfreeze();

          if ((ReturnStatus = USB_Host_WaitForIOS(USB_HOST_WAITFOR_OutReady)) != HOST_SENDCONTROL_Successful)
            return ReturnStatus;

          Pipe_ClearOUT();

          if ((ReturnStatus = USB_Host_WaitForIOS(USB_HOST_WAITFOR_OutReady)) != HOST_SENDCONTROL_Successful)
            return ReturnStatus;
        }
        else
        {
          if (DataStream != NULL)
          {
            Pipe_SetPipeToken(PIPE_TOKEN_OUT);
            Pipe_Unfreeze();

            while (DataLen)
            {
              if ((ReturnStatus = USB_Host_WaitForIOS(USB_HOST_WAITFOR_OutReady)) != HOST_SENDCONTROL_Successful)
                return ReturnStatus;

              while (DataLen && (Pipe_BytesInPipe() < USB_Host_ControlPipeSize))
              {
                Pipe_Write_8(*(DataStream++));
                DataLen--;
              }

              Pipe_ClearOUT();
            }

            if ((ReturnStatus = USB_Host_WaitForIOS(USB_HOST_WAITFOR_OutReady)) != HOST_SENDCONTROL_Successful)
              return ReturnStatus;

            Pipe_Freeze();
          }

          Pipe_SetPipeToken(PIPE_TOKEN_IN);
          Pipe_Unfreeze();

          if ((ReturnStatus = USB_Host_WaitForIOS(USB_HOST_WAITFOR_InReceived)) != HOST_SENDCONTROL_Successful)
            return ReturnStatus;

          Pipe_ClearIN();
        }
        
        return ReturnStatus;
      }

      static uint8_t USB_Host_WaitForIOS(const uint8_t WaitType)
      {
        #if (USB_HOST_TIMEOUT_MS < 0xFF)
        uint8_t  TimeoutCounter = USB_HOST_TIMEOUT_MS;
        #else
        uint16_t TimeoutCounter = USB_HOST_TIMEOUT_MS;
        #endif

        while (!(((WaitType == USB_HOST_WAITFOR_SetupSent)  && Pipe_IsSETUPSent())  ||
                 ((WaitType == USB_HOST_WAITFOR_InReceived) && Pipe_IsINReceived()) ||
                 ((WaitType == USB_HOST_WAITFOR_OutReady)   && Pipe_IsOUTReady())))
        {
          uint8_t ErrorCode;

          if ((ErrorCode = USB_Host_WaitMS(1)) != HOST_WAITERROR_Successful)
            return ErrorCode;

          if (!(TimeoutCounter--))
            return HOST_SENDCONTROL_SoftwareTimeOut;
        }

        return HOST_SENDCONTROL_Successful;
      }

      uint8_t USB_Host_SendControlRequest(void* const BufferPtr)
      {
        bool BusSuspended    = USB_Host_IsBusSuspended();
        uint8_t ReturnStatus = USB_Host_SendControlRequest_PRV(BufferPtr);

        Pipe_Freeze();

        if (BusSuspended)
          USB_Host_SuspendBus();

        Pipe_ResetPipe(PIPE_CONTROLPIPE);

        return ReturnStatus;
      }

      uint8_t USB_Host_SetDeviceConfiguration(const uint8_t ConfigNumber)
      {
        uint8_t ErrorCode;

        USB_ControlRequest = (USB_Request_Header_t)
          {
            .bmRequestType = (REQDIR_HOSTTODEVICE | REQTYPE_STANDARD | REQREC_DEVICE),
            .bRequest      = REQ_SetConfiguration,
            .wValue        = ConfigNumber,
            .wIndex        = 0,
            .wLength       = 0,
          };

        Pipe_SelectPipe(PIPE_CONTROLPIPE);

        if ((ErrorCode = USB_Host_SendControlRequest(NULL)) == HOST_SENDCONTROL_Successful)
        {
          USB_Host_ConfigurationNumber = ConfigNumber;
          USB_HostState                = (ConfigNumber) ? HOST_STATE_Configured : HOST_STATE_Addressed;
        }

        return ErrorCode;
      }

      uint8_t USB_Host_GetDeviceConfiguration(uint8_t* const ConfigNumber)
      {
        USB_ControlRequest = (USB_Request_Header_t)
          {
            .bmRequestType = (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_DEVICE),
            .bRequest      = REQ_GetConfiguration,
            .wValue        = 0,
            .wIndex        = 0,
            .wLength       = sizeof(uint8_t),
          };

        Pipe_SelectPipe(PIPE_CONTROLPIPE);

        return USB_Host_SendControlRequest(ConfigNumber);
      }

      uint8_t USB_Host_GetDescriptor(const uint8_t Type,
                                     const uint8_t Index,
                                     void* const Buffer,
                                     const uint8_t BufferLength)
      {
        USB_ControlRequest = (USB_Request_Header_t)
          {
            .bmRequestType = (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_DEVICE),
            .bRequest      = REQ_GetDescriptor,
            .wValue        = (((uint16_t)Type << 8) | Index),
            .wIndex        = 0,
            .wLength       = BufferLength,
          };

        Pipe_SelectPipe(PIPE_CONTROLPIPE);

        return USB_Host_SendControlRequest(Buffer);
      }

      uint8_t USB_Host_GetDeviceStatus(uint8_t* const FeatureStatus)
      {
        USB_ControlRequest = (USB_Request_Header_t)
          {
            .bmRequestType = (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_DEVICE),
            .bRequest      = REQ_GetStatus,
            .wValue        = 0,
            .wIndex        = 0,
            .wLength       = 0,
          };

        Pipe_SelectPipe(PIPE_CONTROLPIPE);

        return USB_Host_SendControlRequest(FeatureStatus);
      }

      uint8_t USB_Host_ClearEndpointStall(const uint8_t EndpointAddress)
      {
        USB_ControlRequest = (USB_Request_Header_t)
          {
            .bmRequestType = (REQDIR_HOSTTODEVICE | REQTYPE_STANDARD | REQREC_ENDPOINT),
            .bRequest      = REQ_ClearFeature,
            .wValue        = FEATURE_SEL_EndpointHalt,
            .wIndex        = EndpointAddress,
            .wLength       = 0,
          };

        Pipe_SelectPipe(PIPE_CONTROLPIPE);

        return USB_Host_SendControlRequest(NULL);
      }

      uint8_t USB_Host_SetInterfaceAltSetting(const uint8_t InterfaceIndex,
                                              const uint8_t AltSetting)
      {
        USB_ControlRequest = (USB_Request_Header_t)
          {
            .bmRequestType = (REQDIR_HOSTTODEVICE | REQTYPE_STANDARD | REQREC_INTERFACE),
            .bRequest      = REQ_SetInterface,
            .wValue        = AltSetting,
            .wIndex        = InterfaceIndex,
            .wLength       = 0,
          };

        Pipe_SelectPipe(PIPE_CONTROLPIPE);

        return USB_Host_SendControlRequest(NULL);
      }

      uint8_t USB_Host_GetInterfaceAltSetting(const uint8_t InterfaceIndex,
                                              uint8_t* const AltSetting)
      {
        USB_ControlRequest = (USB_Request_Header_t)
          {
            .bmRequestType = (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_INTERFACE),
            .bRequest      = REQ_GetInterface,
            .wValue        = 0,
            .wIndex        = InterfaceIndex,
            .wLength       = sizeof(uint8_t),
          };

        Pipe_SelectPipe(PIPE_CONTROLPIPE);

        return USB_Host_SendControlRequest(AltSetting);
      }

    #endif
  }+

  +{ #endif /* __HostStandardRequests_P__ */ }+
}