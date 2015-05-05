from lufa.usb import MidiClassDeviceCommon

module Descriptors {

  +{
    #ifndef __Descriptors_P__
    #define __Descriptors_P__    
  }+

  /////////////////////////
  // Descriptors.h
  /////////////////////////

  +{    
      /* Macros: */
        /** Endpoint address of the MIDI streaming data IN endpoint, for device-to-host data transfers. */
        #define MIDI_STREAM_IN_EPADDR       (ENDPOINT_DIR_IN  | 1)

        /** Endpoint address of the MIDI streaming data OUT endpoint, for host-to-device data transfers. */
        #define MIDI_STREAM_OUT_EPADDR      (ENDPOINT_DIR_OUT | 2)

        /** Endpoint size in bytes of the Audio isochronous streaming data IN and OUT endpoints. */
        #define MIDI_STREAM_EPSIZE          64

      /* Type Defines: */
        /** Type define for the device configuration descriptor structure. This must be defined in the
         *  application code, as the configuration descriptor contains several sub-descriptors which
         *  vary between devices, and which describe the device's usage to the host.
         */
        typedef struct
        {
          USB_Descriptor_Configuration_Header_t     Config;

          // MIDI Audio Control Interface
          USB_Descriptor_Interface_t                Audio_ControlInterface;
          USB_Audio_Descriptor_Interface_AC_t       Audio_ControlInterface_SPC;

          // MIDI Audio Streaming Interface
          USB_Descriptor_Interface_t                Audio_StreamInterface;
          USB_MIDI_Descriptor_AudioInterface_AS_t   Audio_StreamInterface_SPC;
          USB_MIDI_Descriptor_InputJack_t           MIDI_In_Jack_Emb;
          USB_MIDI_Descriptor_InputJack_t           MIDI_In_Jack_Ext;
          USB_MIDI_Descriptor_OutputJack_t          MIDI_Out_Jack_Emb;
          USB_MIDI_Descriptor_OutputJack_t          MIDI_Out_Jack_Ext;
          USB_Audio_Descriptor_StreamEndpoint_Std_t MIDI_In_Jack_Endpoint;
          USB_MIDI_Descriptor_Jack_Endpoint_t       MIDI_In_Jack_Endpoint_SPC;
          USB_Audio_Descriptor_StreamEndpoint_Std_t MIDI_Out_Jack_Endpoint;
          USB_MIDI_Descriptor_Jack_Endpoint_t       MIDI_Out_Jack_Endpoint_SPC;
        } USB_Descriptor_Configuration_t;

        /** Enum for the device string descriptor IDs within the device. Each string descriptor should
         *  have a unique ID index associated with it, which can be used to refer to the string from
         *  other descriptors.
         */
        enum StringDescriptors_t
        {
            STRING_ID_Language      = 0, /**< Supported Languages string descriptor ID (must be zero) */
            STRING_ID_Manufacturer  = 1, /**< Manufacturer string ID */
            STRING_ID_Product       = 2, /**< Product string ID */
        };

      /* Function Prototypes: */
        uint16_t CALLBACK_USB_GetDescriptor(const uint16_t wValue,
                                            const uint8_t wIndex,
                                            const void** const DescriptorAddress)
                                            ATTR_WARN_UNUSED_RESULT ATTR_NON_NULL_PTR_ARG(3);

  }+

  /////////////////////////
  // Descriptors.c
  /////////////////////////

  +{
      const USB_Descriptor_Device_t PROGMEM DeviceDescriptor =
      {
        .Header                 = {.Size = sizeof(USB_Descriptor_Device_t), .Type = DTYPE_Device},

        .USBSpecification       = VERSION_BCD(01.10),
        .Class                  = USB_CSCP_NoDeviceClass,
        .SubClass               = USB_CSCP_NoDeviceSubclass,
        .Protocol               = USB_CSCP_NoDeviceProtocol,

        .Endpoint0Size          = FIXED_CONTROL_ENDPOINT_SIZE,

        .VendorID               = 0x2323,
        .ProductID              = 0x2222,
        .ReleaseNumber          = VERSION_BCD(00.01),

        .ManufacturerStrIndex   = STRING_ID_Manufacturer,
        .ProductStrIndex        = STRING_ID_Product,
        .SerialNumStrIndex      = NO_DESCRIPTOR,

        .NumberOfConfigurations = FIXED_NUM_CONFIGURATIONS
      };

      /** Configuration descriptor structure. This descriptor, located in FLASH memory, describes the usage
       *  of the device in one of its supported configurations, including information about any device interfaces
       *  and endpoints. The descriptor is read out by the USB host during the enumeration process when selecting
       *  a configuration so that the host may correctly communicate with the USB device.
       */
      const USB_Descriptor_Configuration_t PROGMEM ConfigurationDescriptor =
      {
        .Config =
          {
            .Header                   = {.Size = sizeof(USB_Descriptor_Configuration_Header_t), .Type = DTYPE_Configuration},

            .TotalConfigurationSize   = sizeof(USB_Descriptor_Configuration_t),
            .TotalInterfaces          = 2,

            .ConfigurationNumber      = 1,
            .ConfigurationStrIndex    = NO_DESCRIPTOR,

            .ConfigAttributes         = (USB_CONFIG_ATTR_RESERVED | USB_CONFIG_ATTR_SELFPOWERED),

            .MaxPowerConsumption      = USB_CONFIG_POWER_MA(100)
          },

        .Audio_ControlInterface =
          {
            .Header                   = {.Size = sizeof(USB_Descriptor_Interface_t), .Type = DTYPE_Interface},

            .InterfaceNumber          = 0,
            .AlternateSetting         = 0,

            .TotalEndpoints           = 0,

            .Class                    = AUDIO_CSCP_AudioClass,
            .SubClass                 = AUDIO_CSCP_ControlSubclass,
            .Protocol                 = AUDIO_CSCP_ControlProtocol,

            .InterfaceStrIndex        = NO_DESCRIPTOR
          },

        .Audio_ControlInterface_SPC =
          {
            .Header                   = {.Size = sizeof(USB_Audio_Descriptor_Interface_AC_t), .Type = DTYPE_CSInterface},
            .Subtype                  = AUDIO_DSUBTYPE_CSInterface_Header,

            .ACSpecification          = VERSION_BCD(01.00),
            .TotalLength              = sizeof(USB_Audio_Descriptor_Interface_AC_t),

            .InCollection             = 1,
            .InterfaceNumber          = 1,
          },

        .Audio_StreamInterface =
          {
            .Header                   = {.Size = sizeof(USB_Descriptor_Interface_t), .Type = DTYPE_Interface},

            .InterfaceNumber          = 1,
            .AlternateSetting         = 0,

            .TotalEndpoints           = 2,

            .Class                    = AUDIO_CSCP_AudioClass,
            .SubClass                 = AUDIO_CSCP_MIDIStreamingSubclass,
            .Protocol                 = AUDIO_CSCP_StreamingProtocol,

            .InterfaceStrIndex        = NO_DESCRIPTOR
          },

        .Audio_StreamInterface_SPC =
          {
            .Header                   = {.Size = sizeof(USB_MIDI_Descriptor_AudioInterface_AS_t), .Type = DTYPE_CSInterface},
            .Subtype                  = AUDIO_DSUBTYPE_CSInterface_General,

            .AudioSpecification       = VERSION_BCD(01.00),

            .TotalLength              = (sizeof(USB_Descriptor_Configuration_t) -
                                         offsetof(USB_Descriptor_Configuration_t, Audio_StreamInterface_SPC))
          },

        .MIDI_In_Jack_Emb =
          {
            .Header                   = {.Size = sizeof(USB_MIDI_Descriptor_InputJack_t), .Type = DTYPE_CSInterface},
            .Subtype                  = AUDIO_DSUBTYPE_CSInterface_InputTerminal,

            .JackType                 = MIDI_JACKTYPE_Embedded,
            .JackID                   = 0x01,

            .JackStrIndex             = NO_DESCRIPTOR
          },

        .MIDI_In_Jack_Ext =
          {
            .Header                   = {.Size = sizeof(USB_MIDI_Descriptor_InputJack_t), .Type = DTYPE_CSInterface},
            .Subtype                  = AUDIO_DSUBTYPE_CSInterface_InputTerminal,

            .JackType                 = MIDI_JACKTYPE_External,
            .JackID                   = 0x02,

            .JackStrIndex             = NO_DESCRIPTOR
          },

        .MIDI_Out_Jack_Emb =
          {
            .Header                   = {.Size = sizeof(USB_MIDI_Descriptor_OutputJack_t), .Type = DTYPE_CSInterface},
            .Subtype                  = AUDIO_DSUBTYPE_CSInterface_OutputTerminal,

            .JackType                 = MIDI_JACKTYPE_Embedded,
            .JackID                   = 0x03,

            .NumberOfPins             = 1,
            .SourceJackID             = {0x02},
            .SourcePinID              = {0x01},

            .JackStrIndex             = NO_DESCRIPTOR
          },

        .MIDI_Out_Jack_Ext =
          {
            .Header                   = {.Size = sizeof(USB_MIDI_Descriptor_OutputJack_t), .Type = DTYPE_CSInterface},
            .Subtype                  = AUDIO_DSUBTYPE_CSInterface_OutputTerminal,

            .JackType                 = MIDI_JACKTYPE_External,
            .JackID                   = 0x04,

            .NumberOfPins             = 1,
            .SourceJackID             = {0x01},
            .SourcePinID              = {0x01},

            .JackStrIndex             = NO_DESCRIPTOR
          },

        .MIDI_In_Jack_Endpoint =
          {
            .Endpoint =
              {
                .Header              = {.Size = sizeof(USB_Audio_Descriptor_StreamEndpoint_Std_t), .Type = DTYPE_Endpoint},

                .EndpointAddress     = MIDI_STREAM_OUT_EPADDR,
                .Attributes          = (EP_TYPE_BULK | ENDPOINT_ATTR_NO_SYNC | ENDPOINT_USAGE_DATA),
                .EndpointSize        = MIDI_STREAM_EPSIZE,
                .PollingIntervalMS   = 0x05
              },

            .Refresh                  = 0,
            .SyncEndpointNumber       = 0
          },

        .MIDI_In_Jack_Endpoint_SPC =
          {
            .Header                   = {.Size = sizeof(USB_MIDI_Descriptor_Jack_Endpoint_t), .Type = DTYPE_CSEndpoint},
            .Subtype                  = AUDIO_DSUBTYPE_CSEndpoint_General,

            .TotalEmbeddedJacks       = 0x01,
            .AssociatedJackID         = {0x01}
          },

        .MIDI_Out_Jack_Endpoint =
          {
            .Endpoint =
              {
                .Header              = {.Size = sizeof(USB_Audio_Descriptor_StreamEndpoint_Std_t), .Type = DTYPE_Endpoint},

                .EndpointAddress     = MIDI_STREAM_IN_EPADDR,
                .Attributes          = (EP_TYPE_BULK | ENDPOINT_ATTR_NO_SYNC | ENDPOINT_USAGE_DATA),
                .EndpointSize        = MIDI_STREAM_EPSIZE,
                .PollingIntervalMS   = 0x05
              },

            .Refresh                  = 0,
            .SyncEndpointNumber       = 0
          },

        .MIDI_Out_Jack_Endpoint_SPC =
          {
            .Header                   = {.Size = sizeof(USB_MIDI_Descriptor_Jack_Endpoint_t), .Type = DTYPE_CSEndpoint},
            .Subtype                  = AUDIO_DSUBTYPE_CSEndpoint_General,

            .TotalEmbeddedJacks       = 0x01,
            .AssociatedJackID         = {0x03}
          }
      };

      /** Language descriptor structure. This descriptor, located in FLASH memory, is returned when the host requests
       *  the string descriptor with index 0 (the first index). It is actually an array of 16-bit integers, which indicate
       *  via the language ID table available at USB.org what languages the device supports for its string descriptors.
       */
      const USB_Descriptor_String_t PROGMEM LanguageString =
      {
        .Header                 = {.Size = USB_STRING_LEN(1), .Type = DTYPE_String},

        .UnicodeString          = {LANGUAGE_ID_ENG}
      };

      /** Manufacturer descriptor string. This is a Unicode string containing the manufacturer's details in human readable
       *  form, and is read out upon request by the host when the appropriate string ID is requested, listed in the Device
       *  Descriptor.
       */
      const USB_Descriptor_String_t PROGMEM ManufacturerString =
      {
        .Header                 = {.Size = USB_STRING_LEN(12), .Type = DTYPE_String},

        .UnicodeString          = L"Amaret, Inc."
      };

      /** Product descriptor string. This is a Unicode string containing the product's details in human readable form,
       *  and is read out upon request by the host when the appropriate string ID is requested, listed in the Device
       *  Descriptor.
       */
      const USB_Descriptor_String_t PROGMEM ProductString =
      {
        .Header                 = {.Size = USB_STRING_LEN(16), .Type = DTYPE_String},

        .UnicodeString          = L"Pollen Midi Test"
      };

      /** This function is called by the library when in device mode, and must be overridden (see library "USB Descriptors"
       *  documentation) by the application code so that the address and size of a requested descriptor can be given
       *  to the USB library. When the device receives a Get Descriptor request on the control endpoint, this function
       *  is called so that the descriptor details can be passed back and the appropriate descriptor sent back to the
       *  USB host.
       */
      uint16_t CALLBACK_USB_GetDescriptor(const uint16_t wValue,
                                          const uint8_t wIndex,
                                          const void** const DescriptorAddress)
      {
        const uint8_t  DescriptorType   = (wValue >> 8);
        const uint8_t  DescriptorNumber = (wValue & 0xFF);

        const void* Address = NULL;
        uint16_t    Size    = NO_DESCRIPTOR;

        switch (DescriptorType)
        {
          case DTYPE_Device:
            Address = &DeviceDescriptor;
            Size    = sizeof(USB_Descriptor_Device_t);
            break;
          case DTYPE_Configuration:
            Address = &ConfigurationDescriptor;
            Size    = sizeof(USB_Descriptor_Configuration_t);
            break;
          case DTYPE_String:
            switch (DescriptorNumber)
            {
              case STRING_ID_Language:
                Address = &LanguageString;
                Size    = pgm_read_byte(&LanguageString.Header.Size);
                break;
              case STRING_ID_Manufacturer:
                Address = &ManufacturerString;
                Size    = pgm_read_byte(&ManufacturerString.Header.Size);
                break;
              case STRING_ID_Product:
                Address = &ProductString;
                Size    = pgm_read_byte(&ProductString.Header.Size);
                break;
            }

            break;
        }

        *DescriptorAddress = Address;
        return Size;
      }

  }+

  +{ #endif /* __Descriptors_P__ */ }+

}