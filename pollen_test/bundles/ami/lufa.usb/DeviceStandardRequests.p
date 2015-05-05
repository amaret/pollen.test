import CommonDefines
import USBMode
import StdDescriptors
import Events
import StdRequestType
import USBTask
import USBController

module DeviceStandardRequests {
  
  +{
    #ifndef __DeviceStandardRequests_P__
    #define __DeviceStandardRequests_P__
  }+

  +{
    /* Public Interface - May be used in end-application: */
      /* Enums: */
        #if defined(ARCH_HAS_MULTI_ADDRESS_SPACE) || defined(__DOXYGEN__)
          /** Enum for the possible descriptor memory spaces, for the \c MemoryAddressSpace parameter of the
           *  \ref CALLBACK_USB_GetDescriptor() function. This can be used when none of the \c USE_*_DESCRIPTORS
           *  compile time options are used, to indicate in which memory space the descriptor is stored.
           *
           *  \ingroup Group_Device
           */
          enum USB_DescriptorMemorySpaces_t
          {
            #if defined(ARCH_HAS_FLASH_ADDRESS_SPACE) || defined(__DOXYGEN__)
            MEMSPACE_FLASH    = 0, /**< Indicates the requested descriptor is located in FLASH memory. */
            #endif
            #if defined(ARCH_HAS_EEPROM_ADDRESS_SPACE) || defined(__DOXYGEN__)
            MEMSPACE_EEPROM   = 1, /**< Indicates the requested descriptor is located in EEPROM memory. */
            #endif
            MEMSPACE_RAM      = 2, /**< Indicates the requested descriptor is located in RAM memory. */
          };
        #endif

      /* Global Variables: */
        /** Indicates the currently set configuration number of the device. USB devices may have several
         *  different configurations which the host can select between; this indicates the currently selected
         *  value, or 0 if no configuration has been selected.
         *
         *  \attention This variable should be treated as read-only in the user application, and never manually
         *             changed in value.
         *
         *  \ingroup Group_Device
         */
        extern uint8_t USB_Device_ConfigurationNumber;

        #if !defined(NO_DEVICE_REMOTE_WAKEUP)
          /** Indicates if the host is currently allowing the device to issue remote wakeup events. If this
           *  flag is cleared, the device should not issue remote wakeup events to the host.
           *
           *  \attention This variable should be treated as read-only in the user application, and never manually
           *             changed in value.
           *
           *  \note To reduce FLASH usage of the compiled applications where Remote Wakeup is not supported,
           *        this global and the underlying management code can be disabled by defining the
           *        \c NO_DEVICE_REMOTE_WAKEUP token in the project makefile and passing it to the compiler via
           *        the -D switch.
           *
           *  \ingroup Group_Device
           */
          extern bool USB_Device_RemoteWakeupEnabled;
        #endif

        #if !defined(NO_DEVICE_SELF_POWER)
          /** Indicates if the device is currently being powered by its own power supply, rather than being
           *  powered by the host's USB supply. This flag should remain cleared if the device does not
           *  support self powered mode, as indicated in the device descriptors.
           *
           *  \ingroup Group_Device
           */
          extern bool USB_Device_CurrentlySelfPowered;
        #endif

    /* Private Interface - For use in library only: */
    #if !defined(__DOXYGEN__)
      #if defined(USE_RAM_DESCRIPTORS) && defined(USE_EEPROM_DESCRIPTORS)
        #error USE_RAM_DESCRIPTORS and USE_EEPROM_DESCRIPTORS are mutually exclusive.
      #elif defined(USE_RAM_DESCRIPTORS) && defined(USE_FLASH_DESCRIPTORS)
        #error USE_RAM_DESCRIPTORS and USE_FLASH_DESCRIPTORS are mutually exclusive.
      #elif defined(USE_FLASH_DESCRIPTORS) && defined(USE_EEPROM_DESCRIPTORS)
        #error USE_FLASH_DESCRIPTORS and USE_EEPROM_DESCRIPTORS are mutually exclusive.
      #elif defined(USE_FLASH_DESCRIPTORS) && defined(USE_EEPROM_DESCRIPTORS) && defined(USE_RAM_DESCRIPTORS)
        #error Only one of the USE_*_DESCRIPTORS modes should be selected.
      #endif

      /* Function Prototypes: */
        void USB_Device_ProcessControlRequest(void);

        static void USB_Device_SetAddress(void);
        static void USB_Device_SetConfiguration(void);
        static void USB_Device_GetConfiguration(void);
        static void USB_Device_GetDescriptor(void);
        static void USB_Device_GetStatus(void);
        static void USB_Device_ClearSetFeature(void);

          #if !defined(NO_INTERNAL_SERIAL) && (USE_INTERNAL_SERIAL != NO_DESCRIPTOR)
            static void USB_Device_GetInternalSerialDescriptor(void);
          #endif

    #endif
  }+

  +{
    #if defined(USB_CAN_BE_DEVICE)

      uint8_t USB_Device_ConfigurationNumber;

      #if !defined(NO_DEVICE_SELF_POWER)
      bool    USB_Device_CurrentlySelfPowered;
      #endif

      #if !defined(NO_DEVICE_REMOTE_WAKEUP)
      bool    USB_Device_RemoteWakeupEnabled;
      #endif

      void USB_Device_ProcessControlRequest(void)
      {
        #if defined(ARCH_BIG_ENDIAN)
        USB_ControlRequest.bmRequestType = Endpoint_Read_8();
        USB_ControlRequest.bRequest      = Endpoint_Read_8();
        USB_ControlRequest.wValue        = Endpoint_Read_16_LE();
        USB_ControlRequest.wIndex        = Endpoint_Read_16_LE();
        USB_ControlRequest.wLength       = Endpoint_Read_16_LE();
        #else
        uint8_t* RequestHeader = (uint8_t*)&USB_ControlRequest;

        for (uint8_t RequestHeaderByte = 0; RequestHeaderByte < sizeof(USB_Request_Header_t); RequestHeaderByte++)
          *(RequestHeader++) = Endpoint_Read_8();
        #endif

        EVENT_USB_Device_ControlRequest();

        if (Endpoint_IsSETUPReceived())
        {
          uint8_t bmRequestType = USB_ControlRequest.bmRequestType;

          switch (USB_ControlRequest.bRequest)
          {
            case REQ_GetStatus:
              if ((bmRequestType == (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_DEVICE)) ||
                (bmRequestType == (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_ENDPOINT)))
              {
                USB_Device_GetStatus();
              }

              break;
            case REQ_ClearFeature:
            case REQ_SetFeature:
              if ((bmRequestType == (REQDIR_HOSTTODEVICE | REQTYPE_STANDARD | REQREC_DEVICE)) ||
                (bmRequestType == (REQDIR_HOSTTODEVICE | REQTYPE_STANDARD | REQREC_ENDPOINT)))
              {
                USB_Device_ClearSetFeature();
              }

              break;
            case REQ_SetAddress:
              if (bmRequestType == (REQDIR_HOSTTODEVICE | REQTYPE_STANDARD | REQREC_DEVICE))
                USB_Device_SetAddress();

              break;
            case REQ_GetDescriptor:
              if ((bmRequestType == (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_DEVICE)) ||
                (bmRequestType == (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_INTERFACE)))
              {
                USB_Device_GetDescriptor();
              }

              break;
            case REQ_GetConfiguration:
              if (bmRequestType == (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_DEVICE))
                USB_Device_GetConfiguration();

              break;
            case REQ_SetConfiguration:
              if (bmRequestType == (REQDIR_HOSTTODEVICE | REQTYPE_STANDARD | REQREC_DEVICE))
                USB_Device_SetConfiguration();

              break;

            default:
              break;
          }
        }

        if (Endpoint_IsSETUPReceived())
        {
          Endpoint_ClearSETUP();
          Endpoint_StallTransaction();
        }
      }

      static void USB_Device_SetAddress(void)
      {
        uint8_t DeviceAddress = (USB_ControlRequest.wValue & 0x7F);

        USB_Device_SetDeviceAddress(DeviceAddress);

        Endpoint_ClearSETUP();

        Endpoint_ClearStatusStage();

        while (!(Endpoint_IsINReady()));

        USB_Device_EnableDeviceAddress(DeviceAddress);

        USB_DeviceState = (DeviceAddress) ? DEVICE_STATE_Addressed : DEVICE_STATE_Default;
      }

      static void USB_Device_SetConfiguration(void)
      {
        #if defined(FIXED_NUM_CONFIGURATIONS)
        if ((uint8_t)USB_ControlRequest.wValue > FIXED_NUM_CONFIGURATIONS)
          return;
        #else
        USB_Descriptor_Device_t* DevDescriptorPtr;

        #if defined(ARCH_HAS_MULTI_ADDRESS_SPACE)
          #if defined(USE_FLASH_DESCRIPTORS)
            #define MemoryAddressSpace  MEMSPACE_FLASH
          #elif defined(USE_EEPROM_DESCRIPTORS)
            #define MemoryAddressSpace  MEMSPACE_EEPROM
          #elif defined(USE_SRAM_DESCRIPTORS)
            #define MemoryAddressSpace  MEMSPACE_SRAM
          #else
            uint8_t MemoryAddressSpace;
          #endif
        #endif

        if (CALLBACK_USB_GetDescriptor((DTYPE_Device << 8), 0, (void*)&DevDescriptorPtr
        #if defined(ARCH_HAS_MULTI_ADDRESS_SPACE) && \
            !(defined(USE_FLASH_DESCRIPTORS) || defined(USE_EEPROM_DESCRIPTORS) || defined(USE_RAM_DESCRIPTORS))
                                       , &MemoryAddressSpace
        #endif
                                       ) == NO_DESCRIPTOR)
        {
          return;
        }

        #if defined(ARCH_HAS_MULTI_ADDRESS_SPACE)
        if (MemoryAddressSpace == MEMSPACE_FLASH)
        {
          if (((uint8_t)USB_ControlRequest.wValue > pgm_read_byte(&DevDescriptorPtr->NumberOfConfigurations)))
            return;
        }
        else if (MemoryAddressSpace == MEMSPACE_EEPROM)
        {
          if (((uint8_t)USB_ControlRequest.wValue > eeprom_read_byte(&DevDescriptorPtr->NumberOfConfigurations)))
            return;
        }
        else
        {
          if ((uint8_t)USB_ControlRequest.wValue > DevDescriptorPtr->NumberOfConfigurations)
            return;
        }
        #else
        if ((uint8_t)USB_ControlRequest.wValue > DevDescriptorPtr->NumberOfConfigurations)
          return;
        #endif
        #endif

        Endpoint_ClearSETUP();

        USB_Device_ConfigurationNumber = (uint8_t)USB_ControlRequest.wValue;

        Endpoint_ClearStatusStage();

        if (USB_Device_ConfigurationNumber)
          USB_DeviceState = DEVICE_STATE_Configured;
        else
          USB_DeviceState = (USB_Device_IsAddressSet()) ? DEVICE_STATE_Configured : DEVICE_STATE_Powered;

        EVENT_USB_Device_ConfigurationChanged();
      }

      static void USB_Device_GetConfiguration(void)
      {
        Endpoint_ClearSETUP();

        Endpoint_Write_8(USB_Device_ConfigurationNumber);
        Endpoint_ClearIN();

        Endpoint_ClearStatusStage();
      }

      #if !defined(NO_INTERNAL_SERIAL) && (USE_INTERNAL_SERIAL != NO_DESCRIPTOR)
      static void USB_Device_GetInternalSerialDescriptor(void)
      {
        struct
        {
          USB_Descriptor_Header_t Header;
          uint16_t                UnicodeString[INTERNAL_SERIAL_LENGTH_BITS / 4];
        } SignatureDescriptor;

        SignatureDescriptor.Header.Type = DTYPE_String;
        SignatureDescriptor.Header.Size = USB_STRING_LEN(INTERNAL_SERIAL_LENGTH_BITS / 4);

        USB_Device_GetSerialString(SignatureDescriptor.UnicodeString);

        Endpoint_ClearSETUP();

        Endpoint_Write_Control_Stream_LE(&SignatureDescriptor, sizeof(SignatureDescriptor));
        Endpoint_ClearOUT();
      }
      #endif

      static void USB_Device_GetDescriptor(void)
      {
        const void* DescriptorPointer;
        uint16_t    DescriptorSize;

        #if defined(ARCH_HAS_MULTI_ADDRESS_SPACE) && \
            !(defined(USE_FLASH_DESCRIPTORS) || defined(USE_EEPROM_DESCRIPTORS) || defined(USE_RAM_DESCRIPTORS))
        uint8_t DescriptorAddressSpace;
        #endif

        #if !defined(NO_INTERNAL_SERIAL) && (USE_INTERNAL_SERIAL != NO_DESCRIPTOR)
        if (USB_ControlRequest.wValue == ((DTYPE_String << 8) | USE_INTERNAL_SERIAL))
        {
          USB_Device_GetInternalSerialDescriptor();
          return;
        }
        #endif

        if ((DescriptorSize = CALLBACK_USB_GetDescriptor(USB_ControlRequest.wValue, USB_ControlRequest.wIndex,
                                                         &DescriptorPointer
        #if defined(ARCH_HAS_MULTI_ADDRESS_SPACE) && \
            !(defined(USE_FLASH_DESCRIPTORS) || defined(USE_EEPROM_DESCRIPTORS) || defined(USE_RAM_DESCRIPTORS))
                                                         , &DescriptorAddressSpace
        #endif
                                 )) == NO_DESCRIPTOR)
        {
          return;
        }

        Endpoint_ClearSETUP();

        #if defined(USE_RAM_DESCRIPTORS) || !defined(ARCH_HAS_MULTI_ADDRESS_SPACE)
        Endpoint_Write_Control_Stream_LE(DescriptorPointer, DescriptorSize);
        #elif defined(USE_EEPROM_DESCRIPTORS)
        Endpoint_Write_Control_EStream_LE(DescriptorPointer, DescriptorSize);
        #elif defined(USE_FLASH_DESCRIPTORS)
        Endpoint_Write_Control_PStream_LE(DescriptorPointer, DescriptorSize);
        #else
        if (DescriptorAddressSpace == MEMSPACE_FLASH)
          Endpoint_Write_Control_PStream_LE(DescriptorPointer, DescriptorSize);
        else if (DescriptorAddressSpace == MEMSPACE_EEPROM)
          Endpoint_Write_Control_EStream_LE(DescriptorPointer, DescriptorSize);
        else
          Endpoint_Write_Control_Stream_LE(DescriptorPointer, DescriptorSize);
        #endif

        Endpoint_ClearOUT();
      }

      static void USB_Device_GetStatus(void)
      {
        uint8_t CurrentStatus = 0;

        switch (USB_ControlRequest.bmRequestType)
        {
          case (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_DEVICE):
            #if !defined(NO_DEVICE_SELF_POWER)
            if (USB_Device_CurrentlySelfPowered)
              CurrentStatus |= FEATURE_SELFPOWERED_ENABLED;
            #endif

            #if !defined(NO_DEVICE_REMOTE_WAKEUP)
            if (USB_Device_RemoteWakeupEnabled)
              CurrentStatus |= FEATURE_REMOTE_WAKEUP_ENABLED;
            #endif
            break;
          case (REQDIR_DEVICETOHOST | REQTYPE_STANDARD | REQREC_ENDPOINT):
            #if !defined(CONTROL_ONLY_DEVICE)
            Endpoint_SelectEndpoint((uint8_t)USB_ControlRequest.wIndex & ENDPOINT_EPNUM_MASK);

            CurrentStatus = Endpoint_IsStalled();

            Endpoint_SelectEndpoint(ENDPOINT_CONTROLEP);
            #endif

            break;
          default:
            return;
        }

        Endpoint_ClearSETUP();

        Endpoint_Write_16_LE(CurrentStatus);
        Endpoint_ClearIN();

        Endpoint_ClearStatusStage();
      }

      static void USB_Device_ClearSetFeature(void)
      {
        switch (USB_ControlRequest.bmRequestType & CONTROL_REQTYPE_RECIPIENT)
        {
          #if !defined(NO_DEVICE_REMOTE_WAKEUP)
          case REQREC_DEVICE:
            if ((uint8_t)USB_ControlRequest.wValue == FEATURE_SEL_DeviceRemoteWakeup)
              USB_Device_RemoteWakeupEnabled = (USB_ControlRequest.bRequest == REQ_SetFeature);
            else
              return;

            break;
          #endif
          #if !defined(CONTROL_ONLY_DEVICE)
          case REQREC_ENDPOINT:
            if ((uint8_t)USB_ControlRequest.wValue == FEATURE_SEL_EndpointHalt)
            {
              uint8_t EndpointIndex = ((uint8_t)USB_ControlRequest.wIndex & ENDPOINT_EPNUM_MASK);

              if (EndpointIndex == ENDPOINT_CONTROLEP)
                return;

              Endpoint_SelectEndpoint(EndpointIndex);

              if (Endpoint_IsEnabled())
              {
                if (USB_ControlRequest.bRequest == REQ_SetFeature)
                {
                  Endpoint_StallTransaction();
                }
                else
                {
                  Endpoint_ClearStall();
                  Endpoint_ResetEndpoint(EndpointIndex);
                  Endpoint_ResetDataToggle();
                }
              }
            }

            break;
          #endif
          default:
            return;
        }

        Endpoint_SelectEndpoint(ENDPOINT_CONTROLEP);

        Endpoint_ClearSETUP();

        Endpoint_ClearStatusStage();
      }

    #endif
  }+

  +{ #endif /* __DeviceStandardRequests_P__ */ }+
}