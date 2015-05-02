import pollen.environment as Env 
from Env import PA3
from Env import PA4
import Actions

module USBEvents {
  
  +{    
      USB_PIPE(ep_in,  0x81 | USB_EP_PP, USB_EP_TYPE_BULK_gc, 64, 8, PIPE_ENABLE_FLUSH);
      USB_PIPE(ep_out, 0x02 | USB_EP_PP, USB_EP_TYPE_BULK_gc, 64, 8, 0);
  }+

  +{

    void EVENT_USB_Device_ConfigurationChanged(uint8_t config){
      usb_pipe_init(&ep_in);
      usb_pipe_init(&ep_out);

      TCC0.CTRLA = TC_CLKSEL_DIV1024_gc; // 31.25KHz = 0.032ms
      TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc; // interrupt on timer overflow
      TCC0.PER = 1563; // ~50ms
      TCC0.CNT = 0;

      //`Actions.configurationChanged`();
    }

    // Event handler for the library USB Control Request reception event.
    bool EVENT_USB_Device_ControlRequest(USB_Request_Header_t* req){

      /*
      if ((req->bmRequestType & CONTROL_REQTYPE_TYPE) == REQTYPE_VENDOR){
        uint8_t id, r, g, b, br;

        switch(req->bRequest) {

          case 0xCC:    // color change request
            // if (endpoints[0].out.CNT == (sizeof(USB_Request_Header_t) + 5)) {     // ep0_buf_out, 
            //   `Actions.nocmd`(5);
            // } else {
            //   `Actions.nocmd`(endpoints[0].out.CNT);
            // }

            // if (req->wLength == 5) {
            //   if (ep0_buf_out)
            //   `Actions.nocmd`(50);
            // }
            // //   id = buf[0];
            // //   r = buf[1];
            // //   g = buf[2];
            // //   b = buf[3];
            // //   br = buf[4];
            // //   `Actions.setRGB`(id, r, g, b, br);
            // // } else {
            // //   `Actions.nocmd`(10);
            // // }

            // USB_ep_clear_done(1)

            USB_ep0_send(0);
            return true;

          case 0xBB:
            USB_enter_bootloader();
            break;  
        }

      }*/
      return false;
    }

  }+

  +{

    ISR(USB_BUSEVENT_vect){
      if (USB.INTFLAGSACLR & USB_SOFIF_bm){     // start of frame
        USB.INTFLAGSACLR = USB_SOFIF_bm;
      } else if (USB.INTFLAGSACLR & (USB_CRCIF_bm | USB_UNFIF_bm | USB_OVFIF_bm)){
        USB.INTFLAGSACLR = (USB_CRCIF_bm | USB_UNFIF_bm | USB_OVFIF_bm);
      } else if (USB.INTFLAGSACLR & USB_STALLIF_bm){
        USB.INTFLAGSACLR = USB_STALLIF_bm;
      } else if (USB.INTFLAGSACLR & USB_SUSPENDIF_bm) {
        USB.INTFLAGSACLR = USB_SUSPENDIF_bm;

        USB_DeviceState = DEVICE_STATE_Unattached;
        //EVENT_USB_Device_Disconnect();   
        `Actions.usbDisconnect`();
      
      } else if (USB.INTFLAGSACLR & USB_RESUMEIF_bm) {
        USB.INTFLAGSACLR = USB_RESUMEIF_bm;

        if (USB_Device_ConfigurationNumber)
          USB_DeviceState = DEVICE_STATE_Configured;
        else {
          bool addr = ((USB.ADDR != 0) ? true : false);
          USB_DeviceState = (addr) ? DEVICE_STATE_Addressed : DEVICE_STATE_Powered;
        }

        `Actions.usbConnect`();
        //EVENT_USB_Device_Connect();
      } else if (USB.INTFLAGSACLR & USB_RSTIF_bm) {
        USB.INTFLAGSACLR = USB_RSTIF_bm;

        USB_DeviceState                = DEVICE_STATE_Default;
        USB_Device_ConfigurationNumber = 0;

        USB_Evt_Task();
        //USB_ResetInterface();
        `Actions.usbReset`();
        //EVENT_USB_Device_Reset();
      }

      // else{
      //   USB.INTFLAGSACLR = USB_SUSPENDIF_bm | USB_RESUMEIF_bm | USB_RSTIF_bm;
      //   USB_Evt_Task();
      // }
    }

    ISR(USB_TRNCOMPL_vect){
      USB.FIFOWP = 0;
      USB.INTFLAGSBCLR = USB_SETUPIF_bm | USB_TRNIF_bm;
      USB_Task();
      usb_pipe_handle(&ep_in);
      usb_pipe_handle(&ep_out);

     `PA3.toggle`();
    }

    uint8_t counter = 0;
    ISR(TCC0_OVF_vect){

      `PA4.toggle`();

    }

  }+


}