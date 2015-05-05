
module USBControllerXmegaDefines {
  
  +{
    #ifndef __USBControllerXmegaDefines_P__
    #define __USBControllerXmegaDefines_P__
  }+

  +{ #if (ARCH == ARCH_XMEGA) }+

  +{
    /* Private Interface - For use in library only: */
    #if !defined(__DOXYGEN__)
      /* Macros: */
        #if defined(MAX_ENDPOINT_INDEX)
          #define ENDPOINT_TABLE_COUNT  (MAX_ENDPOINT_INDEX + 1)
        #else
          #define ENDPOINT_TABLE_COUNT  16
        #endif

      /* Type Defines: */
        typedef struct
        {
          struct
          {
            USB_EP_t OUT;
            USB_EP_t IN;
          } Endpoints[ENDPOINT_TABLE_COUNT];
          uint16_t FrameNum;
        } ATTR_PACKED USB_EndpointTable_t;

      /* External Variables: */
        extern uint8_t USB_EndpointTable[];
    #endif

    #if !defined(F_USB)
      #error F_USB is not defined. You must define F_USB to the frequency of the unprescaled USB controller clock in your project makefile.
    #endif

    #if ((F_USB % 6000000) || (F_USB < 6000000))
      #error Invalid F_USB specified. F_USB must be a multiple of 6MHz for USB Low Speed operation, and a multiple of 48MHz for Full Speed operation.
    #endif

    /* Public Interface - May be used in end-application: */
      /* Macros: */
        /** \name USB Controller Option Masks */
        //@{
        /** Sets the USB bus interrupt priority level to be low priority. The USB bus interrupt is used for Start of Frame events, bus suspend
         *  and resume events, bus reset events and other events related to the management of the USB bus.
         */
        #define USB_OPT_BUSEVENT_PRILOW           ((0 << 2) | (0 << 1))

        /** Sets the USB bus interrupt priority level to be medium priority. The USB bus interrupt is used for Start of Frame events, bus suspend
         *  and resume events, bus reset events and other events related to the management of the USB bus.
         */
        #define USB_OPT_BUSEVENT_PRIMED           ((0 << 2) | (1 << 1))

        /** Sets the USB bus interrupt priority level to be high priority. The USB bus interrupt is used for Start of Frame events, bus suspend
         *  and resume events, bus reset events and other events related to the management of the USB bus.
         */
        #define USB_OPT_BUSEVENT_PRIHIGH          ((1 << 2) | (0 << 1))

        /** Sets the USB controller to source its clock from the internal RC 32MHz clock, once it has been DFLL calibrated to 48MHz. */
        #define USB_OPT_RC32MCLKSRC               (0 << 3)

        /** Sets the USB controller to source its clock from the internal PLL. */
        #define USB_OPT_PLLCLKSRC                 (1 << 3)
        //@}

        #if !defined(USB_STREAM_TIMEOUT_MS) || defined(__DOXYGEN__)
          /** Constant for the maximum software timeout period of the USB data stream transfer functions
           *  (both control and standard) when in either device or host mode. If the next packet of a stream
           *  is not received or acknowledged within this time period, the stream function will fail.
           *
           *  This value may be overridden in the user project makefile as the value of the
           *  \ref USB_STREAM_TIMEOUT_MS token, and passed to the compiler using the -D switch.
           */
          #define USB_STREAM_TIMEOUT_MS       100
        #endif

/* Function Prototypes: */
        /** Main function to initialize and start the USB interface. Once active, the USB interface will
         *  allow for device connection to a host when in device mode, or for device enumeration while in
         *  host mode.
         *
         *  As the USB library relies on interrupts for the device and host mode enumeration processes,
         *  the user must enable global interrupts before or shortly after this function is called. In
         *  device mode, interrupts must be enabled within 500ms of this function being called to ensure
         *  that the host does not time out whilst enumerating the device. In host mode, interrupts may be
         *  enabled at the application's leisure however enumeration will not begin of an attached device
         *  until after this has occurred.
         *
         *  Calling this function when the USB interface is already initialized will cause a complete USB
         *  interface reset and re-enumeration.
         *
         *  \param[in] Mode     Mask indicating what mode the USB interface is to be initialized to, a value
         *                      from the \ref USB_Modes_t enum.
         *                      \note This parameter does not exist on devices with only one supported USB
         *                            mode (device or host).
         *
         *  \param[in] Options  Mask indicating the options which should be used when initializing the USB
         *                      interface to control the USB interface's behavior. This should be comprised of
         *                      a \c USB_OPT_REG_* mask to control the regulator, a \c USB_OPT_*_PLL mask to control the
         *                      PLL, and a \c USB_DEVICE_OPT_* mask (when the device mode is enabled) to set the device
         *                      mode speed.
         *
         *  \note To reduce the FLASH requirements of the library if only device or host mode is required,
         *        the mode can be statically set in the project makefile by defining the token \c USB_DEVICE_ONLY
         *        (for device mode) or \c USB_HOST_ONLY (for host mode), passing the token to the compiler
         *        via the -D switch. If the mode is statically set, this parameter does not exist in the
         *        function prototype.
         *        \n\n
         *
         *  \note To reduce the FLASH requirements of the library if only fixed settings are required,
         *        the options may be set statically in the same manner as the mode (see the Mode parameter of
         *        this function). To statically set the USB options, pass in the \c USE_STATIC_OPTIONS token,
         *        defined to the appropriate options masks. When the options are statically set, this
         *        parameter does not exist in the function prototype.
         *        \n\n
         *
         *  \note The mode parameter does not exist on devices where only one mode is possible, such as USB
         *        AVR models which only implement the USB device mode in hardware.
         *
         *  \see \ref Group_Device for the \c USB_DEVICE_OPT_* masks.
         */
        void USB_Init(
                       #if defined(USB_CAN_BE_BOTH) || defined(__DOXYGEN__)
                       const uint8_t Mode
                       #endif

                       #if (defined(USB_CAN_BE_BOTH) && !defined(USE_STATIC_OPTIONS)) || defined(__DOXYGEN__)
                       ,
                       #elif (!defined(USB_CAN_BE_BOTH) && defined(USE_STATIC_OPTIONS))
                       void
                       #endif

                       #if !defined(USE_STATIC_OPTIONS) || defined(__DOXYGEN__)
                       const uint8_t Options
                       #endif
                       );

        /** Shuts down the USB interface. This turns off the USB interface after deallocating all USB FIFO
         *  memory, endpoints and pipes. When turned off, no USB functionality can be used until the interface
         *  is restarted with the \ref USB_Init() function.
         */
        void USB_Disable(void);

        /** Resets the interface, when already initialized. This will re-enumerate the device if already connected
         *  to a host, or re-enumerate an already attached device when in host mode.
         */
        void USB_ResetInterface(void);

      /* Global Variables: */
        #if defined(USB_CAN_BE_BOTH) || defined(__DOXYGEN__)
          /** Indicates the mode that the USB interface is currently initialized to, a value from the
           *  \ref USB_Modes_t enum.
           *
           *  \attention This variable should be treated as read-only in the user application, and never manually
           *             changed in value.
           *
           *  \note When the controller is initialized into UID auto-detection mode, this variable will hold the
           *        currently selected USB mode (i.e. \ref USB_MODE_Device or \ref USB_MODE_Host). If the controller
           *        is fixed into a specific mode (either through the \c USB_DEVICE_ONLY or \c USB_HOST_ONLY compile time
           *        options, or a limitation of the USB controller in the chosen device model) this will evaluate to
           *        a constant of the appropriate value and will never evaluate to \ref USB_MODE_None even when the
           *        USB interface is not initialized.
           */
          extern volatile uint8_t USB_CurrentMode;
        #elif defined(USB_CAN_BE_HOST)
          #define USB_CurrentMode USB_MODE_Host
        #elif defined(USB_CAN_BE_DEVICE)
          #define USB_CurrentMode USB_MODE_Device
        #endif

        #if !defined(USE_STATIC_OPTIONS) || defined(__DOXYGEN__)
          /** Indicates the current USB options that the USB interface was initialized with when \ref USB_Init()
           *  was called. This value will be one of the \c USB_MODE_* masks defined elsewhere in this module.
           *
           *  \attention This variable should be treated as read-only in the user application, and never manually
           *             changed in value.
           */
          extern volatile uint8_t USB_Options;
        #elif defined(USE_STATIC_OPTIONS)
          #define USB_Options USE_STATIC_OPTIONS
        #endif


      /* Enums: */
        enum USB_Interrupts_t
        {
          USB_INT_BUSEVENTI         = 1,
          USB_INT_BUSEVENTI_Suspend = 2,
          USB_INT_BUSEVENTI_Resume  = 3,
          USB_INT_BUSEVENTI_Reset   = 4,
          USB_INT_SOFI              = 5,
        };

       /* Function Prototypes: */
       void USB_INT_ClearAllInterrupts(void);
       void USB_INT_DisableAllInterrupts(void);
       void USB_INT_Enable(const uint8_t Interrupt);
       void USB_INT_Disable(const uint8_t Interrupt);




  }+


  +{ #endif /* (ARCH == ARCH_XMEGA) */ }+
  +{ #endif /* __USBControllerXmegaDefines_P__ */ }+

}