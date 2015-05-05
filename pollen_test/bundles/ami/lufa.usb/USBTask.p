
import StdRequestType
import StdDescriptors

import USBDeviceDefines
import USBTaskDefines
import Endpoint

// Don't need to import both here, only one is used!
//import DeviceStandardRequests


module USBTask {
  
  +{
    #ifndef __USBTASK_P__
    #define __USBTASK_P__
  }+

  ////////////////////////////////////////
  // USBTask.h
  ////////////////////////////////////////  

  +{


  /* Private Interface - For use in library only: */
    #if defined(USB_CAN_BE_HOST)
      static void USB_HostTask(void);
    #endif

    #if defined(USB_CAN_BE_DEVICE)
      static void USB_DeviceTask(void);
    #endif

    /* Macros: */
      #define HOST_TASK_NONBLOCK_WAIT(Duration, NextState) MACROS{ USB_HostState   = HOST_STATE_WaitForDevice; \
                                                                   WaitMSRemaining = (Duration);               \
                                                                   PostWaitState   = (NextState);              }MACROE

  }+

  ////////////////////////////////////////
  // USBTask.c
  ////////////////////////////////////////  
  +{

    volatile bool        USB_IsInitialized;
    USB_Request_Header_t USB_ControlRequest;

    #if defined(USB_CAN_BE_HOST) && !defined(HOST_STATE_AS_GPIOR)
    volatile uint8_t     USB_HostState;
    #endif

    #if defined(USB_CAN_BE_DEVICE) && !defined(DEVICE_STATE_AS_GPIOR)
    volatile uint8_t     USB_DeviceState;
    #endif

    void USB_USBTask(void)
    {
      #if defined(USB_CAN_BE_BOTH)
        if (USB_CurrentMode == USB_MODE_Device)
          USB_DeviceTask();
        else if (USB_CurrentMode == USB_MODE_Host)
          USB_HostTask();
      #elif defined(USB_CAN_BE_HOST)
        USB_HostTask();
      #elif defined(USB_CAN_BE_DEVICE)
        USB_DeviceTask();
      #endif
    }

    #if defined(USB_CAN_BE_DEVICE)
    static void USB_DeviceTask(void)
    {
      if (USB_DeviceState == DEVICE_STATE_Unattached)
        return;

      uint8_t PrevEndpoint = Endpoint_GetCurrentEndpoint();

      Endpoint_SelectEndpoint(ENDPOINT_CONTROLEP);

      if (Endpoint_IsSETUPReceived())
        USB_Device_ProcessControlRequest();

      Endpoint_SelectEndpoint(PrevEndpoint);
    }
    #endif

    #if defined(USB_CAN_BE_HOST)
    static void USB_HostTask(void)
    {
      uint8_t PrevPipe = Pipe_GetCurrentPipe();

      Pipe_SelectPipe(PIPE_CONTROLPIPE);

      USB_Host_ProcessNextHostState();

      Pipe_SelectPipe(PrevPipe);
    }
    #endif

  }+

  +{ #endif /* __USBTASK_P__ */ }+
}