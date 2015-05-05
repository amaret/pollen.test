

module USBEvents {

  public doMidiTask() {
    +{ MIDI_Task() }+
  }

  deviceConnected() {
    // do something on device connected
  }

  deviceDisconnected() {
    // do something on device disconnected
  }

  configChangedReady() {
    // do something on config change to ready
  }

  configChangedError() {
    // do something on config change error
  }

  doMidiOutput() {
    +{
      Endpoint_SelectEndpoint(MIDI_STREAM_IN_EPADDR);

      if (Endpoint_IsINReady())
      {
        uint8_t MIDICommand = 0;
        uint8_t MIDIPitch;

        // uint8_t JoystickStatus  = Joystick_GetStatus();
        // uint8_t JoystickChanges = (JoystickStatus ^ PrevJoystickStatus);

        // /* Get board button status - if pressed use channel 10 (percussion), otherwise use channel 1 */
        uint8_t Channel = 0; //((Buttons_GetStatus() & BUTTONS_BUTTON1) ? MIDI_CHANNEL(10) : MIDI_CHANNEL(1));

        // if (JoystickChanges & JOY_LEFT)
        // {
        //   MIDICommand = ((JoystickStatus & JOY_LEFT)? MIDI_COMMAND_NOTE_ON : MIDI_COMMAND_NOTE_OFF);
        //   MIDIPitch   = 0x3C;
        // }

        // if (JoystickChanges & JOY_UP)
        // {
        //   MIDICommand = ((JoystickStatus & JOY_UP)? MIDI_COMMAND_NOTE_ON : MIDI_COMMAND_NOTE_OFF);
        //   MIDIPitch   = 0x3D;
        // }

        // if (JoystickChanges & JOY_RIGHT)
        // {
        //   MIDICommand = ((JoystickStatus & JOY_RIGHT)? MIDI_COMMAND_NOTE_ON : MIDI_COMMAND_NOTE_OFF);
        //   MIDIPitch   = 0x3E;
        // }

        // if (JoystickChanges & JOY_DOWN)
        // {
        //   MIDICommand = ((JoystickStatus & JOY_DOWN)? MIDI_COMMAND_NOTE_ON : MIDI_COMMAND_NOTE_OFF);
        //   MIDIPitch   = 0x3F;
        // }

        // if (JoystickChanges & JOY_PRESS)
        // {
        //   MIDICommand = ((JoystickStatus & JOY_PRESS)? MIDI_COMMAND_NOTE_ON : MIDI_COMMAND_NOTE_OFF);
        //   MIDIPitch   = 0x3B;
        // }

        /* Check if a MIDI command is to be sent */
        if (MIDICommand)
        {
          MIDI_EventPacket_t MIDIEvent = (MIDI_EventPacket_t)
            {
              .Event       = MIDI_EVENT(0, MIDICommand),

              .Data1       = MIDICommand | Channel,
              .Data2       = MIDIPitch,
              .Data3       = MIDI_STANDARD_VELOCITY,
            };

          /* Write the MIDI event packet to the endpoint */
          Endpoint_Write_Stream_LE(&MIDIEvent, sizeof(MIDIEvent), NULL);

          /* Send the data in the endpoint to the host */
          Endpoint_ClearIN();
        }

        /* Save previous joystick value for next joystick change detection */
        //PrevJoystickStatus = JoystickStatus;
      }    
    }+
  }

  doMidiInput() {
    +{
      /* Select the MIDI OUT stream */
      Endpoint_SelectEndpoint(MIDI_STREAM_OUT_EPADDR);

      /* Check if a MIDI command has been received */
      if (Endpoint_IsOUTReceived())
      {
        MIDI_EventPacket_t MIDIEvent;

        /* Read the MIDI event packet from the endpoint */
        Endpoint_Read_Stream_LE(&MIDIEvent, sizeof(MIDIEvent), NULL);

        /* Check to see if the sent command is a note on message with a non-zero velocity */
        if ((MIDIEvent.Event == MIDI_EVENT(0, MIDI_COMMAND_NOTE_ON)) && (MIDIEvent.Data3 > 0))
        {
          /* Change LEDs depending on the pitch of the sent note */
          //LEDs_SetAllLEDs(MIDIEvent.Data2 > 64 ? LEDS_LED1 : LEDS_LED2);
        }
        else
        {
          /* Turn off all LEDs in response to non Note On messages */
          //LEDs_SetAllLEDs(LEDS_NO_LEDS);
        }

        /* If the endpoint is now empty, clear the bank */
        if (!(Endpoint_BytesInEndpoint()))
        {
          /* Clear the endpoint ready for new packet */
          Endpoint_ClearOUT();
        }
      }
    }+

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

    /** Event handler for the USB_ConfigurationChanged event. This is fired when the host set the current configuration
     *  of the USB device after enumeration - the device endpoints are configured and the MIDI management task started.
     */
    void EVENT_USB_Device_ConfigurationChanged(void)
    {
      bool ConfigSuccess = true;

      /* Setup MIDI Data Endpoints */
      ConfigSuccess &= Endpoint_ConfigureEndpoint(MIDI_STREAM_IN_EPADDR, EP_TYPE_BULK, MIDI_STREAM_EPSIZE, 1);
      ConfigSuccess &= Endpoint_ConfigureEndpoint(MIDI_STREAM_OUT_EPADDR, EP_TYPE_BULK, MIDI_STREAM_EPSIZE, 1);

      /* Indicate endpoint configuration success or failure */
      if (ConfigSuccess) {
        `configChangedReady`();
      } else {
        `configChangedError`();  
      }
    }

    void EVENT_USB_Device_ControlRequest(void) {
      
    }


    /** Task to handle the generation of MIDI note change events in response to presses of the board joystick, and send them
     *  to the host.
     */
    void MIDI_Task(void)
    {
      /* Device must be connected and configured for the task to run */
      if (USB_DeviceState != DEVICE_STATE_Configured)
        return;

      `doMidiOutput`();
      `doMidiInput`();
    }

  }+

}