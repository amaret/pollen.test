import pollen.environment as Env 
import LedManager

module USBEvents {
  
  +{ 
    //#ifndef __USBEvents_P__
    //#define __USBEvents_P__
  }+

  +{
    /* Function Prototypes: */
    void HID_Task(void);

    void EVENT_USB_Device_Connect(void);
    void EVENT_USB_Device_Disconnect(void);
    void EVENT_USB_Device_ConfigurationChanged(void);
    void EVENT_USB_Device_ControlRequest(void);
    void EVENT_USB_Device_StartOfFrame(void);

    void ProcessGenericHIDReport(uint8_t* DataArray);
    void CreateGenericHIDReport(uint8_t* DataArray);

  }+

  //=================================================================
  // Private members of the modules
  //=================================================================
  uint8 dataBuffer[8] = {0}
  enum CommandType { SetRGB = 20, AllOn = 21, AllOff = 22, SetXY = 23 }

  //=================================================================
  // Public methods of USBEvents module
  //=================================================================

  public doHIDTask() {
    +{ HID_Task() }+
  }

  deviceConnected() {
    //LEDs_SetAllLEDs(LEDMASK_USB_ENUMERATING);
    LedManager.setRGBALed(22, 1, 1, 1, 0)
  }

  deviceDisconnected() {
   //LEDs_SetAllLEDs(LEDMASK_USB_NOTREADY);
    LedManager.setRGBALed(22, 0, 0, 0, 0)
  }

  configChangedReady() {
    LedManager.setRGBALed(23, 1, 1, 1, 0)
  }

  configChangedError() {

  }

  processGenericHIDReport() {
    uint8 id = dataBuffer[0]

    if (id == CommandType.SetRGB) {
      // arguments are led id, red, green, blue, brightness
      LedManager.setRGBALed(dataBuffer[1], dataBuffer[2], dataBuffer[3], dataBuffer[4], dataBuffer[5])
    } elif (id == CommandType.AllOn) {
      LedManager.allOn()
    } elif (id == CommandType.AllOff) {
      LedManager.allOff()
    } elif (id == CommandType.SetXY) {
      LedManager.setXY(dataBuffer[1], dataBuffer[2], dataBuffer[3], dataBuffer[4], dataBuffer[5])
    }

  }


  //=================================================================
  //=================================================================

  +{

    /** Event handler for the USB_Connect event. This indicates that the device is enumerating via the status LEDs and
     *  starts the library USB task to begin the enumeration and USB management process.
     */
    void EVENT_USB_Device_Connect(void)
    {
      /* Indicate USB enumerating */
      `deviceConnected`();
    }

    /** Event handler for the USB_Disconnect event. This indicates that the device is no longer connected to a host via
     *  the status LEDs and stops the USB management task.
     */
    void EVENT_USB_Device_Disconnect(void)
    {
      /* Indicate USB not ready */
      `deviceDisconnected`();
    }

    /** Event handler for the USB_ConfigurationChanged event. This is fired when the host sets the current configuration
     *  of the USB device after enumeration, and configures the generic HID device endpoints.
     */
    void EVENT_USB_Device_ConfigurationChanged(void)
    {
      bool ConfigSuccess = true;

      /* Setup HID Report Endpoints */
      ConfigSuccess &= Endpoint_ConfigureEndpoint(GENERIC_IN_EPADDR, EP_TYPE_INTERRUPT, GENERIC_EPSIZE, 1);
      ConfigSuccess &= Endpoint_ConfigureEndpoint(GENERIC_OUT_EPADDR, EP_TYPE_INTERRUPT, GENERIC_EPSIZE, 1);

      /* Indicate endpoint configuration success or failure */
      if (ConfigSuccess) {
        `configChangedReady`();
      } else {
        `configChangedError`();  
      }
      
    }

    /** Event handler for the USB_ControlRequest event. This is used to catch and process control requests sent to
     *  the device from the USB host before passing along unhandled control requests to the library for processing
     *  internally.
     */
    void EVENT_USB_Device_ControlRequest(void)
    {
      /* Handle HID Class specific requests */
      switch (USB_ControlRequest.bRequest)
      {
        case HID_REQ_GetReport:
          if (USB_ControlRequest.bmRequestType == (REQDIR_DEVICETOHOST | REQTYPE_CLASS | REQREC_INTERFACE))
          {
            uint8_t GenericData[GENERIC_REPORT_SIZE];
            CreateGenericHIDReport(GenericData);

            Endpoint_ClearSETUP();

            /* Write the report data to the control endpoint */
            Endpoint_Write_Control_Stream_LE(&GenericData, sizeof(GenericData));
            Endpoint_ClearOUT();
          }

          break;
        case HID_REQ_SetReport:
          if (USB_ControlRequest.bmRequestType == (REQDIR_HOSTTODEVICE | REQTYPE_CLASS | REQREC_INTERFACE))
          {
            //uint8_t GenericData[GENERIC_REPORT_SIZE];

            Endpoint_ClearSETUP();

            /* Read the report data from the control endpoint */
            //Endpoint_Read_Control_Stream_LE(&GenericData, sizeof(GenericData));
            Endpoint_Read_Control_Stream_LE(&`dataBuffer`, sizeof(`dataBuffer`));
            Endpoint_ClearIN();

            `processGenericHIDReport`();
          }

          break;
      }
    }

    /** Function to create the next report to send back to the host at the next reporting interval.
     *
     *  \param[out] DataArray  Pointer to a buffer where the next report data should be stored
     */
    void CreateGenericHIDReport(uint8_t* DataArray)
    {
      /*
        This is where you need to create reports to be sent to the host from the device. This
        function is called each time the host is ready to accept a new report. DataArray is
        an array to hold the report to the host.
      */

      // uint8_t CurrLEDMask = LEDs_GetLEDs();

      // DataArray[0] = ((CurrLEDMask & LEDS_LED1) ? 1 : 0);
      // DataArray[1] = ((CurrLEDMask & LEDS_LED2) ? 1 : 0);
      // DataArray[2] = ((CurrLEDMask & LEDS_LED3) ? 1 : 0);
      // DataArray[3] = ((CurrLEDMask & LEDS_LED4) ? 1 : 0);
    }

    void HID_Task(void)
    {
      /* Device must be connected and configured for the task to run */
      if (USB_DeviceState != DEVICE_STATE_Configured)
        return;

      Endpoint_SelectEndpoint(GENERIC_OUT_EPADDR);

      /* Check to see if a packet has been sent from the host */
      if (Endpoint_IsOUTReceived())
      {
        /* Check to see if the packet contains data */
        if (Endpoint_IsReadWriteAllowed())
        {
          /* Create a temporary buffer to hold the read in report from the host */
          //uint8_t GenericData[GENERIC_REPORT_SIZE];          

          /* Read Generic Report Data */
          //Endpoint_Read_Stream_LE(&GenericData, sizeof(GenericData), NULL);
          Endpoint_Read_Stream_LE(&`dataBuffer`, sizeof(`dataBuffer`), NULL);

          /* Process Generic Report Data */
          //ProcessGenericHIDReport(GenericData);
          `processGenericHIDReport`();
        }

        /* Finalize the stream transfer to send the last packet */
        Endpoint_ClearOUT();
      }

      Endpoint_SelectEndpoint(GENERIC_IN_EPADDR);

      /* Check to see if the host is ready to accept another packet */
      if (Endpoint_IsINReady())
      {
        /* Create a temporary buffer to hold the report to send to the host */
        //uint8_t GenericData[GENERIC_REPORT_SIZE];

        /* Create Generic Report Data */
        //CreateGenericHIDReport(GenericData);
        CreateGenericHIDReport(`dataBuffer`);

        /* Write Generic Report Data */
        //Endpoint_Write_Stream_LE(&GenericData, sizeof(GenericData), NULL);
        Endpoint_Write_Stream_LE(&`dataBuffer`, sizeof(`dataBuffer`), NULL);

        /* Finalize the stream transfer to send the last packet */
        Endpoint_ClearIN();
      }
    }

  }+

//  +{ #endif /* __USBEvents_P__ */}+

}