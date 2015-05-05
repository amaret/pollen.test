import USBControllerDefines

module EndpointDefines {
  
  +{
    #ifndef __USB_EndpointDefines_P__
    #define __USB_EndpointDefines_P__
  }+

  +{

    /* Public Interface - May be used in end-application: */
      /* Type Defines: */
        /** Type define for a endpoint table entry, used to configure endpoints in groups via
         *  \ref Endpoint_ConfigureEndpointTable().
         */
        typedef struct
        {
          uint8_t  Address; /**< Address of the endpoint to configure, or zero if the table entry is to be unused. */
          uint16_t Size; /**< Size of the endpoint bank, in bytes. */
          uint8_t  Type; /**< Type of the endpoint, a \c EP_TYPE_* mask. */
          uint8_t  Banks; /**< Number of hardware banks to use for the endpoint. */
        } USB_Endpoint_Table_t;
    
      /* Macros: */
        /** Endpoint number mask, for masking against endpoint addresses to retrieve the endpoint's
         *  numerical address in the device.
         */
        #define ENDPOINT_EPNUM_MASK                     0x0F

        /** Endpoint address for the default control endpoint, which always resides in address 0. This is
         *  defined for convenience to give more readable code when used with the endpoint macros.
         */
        #define ENDPOINT_CONTROLEP                      0
        

            /* Public Interface - May be used in end-application: */
    /* Macros: */
      #if (!defined(MAX_ENDPOINT_INDEX) && !defined(CONTROL_ONLY_DEVICE)) || defined(__DOXYGEN__)
        /** Total number of endpoints (including the default control endpoint at address 0) which may
         *  be used in the device. Different USB AVR models support different amounts of endpoints,
         *  this value reflects the maximum number of endpoints for the currently selected AVR model.
         */
        #define ENDPOINT_TOTAL_ENDPOINTS            16
      #else
        #if defined(CONTROL_ONLY_DEVICE)
          #define ENDPOINT_TOTAL_ENDPOINTS        1
        #else
          #define ENDPOINT_TOTAL_ENDPOINTS        (MAX_ENDPOINT_INDEX + 1)
        #endif
      #endif


    /* Type Defines: */
      typedef struct
      {
        uint8_t Data[64];

        uint8_t Length;
        uint8_t Position;
      } Endpoint_FIFO_t;

      typedef struct
      {
        Endpoint_FIFO_t OUT;
        Endpoint_FIFO_t IN;
      } Endpoint_FIFOPair_t;

    /* External Variables: */
      extern Endpoint_FIFOPair_t       USB_Endpoint_FIFOs[ENDPOINT_TOTAL_ENDPOINTS];
      extern volatile uint8_t          USB_Endpoint_SelectedEndpoint;
      extern volatile USB_EP_t*        USB_Endpoint_SelectedHandle;
      extern volatile Endpoint_FIFO_t* USB_Endpoint_SelectedFIFO;

    /* Function Prototypes: */
      bool Endpoint_ConfigureEndpoint_PRV(const uint8_t Address,
                                          const uint8_t Config,
                                          const uint8_t Size);
      void Endpoint_ClearEndpoints(void);



  /* Public Interface - May be used in end-application: */
    /* Macros: */
      #if (!defined(FIXED_CONTROL_ENDPOINT_SIZE) || defined(__DOXYGEN__))
        /** Default size of the default control endpoint's bank, until altered by the control endpoint bank size
         *  value in the device descriptor. Not available if the \c FIXED_CONTROL_ENDPOINT_SIZE token is defined.
         */
        #define ENDPOINT_CONTROLEP_DEFAULT_SIZE     8
      #endif

    /* Enums: */
      /** Enum for the possible error return codes of the \ref Endpoint_WaitUntilReady() function.
       *
       *  \ingroup Group_EndpointRW_XMEGA
       */
      enum Endpoint_WaitUntilReady_ErrorCodes_t
      {
        ENDPOINT_READYWAIT_NoError                 = 0, /**< Endpoint is ready for next packet, no error. */
        ENDPOINT_READYWAIT_EndpointStalled         = 1, /**< The endpoint was stalled during the stream
                                                         *   transfer by the host or device.
                                                         */
        ENDPOINT_READYWAIT_DeviceDisconnected      = 2, /**< Device was disconnected from the host while
                                                         *   waiting for the endpoint to become ready.
                                                         */
        ENDPOINT_READYWAIT_BusSuspended            = 3, /**< The USB bus has been suspended by the host and
                                                         *   no USB endpoint traffic can occur until the bus
                                                         *   has resumed.
                                                         */
        ENDPOINT_READYWAIT_Timeout                 = 4, /**< The host failed to accept or send the next packet
                                                         *   within the software timeout period set by the
                                                         *   \ref USB_STREAM_TIMEOUT_MS macro.
                                                         */
      };

      /** Selects the given endpoint address.
       *
       *  Any endpoint operations which do not require the endpoint address to be indicated will operate on
       *  the currently selected endpoint.
       *
       *  \param[in] Address  Endpoint address to select.
       */
      void Endpoint_SelectEndpoint(const uint8_t Address);


      /** Determines if the selected IN endpoint is ready for a new packet to be sent to the host.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       *
       *  \return Boolean \c true if the current endpoint is ready for an IN packet, \c false otherwise.
       */
      bool Endpoint_IsINReady(void) ATTR_WARN_UNUSED_RESULT;

      /** Determines if the selected OUT endpoint has received new packet from the host.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       *
       *  \return Boolean \c true if current endpoint is has received an OUT packet, \c false otherwise.
       */
      bool Endpoint_IsOUTReceived(void) ATTR_WARN_UNUSED_RESULT;

      /** Determines if the current CONTROL type endpoint has received a SETUP packet.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       *
       *  \return Boolean \c true if the selected endpoint has received a SETUP packet, \c false otherwise.
       */
      bool Endpoint_IsSETUPReceived(void) ATTR_WARN_UNUSED_RESULT;

      /** Clears a received SETUP packet on the currently selected CONTROL type endpoint, freeing up the
       *  endpoint for the next packet.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       *
       *  \note This is not applicable for non CONTROL type endpoints.
       */
      void Endpoint_ClearSETUP(void);

      /** Sends an IN packet to the host on the currently selected endpoint, freeing up the endpoint for the
       *  next packet and switching to the alternative endpoint bank if double banked.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       */
      void Endpoint_ClearIN(void);

      /** Acknowledges an OUT packet to the host on the currently selected endpoint, freeing up the endpoint
       *  for the next packet and switching to the alternative endpoint bank if double banked.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       */
      void Endpoint_ClearOUT(void);

      /** Stalls the current endpoint, indicating to the host that a logical problem occurred with the
       *  indicated endpoint and that the current transfer sequence should be aborted. This provides a
       *  way for devices to indicate invalid commands to the host so that the current transfer can be
       *  aborted and the host can begin its own recovery sequence.
       *
       *  The currently selected endpoint remains stalled until either the \ref Endpoint_ClearStall() macro
       *  is called, or the host issues a CLEAR FEATURE request to the device for the currently selected
       *  endpoint.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       */
      void Endpoint_StallTransaction(void);


      /** Reads one byte from the currently selected endpoint's bank, for OUT direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \return Next byte in the currently selected endpoint's FIFO buffer.
       */
      uint8_t Endpoint_Read_8(void) ATTR_WARN_UNUSED_RESULT;

      /** Writes one byte to the currently selected endpoint's bank, for IN direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \param[in] Data  Data to write into the the currently selected endpoint's FIFO buffer.
       */
      void Endpoint_Write_8(const uint8_t Data);


    /* External Variables: */
      /** Global indicating the maximum packet size of the default control endpoint located at address
       *  0 in the device. This value is set to the value indicated in the device descriptor in the user
       *  project once the USB interface is initialized into device mode.
       *
       *  If space is an issue, it is possible to fix this to a static value by defining the control
       *  endpoint size in the \c FIXED_CONTROL_ENDPOINT_SIZE token passed to the compiler in the makefile
       *  via the -D switch. When a fixed control endpoint size is used, the size is no longer dynamically
       *  read from the descriptors at runtime and instead fixed to the given value. When used, it is
       *  important that the descriptor control endpoint size value matches the size given as the
       *  \c FIXED_CONTROL_ENDPOINT_SIZE token - it is recommended that the \c FIXED_CONTROL_ENDPOINT_SIZE token
       *  be used in the device descriptors to ensure this.
       *
       *  \attention This variable should be treated as read-only in the user application, and never manually
       *             changed in value.
       */
      #if (!defined(FIXED_CONTROL_ENDPOINT_SIZE) || defined(__DOXYGEN__))
        extern uint8_t USB_Device_ControlEndpointSize;
      #else
        #define USB_Device_ControlEndpointSize FIXED_CONTROL_ENDPOINT_SIZE
      #endif

    /* Function Prototypes: */
      /** Configures a table of endpoint descriptions, in sequence. This function can be used to configure multiple
       *  endpoints at the same time.
       *
       *  \note Endpoints with a zero address will be ignored, thus this function cannot be used to configure the
       *        control endpoint.
       *
       *  \param[in] Table    Pointer to a table of endpoint descriptions.
       *  \param[in] Entries  Number of entries in the endpoint table to configure.
       *
       *  \return Boolean \c true if all endpoints configured successfully, \c false otherwise.
       */
      bool Endpoint_ConfigureEndpointTable(const USB_Endpoint_Table_t* const Table,
                                           const uint8_t Entries);

      /** Completes the status stage of a control transfer on a CONTROL type endpoint automatically,
       *  with respect to the data direction. This is a convenience function which can be used to
       *  simplify user control request handling.
       *
       *  \note This routine should not be called on non CONTROL type endpoints.
       */
      void Endpoint_ClearStatusStage(void);

      /** Spin-loops until the currently selected non-control endpoint is ready for the next packet of data
       *  to be read or written to it.
       *
       *  \note This routine should not be called on CONTROL type endpoints.
       *
       *  \ingroup Group_EndpointRW_XMEGA
       *
       *  \return A value from the \ref Endpoint_WaitUntilReady_ErrorCodes_t enum.
       */
      uint8_t Endpoint_WaitUntilReady(void);
  }+

 +{

  /* Public Interface - May be used in end-application: */
    /* Function Prototypes: */
      /** \name Stream functions for null data */
      //@{

      /** Reads and discards the given number of bytes from the currently selected endpoint's bank,
       *  discarding fully read packets from the host as needed. The last packet is not automatically
       *  discarded once the remaining bytes has been read; the user is responsible for manually
       *  discarding the last packet from the host via the \ref Endpoint_ClearOUT() macro.
       *
       *  If the BytesProcessed parameter is \c NULL, the entire stream transfer is attempted at once,
       *  failing or succeeding as a single unit. If the BytesProcessed parameter points to a valid
       *  storage location, the transfer will instead be performed as a series of chunks. Each time
       *  the endpoint bank becomes empty while there is still data to process (and after the current
       *  packet has been acknowledged) the BytesProcessed location will be updated with the total number
       *  of bytes processed in the stream, and the function will exit with an error code of
       *  \ref ENDPOINT_RWSTREAM_IncompleteTransfer. This allows for any abort checking to be performed
       *  in the user code - to continue the transfer, call the function again with identical parameters
       *  and it will resume until the BytesProcessed value reaches the total transfer length.
       *
       *  <b>Single Stream Transfer Example:</b>
       *  \code
       *  uint8_t ErrorCode;
       *  
       *  if ((ErrorCode = Endpoint_Discard_Stream(512, NULL)) != ENDPOINT_RWSTREAM_NoError)
       *  {
       *       // Stream failed to complete - check ErrorCode here
       *  }
       *  \endcode
       *
       *  <b>Partial Stream Transfers Example:</b>
       *  \code
       *  uint8_t  ErrorCode;
       *  uint16_t BytesProcessed;
       *  
       *  BytesProcessed = 0;
       *  while ((ErrorCode = Endpoint_Discard_Stream(512, &BytesProcessed)) == ENDPOINT_RWSTREAM_IncompleteTransfer)
       *  {
       *      // Stream not yet complete - do other actions here, abort if required
       *  }
       *  
       *  if (ErrorCode != ENDPOINT_RWSTREAM_NoError)
       *  {
       *      // Stream failed to complete - check ErrorCode here
       *  }
       *  \endcode
       *
       *  \note This routine should not be used on CONTROL type endpoints.
       *
       *  \param[in] Length          Number of bytes to discard via the currently selected endpoint.
       *  \param[in] BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                             transaction should be updated, \c NULL if the entire stream should be read at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Discard_Stream(uint16_t Length,
                                      uint16_t* const BytesProcessed);

      /** Writes a given number of zeroed bytes to the currently selected endpoint's bank, sending
       *  full packets to the host as needed. The last packet is not automatically sent once the 
       *  remaining bytes have been written; the user is responsible for manually sending the last
       *  packet to the host via the \ref Endpoint_ClearIN() macro.
       *
       *  If the BytesProcessed parameter is \c NULL, the entire stream transfer is attempted at once,
       *  failing or succeeding as a single unit. If the BytesProcessed parameter points to a valid
       *  storage location, the transfer will instead be performed as a series of chunks. Each time
       *  the endpoint bank becomes full while there is still data to process (and after the current
       *  packet transmission has been initiated) the BytesProcessed location will be updated with the
       *  total number of bytes processed in the stream, and the function will exit with an error code of
       *  \ref ENDPOINT_RWSTREAM_IncompleteTransfer. This allows for any abort checking to be performed
       *  in the user code - to continue the transfer, call the function again with identical parameters
       *  and it will resume until the BytesProcessed value reaches the total transfer length.
       *
       *  <b>Single Stream Transfer Example:</b>
       *  \code
       *  uint8_t ErrorCode;
       *  
       *  if ((ErrorCode = Endpoint_Null_Stream(512, NULL)) != ENDPOINT_RWSTREAM_NoError)
       *  {
       *       // Stream failed to complete - check ErrorCode here
       *  }
       *  \endcode
       *
       *  <b>Partial Stream Transfers Example:</b>
       *  \code
       *  uint8_t  ErrorCode;
       *  uint16_t BytesProcessed;
       *  
       *  BytesProcessed = 0;
       *  while ((ErrorCode = Endpoint_Null_Stream(512, &BytesProcessed)) == ENDPOINT_RWSTREAM_IncompleteTransfer)
       *  {
       *      // Stream not yet complete - do other actions here, abort if required
       *  }
       *  
       *  if (ErrorCode != ENDPOINT_RWSTREAM_NoError)
       *  {
       *      // Stream failed to complete - check ErrorCode here
       *  }
       *  \endcode
       *
       *  \note This routine should not be used on CONTROL type endpoints.
       *
       *  \param[in] Length          Number of zero bytes to send via the currently selected endpoint.
       *  \param[in] BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                             transaction should be updated, \c NULL if the entire stream should be read at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Null_Stream(uint16_t Length,
                                   uint16_t* const BytesProcessed);

      //@}

      /** \name Stream functions for RAM source/destination data */
      //@{
    
      /** Writes the given number of bytes to the endpoint from the given buffer in little endian,
       *  sending full packets to the host as needed. The last packet filled is not automatically sent;
       *  the user is responsible for manually sending the last written packet to the host via the
       *  \ref Endpoint_ClearIN() macro.
       *
       *  If the BytesProcessed parameter is \c NULL, the entire stream transfer is attempted at once,
       *  failing or succeeding as a single unit. If the BytesProcessed parameter points to a valid
       *  storage location, the transfer will instead be performed as a series of chunks. Each time
       *  the endpoint bank becomes full while there is still data to process (and after the current
       *  packet transmission has been initiated) the BytesProcessed location will be updated with the
       *  total number of bytes processed in the stream, and the function will exit with an error code of
       *  \ref ENDPOINT_RWSTREAM_IncompleteTransfer. This allows for any abort checking to be performed
       *  in the user code - to continue the transfer, call the function again with identical parameters
       *  and it will resume until the BytesProcessed value reaches the total transfer length.
       *
       *  <b>Single Stream Transfer Example:</b>
       *  \code
       *  uint8_t DataStream[512];
       *  uint8_t ErrorCode;
       *  
       *  if ((ErrorCode = Endpoint_Write_Stream_LE(DataStream, sizeof(DataStream),
       *                                            NULL)) != ENDPOINT_RWSTREAM_NoError)
       *  {
       *       // Stream failed to complete - check ErrorCode here
       *  }
       *  \endcode
       *
       *  <b>Partial Stream Transfers Example:</b>
       *  \code
       *  uint8_t  DataStream[512];
       *  uint8_t  ErrorCode;
       *  uint16_t BytesProcessed;
       *  
       *  BytesProcessed = 0;
       *  while ((ErrorCode = Endpoint_Write_Stream_LE(DataStream, sizeof(DataStream),
       *                                               &BytesProcessed)) == ENDPOINT_RWSTREAM_IncompleteTransfer)
       *  {
       *      // Stream not yet complete - do other actions here, abort if required
       *  }
       *  
       *  if (ErrorCode != ENDPOINT_RWSTREAM_NoError)
       *  {
       *      // Stream failed to complete - check ErrorCode here
       *  }
       *  \endcode
       *
       *  \note This routine should not be used on CONTROL type endpoints.
       *
       *  \param[in] Buffer          Pointer to the source data buffer to read from.
       *  \param[in] Length          Number of bytes to read for the currently selected endpoint into the buffer.
       *  \param[in] BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                             transaction should be updated, \c NULL if the entire stream should be written at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_Stream_LE(const void* const Buffer,
                                       uint16_t Length,
                                       uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** Writes the given number of bytes to the endpoint from the given buffer in big endian,
       *  sending full packets to the host as needed. The last packet filled is not automatically sent;
       *  the user is responsible for manually sending the last written packet to the host via the
       *  \ref Endpoint_ClearIN() macro.
       *
       *  \note This routine should not be used on CONTROL type endpoints.
       *
       *  \param[in] Buffer          Pointer to the source data buffer to read from.
       *  \param[in] Length          Number of bytes to read for the currently selected endpoint into the buffer.
       *  \param[in] BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                             transaction should be updated, \c NULL if the entire stream should be written at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_Stream_BE(const void* const Buffer,
                                       uint16_t Length,
                                       uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);
      
      /** Reads the given number of bytes from the endpoint from the given buffer in little endian,
       *  discarding fully read packets from the host as needed. The last packet is not automatically
       *  discarded once the remaining bytes has been read; the user is responsible for manually
       *  discarding the last packet from the host via the \ref Endpoint_ClearOUT() macro.
       *
       *  If the BytesProcessed parameter is \c NULL, the entire stream transfer is attempted at once,
       *  failing or succeeding as a single unit. If the BytesProcessed parameter points to a valid
       *  storage location, the transfer will instead be performed as a series of chunks. Each time
       *  the endpoint bank becomes empty while there is still data to process (and after the current
       *  packet has been acknowledged) the BytesProcessed location will be updated with the total number
       *  of bytes processed in the stream, and the function will exit with an error code of
       *  \ref ENDPOINT_RWSTREAM_IncompleteTransfer. This allows for any abort checking to be performed
       *  in the user code - to continue the transfer, call the function again with identical parameters
       *  and it will resume until the BytesProcessed value reaches the total transfer length.
       *
       *  <b>Single Stream Transfer Example:</b>
       *  \code
       *  uint8_t DataStream[512];
       *  uint8_t ErrorCode;
       *  
       *  if ((ErrorCode = Endpoint_Read_Stream_LE(DataStream, sizeof(DataStream),
       *                                           NULL)) != ENDPOINT_RWSTREAM_NoError)
       *  {
       *       // Stream failed to complete - check ErrorCode here
       *  }
       *  \endcode
       *
       *  <b>Partial Stream Transfers Example:</b>
       *  \code
       *  uint8_t  DataStream[512];
       *  uint8_t  ErrorCode;
       *  uint16_t BytesProcessed;
       *  
       *  BytesProcessed = 0;
       *  while ((ErrorCode = Endpoint_Read_Stream_LE(DataStream, sizeof(DataStream),
       *                                              &BytesProcessed)) == ENDPOINT_RWSTREAM_IncompleteTransfer)
       *  {
       *      // Stream not yet complete - do other actions here, abort if required
       *  }
       *  
       *  if (ErrorCode != ENDPOINT_RWSTREAM_NoError)
       *  {
       *      // Stream failed to complete - check ErrorCode here
       *  }
       *  \endcode
       *
       *  \note This routine should not be used on CONTROL type endpoints.
       *
       *  \param[out] Buffer          Pointer to the destination data buffer to write to.
       *  \param[in]  Length          Number of bytes to send via the currently selected endpoint.
       *  \param[in]  BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                              transaction should be updated, \c NULL if the entire stream should be read at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Read_Stream_LE(void* const Buffer,
                                      uint16_t Length,
                                      uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** Reads the given number of bytes from the endpoint from the given buffer in big endian,
       *  discarding fully read packets from the host as needed. The last packet is not automatically
       *  discarded once the remaining bytes has been read; the user is responsible for manually
       *  discarding the last packet from the host via the \ref Endpoint_ClearOUT() macro.
       *
       *  \note This routine should not be used on CONTROL type endpoints.
       *
       *  \param[out] Buffer          Pointer to the destination data buffer to write to.
       *  \param[in]  Length          Number of bytes to send via the currently selected endpoint.
       *  \param[in]  BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                              transaction should be updated, \c NULL if the entire stream should be read at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Read_Stream_BE(void* const Buffer,
                                      uint16_t Length,
                                      uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** Writes the given number of bytes to the CONTROL type endpoint from the given buffer in little endian,
       *  sending full packets to the host as needed. The host OUT acknowledgement is not automatically cleared
       *  in both failure and success states; the user is responsible for manually clearing the status OUT packet
       *  to finalize the transfer's status stage via the \ref Endpoint_ClearOUT() macro.
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[in] Buffer  Pointer to the source data buffer to read from.
       *  \param[in] Length  Number of bytes to read for the currently selected endpoint into the buffer.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_Control_Stream_LE(const void* const Buffer,
                                               uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);

      /** Writes the given number of bytes to the CONTROL type endpoint from the given buffer in big endian,
       *  sending full packets to the host as needed. The host OUT acknowledgement is not automatically cleared
       *  in both failure and success states; the user is responsible for manually clearing the status OUT packet
       *  to finalize the transfer's status stage via the \ref Endpoint_ClearOUT() macro.
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[in] Buffer  Pointer to the source data buffer to read from.
       *  \param[in] Length  Number of bytes to read for the currently selected endpoint into the buffer.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_Control_Stream_BE(const void* const Buffer,
                                               uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);

      /** Reads the given number of bytes from the CONTROL endpoint from the given buffer in little endian,
       *  discarding fully read packets from the host as needed. The device IN acknowledgement is not
       *  automatically sent after success or failure states; the user is responsible for manually sending the
       *  status IN packet to finalize the transfer's status stage via the \ref Endpoint_ClearIN() macro.
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[out] Buffer  Pointer to the destination data buffer to write to.
       *  \param[in]  Length  Number of bytes to send via the currently selected endpoint.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Read_Control_Stream_LE(void* const Buffer,
                                              uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);

      /** Reads the given number of bytes from the CONTROL endpoint from the given buffer in big endian,
       *  discarding fully read packets from the host as needed. The device IN acknowledgement is not
       *  automatically sent after success or failure states; the user is responsible for manually sending the
       *  status IN packet to finalize the transfer's status stage via the \ref Endpoint_ClearIN() macro.
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[out] Buffer  Pointer to the destination data buffer to write to.
       *  \param[in]  Length  Number of bytes to send via the currently selected endpoint.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Read_Control_Stream_BE(void* const Buffer,
                                              uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);
      //@}

      /** \name Stream functions for EEPROM source/destination data */
      //@{

      /** EEPROM buffer source version of \ref Endpoint_Write_Stream_LE().
       *
       *  \param[in] Buffer          Pointer to the source data buffer to read from.
       *  \param[in] Length          Number of bytes to read for the currently selected endpoint into the buffer.
       *  \param[in] BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                             transaction should be updated, \c NULL if the entire stream should be written at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_EStream_LE(const void* const Buffer,
                                        uint16_t Length,
                                        uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** EEPROM buffer source version of \ref Endpoint_Write_Stream_BE().
       *
       *  \param[in] Buffer          Pointer to the source data buffer to read from.
       *  \param[in] Length          Number of bytes to read for the currently selected endpoint into the buffer.
       *  \param[in] BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                             transaction should be updated, \c NULL if the entire stream should be written at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_EStream_BE(const void* const Buffer,
                                        uint16_t Length,
                                        uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** EEPROM buffer destination version of \ref Endpoint_Read_Stream_LE().
       *
       *  \param[out] Buffer          Pointer to the destination data buffer to write to, located in EEPROM memory space.
       *  \param[in]  Length          Number of bytes to send via the currently selected endpoint.
       *  \param[in]  BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                              transaction should be updated, \c NULL if the entire stream should be read at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Read_EStream_LE(void* const Buffer,
                                       uint16_t Length,
                                       uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** EEPROM buffer destination version of \ref Endpoint_Read_Stream_BE().
       *
       *  \param[out] Buffer          Pointer to the destination data buffer to write to, located in EEPROM memory space.
       *  \param[in]  Length          Number of bytes to send via the currently selected endpoint.
       *  \param[in]  BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                              transaction should be updated, \c NULL if the entire stream should be read at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Read_EStream_BE(void* const Buffer,
                                       uint16_t Length,
                                       uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** EEPROM buffer source version of Endpoint_Write_Control_Stream_LE.
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *        \n\n
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[in] Buffer  Pointer to the source data buffer to read from.
       *  \param[in] Length  Number of bytes to read for the currently selected endpoint into the buffer.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_Control_EStream_LE(const void* const Buffer,
                                                uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);

      /** EEPROM buffer source version of \ref Endpoint_Write_Control_Stream_BE().
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *        \n\n
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[in] Buffer  Pointer to the source data buffer to read from.
       *  \param[in] Length  Number of bytes to read for the currently selected endpoint into the buffer.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_Control_EStream_BE(const void* const Buffer,
                                                uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);

      /** EEPROM buffer source version of \ref Endpoint_Read_Control_Stream_LE().
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *        \n\n
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[out] Buffer  Pointer to the destination data buffer to write to.
       *  \param[in]  Length  Number of bytes to send via the currently selected endpoint.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Read_Control_EStream_LE(void* const Buffer,
                                               uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);

      /** EEPROM buffer source version of \ref Endpoint_Read_Control_Stream_BE().
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *        \n\n
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[out] Buffer  Pointer to the destination data buffer to write to.
       *  \param[in]  Length  Number of bytes to send via the currently selected endpoint.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Read_Control_EStream_BE(void* const Buffer,
                                               uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);
      //@}

      /** \name Stream functions for PROGMEM source/destination data */
      //@{

      /** FLASH buffer source version of \ref Endpoint_Write_Stream_LE().
       *
       *  \pre The FLASH data must be located in the first 64KB of FLASH for this function to work correctly.
       *
       *  \param[in] Buffer          Pointer to the source data buffer to read from.
       *  \param[in] Length          Number of bytes to read for the currently selected endpoint into the buffer.
       *  \param[in] BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                             transaction should be updated, \c NULL if the entire stream should be written at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_PStream_LE(const void* const Buffer,
                                        uint16_t Length,
                                        uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** FLASH buffer source version of \ref Endpoint_Write_Stream_BE().
       *
       *  \pre The FLASH data must be located in the first 64KB of FLASH for this function to work correctly.
       *
       *  \param[in] Buffer          Pointer to the source data buffer to read from.
       *  \param[in] Length          Number of bytes to read for the currently selected endpoint into the buffer.
       *  \param[in] BytesProcessed  Pointer to a location where the total number of bytes processed in the current
       *                             transaction should be updated, \c NULL if the entire stream should be written at once.
       *
       *  \return A value from the \ref Endpoint_Stream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_PStream_BE(const void* const Buffer,
                                        uint16_t Length,
                                        uint16_t* const BytesProcessed) ATTR_NON_NULL_PTR_ARG(1);

      /** FLASH buffer source version of \ref Endpoint_Write_Control_Stream_LE().
       *
       *  \pre The FLASH data must be located in the first 64KB of FLASH for this function to work correctly.
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *        \n\n
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[in] Buffer  Pointer to the source data buffer to read from.
       *  \param[in] Length  Number of bytes to read for the currently selected endpoint into the buffer.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_Control_PStream_LE(const void* const Buffer,
                                                uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);

      /** FLASH buffer source version of \ref Endpoint_Write_Control_Stream_BE().
       *
       *  \pre The FLASH data must be located in the first 64KB of FLASH for this function to work correctly.
       *
       *  \note This function automatically sends the last packet in the data stage of the transaction; when the
       *        function returns, the user is responsible for clearing the <b>status</b> stage of the transaction.
       *        Note that the status stage packet is sent or received in the opposite direction of the data flow.
       *        \n\n
       *
       *  \note This routine should only be used on CONTROL type endpoints.
       *        \n\n
       *
       *  \warning Unlike the standard stream read/write commands, the control stream commands cannot be chained
       *           together; i.e. the entire stream data must be read or written at the one time.
       *
       *  \param[in] Buffer  Pointer to the source data buffer to read from.
       *  \param[in] Length  Number of bytes to read for the currently selected endpoint into the buffer.
       *
       *  \return A value from the \ref Endpoint_ControlStream_RW_ErrorCodes_t enum.
       */
      uint8_t Endpoint_Write_Control_PStream_BE(const void* const Buffer,
                                                uint16_t Length) ATTR_NON_NULL_PTR_ARG(1);


      /* Private Interface - For use in library only: */
      #if !defined(__DOXYGEN__)

        /* Inline Functions: */
          static inline uint8_t Endpoint_BytesToEPSizeMask(const uint16_t Bytes) ATTR_WARN_UNUSED_RESULT ATTR_CONST
                                                                                 ATTR_ALWAYS_INLINE;
          static inline uint8_t Endpoint_BytesToEPSizeMask(const uint16_t Bytes)
          {
            uint8_t  MaskVal    = 0;
            uint16_t CheckBytes = 8;

            while (CheckBytes < Bytes)
            {
              MaskVal++;
              CheckBytes <<= 1;
            }

            return (MaskVal << USB_EP_BUFSIZE_gp);
          }

      #endif


      /** Determines if the currently selected endpoint is enabled, but not necessarily configured.
       *
       * \return Boolean \c true if the currently selected endpoint is enabled, \c false otherwise.
       */
      static inline bool Endpoint_IsEnabled(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline bool Endpoint_IsEnabled(void)
      {
        return true;
      }

      /** Resets the endpoint bank FIFO. This clears all the endpoint banks and resets the USB controller's
       *  data In and Out pointers to the bank's contents.
       *
       *  \param[in] Address  Endpoint address whose FIFO buffers are to be reset.
       */
      static inline void Endpoint_ResetEndpoint(const uint8_t Address) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_ResetEndpoint(const uint8_t Address)
      {
        if (Address & ENDPOINT_DIR_IN)
          USB_Endpoint_FIFOs[Address & ENDPOINT_EPNUM_MASK].IN.Position  = 0;
        else
          USB_Endpoint_FIFOs[Address & ENDPOINT_EPNUM_MASK].OUT.Position = 0;
      }

      /** Resets the data toggle of the currently selected endpoint. */
      static inline void Endpoint_ResetDataToggle(void) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_ResetDataToggle(void)
      {
        USB_Endpoint_SelectedHandle->STATUS &= ~USB_EP_TOGGLE_bm;
      }

      /** Determines if the currently selected endpoint may be read from (if data is waiting in the endpoint
       *  bank and the endpoint is an OUT direction, or if the bank is not yet full if the endpoint is an IN
       *  direction). This function will return false if an error has occurred in the endpoint, if the endpoint
       *  is an OUT direction and no packet (or an empty packet) has been received, or if the endpoint is an IN
       *  direction and the endpoint bank is full.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       *
       *  \return Boolean \c true if the currently selected endpoint may be read from or written to, depending
       *          on its direction.
       */
      static inline bool Endpoint_IsReadWriteAllowed(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline bool Endpoint_IsReadWriteAllowed(void)
      {
        return (USB_Endpoint_SelectedFIFO->Position < USB_Endpoint_SelectedFIFO->Length);
      }

      /** Clears the STALL condition on the currently selected endpoint.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       */
      static inline void Endpoint_ClearStall(void) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_ClearStall(void)
      {
        USB_Endpoint_SelectedHandle->CTRL &= ~USB_EP_STALL_bm;
      }

      /** Determines if the currently selected endpoint is stalled, \c false otherwise.
       *
       *  \ingroup Group_EndpointPacketManagement_XMEGA
       *
       *  \return Boolean \c true if the currently selected endpoint is stalled, \c false otherwise.
       */
      static inline bool Endpoint_IsStalled(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline bool Endpoint_IsStalled(void)
      {
        return ((USB_Endpoint_SelectedHandle->CTRL & USB_EP_STALL_bm) ? true : false);
      }

      /** Writes two bytes to the currently selected endpoint's bank in little endian format, for IN
       *  direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       *
       *  \param[in] Data  Data to write to the currently selected endpoint's FIFO buffer.
       */
      static inline void Endpoint_Write_16_LE(const uint16_t Data) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_Write_16_LE(const uint16_t Data)
      {
        Endpoint_Write_8(Data & 0xFF);
        Endpoint_Write_8(Data >> 8);
      }

      /** Discards one byte from the currently selected endpoint's bank, for OUT direction endpoints.
       *
       *  \ingroup Group_EndpointPrimitiveRW_XMEGA
       */
      static inline void Endpoint_Discard_8(void) ATTR_ALWAYS_INLINE;
      static inline void Endpoint_Discard_8(void)
      {
        USB_Endpoint_SelectedFIFO->Position++;
      }

      /** Indicates the number of bytes currently stored in the current endpoint's selected bank.
       *
       *  \ingroup Group_EndpointRW_XMEGA
       *
       *  \return Total number of bytes in the currently selected Endpoint's FIFO buffer.
       */
      static inline uint16_t Endpoint_BytesInEndpoint(void) ATTR_WARN_UNUSED_RESULT ATTR_ALWAYS_INLINE;
      static inline uint16_t Endpoint_BytesInEndpoint(void)
      {
        if (USB_Endpoint_SelectedEndpoint & ENDPOINT_DIR_IN)
          return USB_Endpoint_SelectedFIFO->Position;
        else
          return (USB_Endpoint_SelectedFIFO->Length - USB_Endpoint_SelectedFIFO->Position);
      }

      /** Configures the specified endpoint address with the given endpoint type, bank size and number of hardware
       *  banks. Once configured, the endpoint may be read from or written to, depending on its direction.
       *
       *  \param[in] Address    Endpoint address to configure.
       *
       *  \param[in] Type       Type of endpoint to configure, a \c EP_TYPE_* mask. Not all endpoint types
       *                        are available on Low Speed USB devices - refer to the USB 2.0 specification.
       *
       *  \param[in] Size       Size of the endpoint's bank, where packets are stored before they are transmitted
       *                        to the USB host, or after they have been received from the USB host (depending on
       *                        the endpoint's data direction). The bank size must indicate the maximum packet size
       *                        that the endpoint can handle.
       *
       *  \param[in] Banks      Number of hardware banks to use for the endpoint being configured.
       *
       *  \note The default control endpoint should not be manually configured by the user application, as
       *        it is automatically configured by the library internally.
       *        \n\n
       *
       *  \note This routine will automatically select the specified endpoint.
       *
       *  \return Boolean \c true if the configuration succeeded, \c false otherwise.
       */
      static inline bool Endpoint_ConfigureEndpoint(const uint8_t Address,
                                                    const uint8_t Type,
                                                    const uint16_t Size,
                                                    const uint8_t Banks) ATTR_ALWAYS_INLINE;
      static inline bool Endpoint_ConfigureEndpoint(const uint8_t Address,
                                                    const uint8_t Type,
                                                    const uint16_t Size,
                                                    const uint8_t Banks)
      {
        uint8_t EPConfigMask = (USB_EP_INTDSBL_bm | ((Banks > 1) ? USB_EP_PINGPONG_bm : 0) | Endpoint_BytesToEPSizeMask(Size));

        if ((Address & ENDPOINT_EPNUM_MASK) >= ENDPOINT_TOTAL_ENDPOINTS)
          return false;

        // TODO - Fix once limitations are lifted
        EPConfigMask &= ~USB_EP_PINGPONG_bm;
        if (Size > 64)
          return false;

        switch (Type)
        {
          case EP_TYPE_CONTROL:
            EPConfigMask |= USB_EP_TYPE_CONTROL_gc;
            break;
          case EP_TYPE_ISOCHRONOUS:
            EPConfigMask |= USB_EP_TYPE_ISOCHRONOUS_gc;
            break;
          default:
            EPConfigMask |= USB_EP_TYPE_BULK_gc;
            break;
        }

        if (Type == EP_TYPE_CONTROL)
          Endpoint_ConfigureEndpoint_PRV(Address ^ ENDPOINT_DIR_IN, EPConfigMask, Size);

        return Endpoint_ConfigureEndpoint_PRV(Address, EPConfigMask, Size);
      }

  }+


  +{ #endif /* __USB_EndpointDefines_P__ */ }+

}