
import CommonDefines
import HIDReportData
import HIDClassCommon

module HIDParser {
  
  +{
      #ifndef __HIDParser_P__
      #define __HIDParser_P__

      ////////////////////////////////////////
      // HIDParser.h
      ////////////////////////////////////////

      /* Macros: */
        #if !defined(HID_STATETABLE_STACK_DEPTH) || defined(__DOXYGEN__)
          /** Constant indicating the maximum stack depth of the state table. A larger state table
           *  allows for more PUSH/POP report items to be nested, but consumes more memory. By default
           *  this is set to 2 levels (allowing non-nested PUSH items) but this can be overridden by
           *  defining \c HID_STATETABLE_STACK_DEPTH to another value in the user project makefile, passing the
           *  define to the compiler using the -D compiler switch.
           */
          #define HID_STATETABLE_STACK_DEPTH    2
        #endif

        #if !defined(HID_USAGE_STACK_DEPTH) || defined(__DOXYGEN__)
          /** Constant indicating the maximum stack depth of the usage table. A larger usage table
           *  allows for more USAGE items to be indicated sequentially for REPORT COUNT entries of more than
           *  one, but requires more stack space. By default this is set to 8 levels (allowing for a report
           *  item with a count of 8) but this can be overridden by defining \c HID_USAGE_STACK_DEPTH to another
           *  value in the user project makefile, passing the define to the compiler using the -D compiler
           *  switch.
           */
          #define HID_USAGE_STACK_DEPTH         8
        #endif

        #if !defined(HID_MAX_COLLECTIONS) || defined(__DOXYGEN__)
          /** Constant indicating the maximum number of COLLECTION items (nested or unnested) that can be
           *  processed in the report item descriptor. A large value allows for more COLLECTION items to be
           *  processed, but consumes more memory. By default this is set to 10 collections, but this can be
           *  overridden by defining \c HID_MAX_COLLECTIONS to another value in the user project makefile, passing
           *  the define to the compiler using the -D compiler switch.
           */
          #define HID_MAX_COLLECTIONS           10
        #endif

        #if !defined(HID_MAX_REPORTITEMS) || defined(__DOXYGEN__)
          /** Constant indicating the maximum number of report items (IN, OUT or FEATURE) that can be processed
           *  in the report item descriptor and stored in the user HID Report Info structure. A large value allows
           *  for more report items to be stored, but consumes more memory. By default this is set to 20 items,
           *  but this can be overridden by defining \c HID_MAX_REPORTITEMS to another value in the user project
           *  makefile, and passing the define to the compiler using the -D compiler switch.
           */
          #define HID_MAX_REPORTITEMS           20
        #endif

        #if !defined(HID_MAX_REPORT_IDS) || defined(__DOXYGEN__)
          /** Constant indicating the maximum number of unique report IDs that can be processed in the report item
           *  descriptor for the report size information array in the user HID Report Info structure. A large value
           *  allows for more report ID report sizes to be stored, but consumes more memory. By default this is set
           *  to 10 items, but this can be overridden by defining \c HID_MAX_REPORT_IDS to another value in the user project
           *  makefile, and passing the define to the compiler using the -D compiler switch. Note that IN, OUT and FEATURE
           *  items sharing the same report ID consume only one size item in the array.
           */
          #define HID_MAX_REPORT_IDS            10
        #endif

        /** Returns the value a given HID report item (once its value has been fetched via \ref USB_GetHIDReportItemInfo())
         *  left-aligned to the given data type. This allows for signed data to be interpreted correctly, by shifting the data
         *  leftwards until the data's sign bit is in the correct position.
         *
         *  \param[in] ReportItem  HID Report Item whose retrieved value is to be aligned.
         *  \param[in] Type        Data type to align the HID report item's value to.
         *
         *  \return Left-aligned data of the given report item's pre-retrieved value for the given datatype.
         */
        #define HID_ALIGN_DATA(ReportItem, Type) ((Type)(ReportItem->Value << ((8 * sizeof(Type)) - ReportItem->Attributes.BitSize)))

      /* Public Interface - May be used in end-application: */
      /* Enums: */
        /** Enum for the possible error codes in the return value of the \ref USB_ProcessHIDReport() function. */
        enum HID_Parse_ErrorCodes_t
        {
          HID_PARSE_Successful                  = 0, /**< Successful parse of the HID report descriptor, no error. */
          HID_PARSE_HIDStackOverflow            = 1, /**< More than \ref HID_STATETABLE_STACK_DEPTH nested PUSHes in the report. */
          HID_PARSE_HIDStackUnderflow           = 2, /**< A POP was found when the state table stack was empty. */
          HID_PARSE_InsufficientReportItems     = 3, /**< More than \ref HID_MAX_REPORTITEMS report items in the report. */
          HID_PARSE_UnexpectedEndCollection     = 4, /**< An END COLLECTION item found without matching COLLECTION item. */
          HID_PARSE_InsufficientCollectionPaths = 5, /**< More than \ref HID_MAX_COLLECTIONS collections in the report. */
          HID_PARSE_UsageListOverflow           = 6, /**< More than \ref HID_USAGE_STACK_DEPTH usages listed in a row. */
          HID_PARSE_InsufficientReportIDItems   = 7, /**< More than \ref HID_MAX_REPORT_IDS report IDs in the device. */
          HID_PARSE_NoUnfilteredReportItems     = 8, /**< All report items from the device were filtered by the filtering callback routine. */
        };

        /* Type Defines: */
        /** \brief HID Parser Report Item Min/Max Structure.
         *
         *  Type define for an attribute with both minimum and maximum values (e.g. Logical Min/Max).
         */
        typedef struct
        {
          uint32_t Minimum; /**< Minimum value for the attribute. */
          uint32_t Maximum; /**< Maximum value for the attribute. */
        } HID_MinMax_t;

        /** \brief HID Parser Report Item Unit Structure.
         *
         *  Type define for the Unit attributes of a report item.
         */
        typedef struct
        {
          uint32_t Type;     /**< Unit type (refer to HID specifications for details). */
          uint8_t  Exponent; /**< Unit exponent (refer to HID specifications for details). */
        } HID_Unit_t;

        /** \brief HID Parser Report Item Usage Structure.
         *
         *  Type define for the Usage attributes of a report item.
         */
        typedef struct
        {
          uint16_t Page;  /**< Usage page of the report item. */
          uint16_t Usage; /**< Usage of the report item. */
        } HID_Usage_t;

        /** \brief HID Parser Report Item Collection Path Structure.
         *
         *  Type define for a COLLECTION object. Contains the collection attributes and a reference to the
         *  parent collection if any.
         */
        typedef struct HID_CollectionPath
        {
          uint8_t                    Type;   /**< Collection type (e.g. "Generic Desktop"). */
          HID_Usage_t                Usage;  /**< Collection usage. */
          struct HID_CollectionPath* Parent; /**< Reference to parent collection, or \c NULL if root collection. */
        } HID_CollectionPath_t;

        /** \brief HID Parser Report Item Attributes Structure.
         *
         *  Type define for all the data attributes of a report item, except flags.
         */
        typedef struct
        {
          uint8_t      BitSize;  /**< Size in bits of the report item's data. */

          HID_Usage_t  Usage;    /**< Usage of the report item. */
          HID_Unit_t   Unit;     /**< Unit type and exponent of the report item. */
          HID_MinMax_t Logical;  /**< Logical minimum and maximum of the report item. */
          HID_MinMax_t Physical; /**< Physical minimum and maximum of the report item. */
        } HID_ReportItem_Attributes_t;

        /** \brief HID Parser Report Item Details Structure.
         *
         *  Type define for a report item (IN, OUT or FEATURE) layout attributes and other details.
         */
        typedef struct
        {
          uint16_t                    BitOffset;      /**< Bit offset in the IN, OUT or FEATURE report of the item. */
          uint8_t                     ItemType;       /**< Report item type, a value in \ref HID_ReportItemTypes_t. */
          uint16_t                    ItemFlags;      /**< Item data flags, a mask of \c HID_IOF_* constants. */
          uint8_t                     ReportID;       /**< Report ID this item belongs to, or 0x00 if device has only one report */
          HID_CollectionPath_t*       CollectionPath; /**< Collection path of the item. */

          HID_ReportItem_Attributes_t Attributes;     /**< Report item attributes. */

          uint32_t                    Value;          /**< Current value of the report item - use \ref HID_ALIGN_DATA() when processing
                                                       *   a retrieved value so that it is aligned to a specific type.
                                                       */
          uint32_t                    PreviousValue;  /**< Previous value of the report item. */
        } HID_ReportItem_t;

        /** \brief HID Parser Report Size Structure.
         *
         *  Type define for a report item size information structure, to retain the size of a device's reports by ID.
         */
        typedef struct
        {
          uint8_t  ReportID; /**< Report ID of the report within the HID interface. */
          uint16_t ReportSizeBits[3]; /**< Total number of bits in each report type for the given Report ID,
                                       *   indexed by the \ref HID_ReportItemTypes_t enum.
                                       */
        } HID_ReportSizeInfo_t;

        /** \brief HID Parser State Structure.
         *
         *  Type define for a complete processed HID report, including all report item data and collections.
         */
        typedef struct
        {
          uint8_t              TotalReportItems; /**< Total number of report items stored in the \c ReportItems array. */
          HID_ReportItem_t     ReportItems[HID_MAX_REPORTITEMS]; /**< Report items array, including all IN, OUT
                                                                    *   and FEATURE items.
                                                                  */
          HID_CollectionPath_t CollectionPaths[HID_MAX_COLLECTIONS]; /**< All collection items, referenced
                                                                      *   by the report items.
                                                                      */
          uint8_t              TotalDeviceReports; /**< Number of reports within the HID interface */
          HID_ReportSizeInfo_t ReportIDSizes[HID_MAX_REPORT_IDS]; /**< Report sizes for each report in the interface */
          uint16_t             LargestReportSizeBits; /**< Largest report that the attached device will generate, in bits */
          bool                 UsingReportIDs; /**< Indicates if the device has at least one REPORT ID
                                                *   element in its HID report descriptor.
                                                */
        } HID_ReportInfo_t;

      /* Function Prototypes: */
        /** Function to process a given HID report returned from an attached device, and store it into a given
         *  \ref HID_ReportInfo_t structure.
         *
         *  \param[in]  ReportData  Buffer containing the device's HID report table.
         *  \param[in]  ReportSize  Size in bytes of the HID report table.
         *  \param[out] ParserData  Pointer to a \ref HID_ReportInfo_t instance for the parser output.
         *
         *  \return A value in the \ref HID_Parse_ErrorCodes_t enum.
         */
        uint8_t USB_ProcessHIDReport(const uint8_t* ReportData,
                                     uint16_t ReportSize,
                                     HID_ReportInfo_t* const ParserData) ATTR_NON_NULL_PTR_ARG(1) ATTR_NON_NULL_PTR_ARG(3);

        /** Extracts the given report item's value out of the given HID report and places it into the Value
         *  member of the report item's \ref HID_ReportItem_t structure.
         *
         *  When called on a report with an item that exists in that report, this copies the report item's \c Value
         *  to its \c PreviousValue element for easy checking to see if an item's value has changed before processing
         *  a report. If the given item does not exist in the report, the function does not modify the report item's
         *  data.
         *
         *  \param[in]     ReportData  Buffer containing an IN or FEATURE report from an attached device.
         *  \param[in,out] ReportItem  Pointer to the report item of interest in a \ref HID_ReportInfo_t ReportItem array.
         *
         *  \returns Boolean \c true if the item to retrieve was located in the given report, \c false otherwise.
         */
        bool USB_GetHIDReportItemInfo(const uint8_t* ReportData,
                                      HID_ReportItem_t* const ReportItem) ATTR_NON_NULL_PTR_ARG(1);

        /** Retrieves the given report item's value out of the \c Value member of the report item's
         *  \ref HID_ReportItem_t structure and places it into the correct position in the HID report
         *  buffer. The report buffer is assumed to have the appropriate bits cleared before calling
         *  this function (i.e., the buffer should be explicitly cleared before report values are added).
         *
         *  When called, this copies the report item's \c Value element to its \c PreviousValue element for easy
         *  checking to see if an item's value has changed before sending a report.
         *
         *  If the device has multiple HID reports, the first byte in the report is set to the report ID of the given item.
         *
         *  \param[out] ReportData  Buffer holding the current OUT or FEATURE report data.
         *  \param[in]  ReportItem  Pointer to the report item of interest in a \ref HID_ReportInfo_t ReportItem array.
         */
        void USB_SetHIDReportItemInfo(uint8_t* ReportData,
                                      HID_ReportItem_t* const ReportItem) ATTR_NON_NULL_PTR_ARG(1);

        /** Retrieves the size of a given HID report in bytes from its Report ID.
         *
         *  \param[in] ParserData  Pointer to a \ref HID_ReportInfo_t instance containing the parser output.
         *  \param[in] ReportID    Report ID of the report whose size is to be determined.
         *  \param[in] ReportType  Type of the report whose size is to be determined, a value from the
         *                         \ref HID_ReportItemTypes_t enum.
         *
         *  \return Size of the report in bytes, or \c 0 if the report does not exist.
         */
        uint16_t USB_GetHIDReportSize(HID_ReportInfo_t* const ParserData,
                                      const uint8_t ReportID,
                                      const uint8_t ReportType) ATTR_CONST ATTR_NON_NULL_PTR_ARG(1);

        /** Callback routine for the HID Report Parser. This callback <b>must</b> be implemented by the user code when
         *  the parser is used, to determine what report IN, OUT and FEATURE item's information is stored into the user
         *  \ref HID_ReportInfo_t structure. This can be used to filter only those items the application will be using, so that
         *  no RAM is wasted storing the attributes for report items which will never be referenced by the application.
         *
         *  Report item pointers passed to this callback function may be cached by the user application for later use
         *  when processing report items. This provides faster report processing in the user application than would
         *  a search of the entire parsed report item table for each received or sent report.
         *
         *  \param[in] CurrentItem  Pointer to the current report item for user checking.
         *
         *  \return Boolean \c true if the item should be stored into the \ref HID_ReportInfo_t structure, \c false if
         *          it should be ignored.
         */
        bool CALLBACK_HIDParser_FilterHIDReportItem(HID_ReportItem_t* const CurrentItem);

        /* Private Interface - For use in library only: */
        #if !defined(__DOXYGEN__)
          /* Type Defines: */
            typedef struct
            {
               HID_ReportItem_Attributes_t Attributes;
               uint8_t                     ReportCount;
               uint8_t                     ReportID;
            } HID_StateTable_t;
        #endif


        ////////////////////////////////////////
        // HIDParser.c
        ////////////////////////////////////////

        uint8_t USB_ProcessHIDReport(const uint8_t* ReportData,
                                     uint16_t ReportSize,
                                     HID_ReportInfo_t* const ParserData)
        {
          HID_StateTable_t      StateTable[HID_STATETABLE_STACK_DEPTH];
          HID_StateTable_t*     CurrStateTable     = &StateTable[0];
          HID_CollectionPath_t* CurrCollectionPath = NULL;
          HID_ReportSizeInfo_t* CurrReportIDInfo   = &ParserData->ReportIDSizes[0];
          uint16_t              UsageList[HID_USAGE_STACK_DEPTH];
          uint8_t               UsageListSize      = 0;
          HID_MinMax_t          UsageMinMax        = {0, 0};

          memset(ParserData,       0x00, sizeof(HID_ReportInfo_t));
          memset(CurrStateTable,   0x00, sizeof(HID_StateTable_t));
          memset(CurrReportIDInfo, 0x00, sizeof(HID_ReportSizeInfo_t));

          ParserData->TotalDeviceReports = 1;

          while (ReportSize)
          {
            uint8_t  HIDReportItem  = *ReportData;
            uint32_t ReportItemData;

            ReportData++;
            ReportSize--;

            switch (HIDReportItem & HID_RI_DATA_SIZE_MASK)
            {
              case HID_RI_DATA_BITS_32:
                ReportItemData  = (((uint32_t)ReportData[3] << 24) | ((uint32_t)ReportData[2] << 16) |
                                     ((uint16_t)ReportData[1] << 8)  | ReportData[0]);
                ReportSize     -= 4;
                ReportData     += 4;
                break;

              case HID_RI_DATA_BITS_16:
                ReportItemData  = (((uint16_t)ReportData[1] << 8) | (ReportData[0]));
                ReportSize     -= 2;
                ReportData     += 2;
                break;

              case HID_RI_DATA_BITS_8:
                ReportItemData  = ReportData[0];
                ReportSize     -= 1;
                ReportData     += 1;
                break;

              default:
                ReportItemData  = 0;
                break;
            }

            switch (HIDReportItem & (HID_RI_TYPE_MASK | HID_RI_TAG_MASK))
            {
              case HID_RI_PUSH(0):
                if (CurrStateTable == &StateTable[HID_STATETABLE_STACK_DEPTH - 1])
                  return HID_PARSE_HIDStackOverflow;

                memcpy((CurrStateTable + 1),
                       CurrStateTable,
                       sizeof(HID_ReportItem_t));

                CurrStateTable++;
                break;

              case HID_RI_POP(0):
                if (CurrStateTable == &StateTable[0])
                  return HID_PARSE_HIDStackUnderflow;

                CurrStateTable--;
                break;

              case HID_RI_USAGE_PAGE(0):
                if ((HIDReportItem & HID_RI_DATA_SIZE_MASK) == HID_RI_DATA_BITS_32)
                  CurrStateTable->Attributes.Usage.Page = (ReportItemData >> 16);

                CurrStateTable->Attributes.Usage.Page       = ReportItemData;
                break;

              case HID_RI_LOGICAL_MINIMUM(0):
                CurrStateTable->Attributes.Logical.Minimum  = ReportItemData;
                break;

              case HID_RI_LOGICAL_MAXIMUM(0):
                CurrStateTable->Attributes.Logical.Maximum  = ReportItemData;
                break;

              case HID_RI_PHYSICAL_MINIMUM(0):
                CurrStateTable->Attributes.Physical.Minimum = ReportItemData;
                break;

              case HID_RI_PHYSICAL_MAXIMUM(0):
                CurrStateTable->Attributes.Physical.Maximum = ReportItemData;
                break;

              case HID_RI_UNIT_EXPONENT(0):
                CurrStateTable->Attributes.Unit.Exponent    = ReportItemData;
                break;

              case HID_RI_UNIT(0):
                CurrStateTable->Attributes.Unit.Type        = ReportItemData;
                break;

              case HID_RI_REPORT_SIZE(0):
                CurrStateTable->Attributes.BitSize          = ReportItemData;
                break;

              case HID_RI_REPORT_COUNT(0):
                CurrStateTable->ReportCount                 = ReportItemData;
                break;

              case HID_RI_REPORT_ID(0):
                CurrStateTable->ReportID                    = ReportItemData;

                if (ParserData->UsingReportIDs)
                {
                  CurrReportIDInfo = NULL;

                  for (uint8_t i = 0; i < ParserData->TotalDeviceReports; i++)
                  {
                    if (ParserData->ReportIDSizes[i].ReportID == CurrStateTable->ReportID)
                    {
                      CurrReportIDInfo = &ParserData->ReportIDSizes[i];
                      break;
                    }
                  }

                  if (CurrReportIDInfo == NULL)
                  {
                    if (ParserData->TotalDeviceReports == HID_MAX_REPORT_IDS)
                      return HID_PARSE_InsufficientReportIDItems;

                    CurrReportIDInfo = &ParserData->ReportIDSizes[ParserData->TotalDeviceReports++];
                    memset(CurrReportIDInfo, 0x00, sizeof(HID_ReportSizeInfo_t));
                  }
                }

                ParserData->UsingReportIDs = true;

                CurrReportIDInfo->ReportID = CurrStateTable->ReportID;
                break;

              case HID_RI_USAGE(0):
                if (UsageListSize == HID_USAGE_STACK_DEPTH)
                  return HID_PARSE_UsageListOverflow;

                UsageList[UsageListSize++] = ReportItemData;
                break;

              case HID_RI_USAGE_MINIMUM(0):
                UsageMinMax.Minimum = ReportItemData;
                break;

              case HID_RI_USAGE_MAXIMUM(0):
                UsageMinMax.Maximum = ReportItemData;
                break;

              case HID_RI_COLLECTION(0):
                if (CurrCollectionPath == NULL)
                {
                  CurrCollectionPath = &ParserData->CollectionPaths[0];
                }
                else
                {
                  HID_CollectionPath_t* ParentCollectionPath = CurrCollectionPath;

                  CurrCollectionPath = &ParserData->CollectionPaths[1];

                  while (CurrCollectionPath->Parent != NULL)
                  {
                    if (CurrCollectionPath == &ParserData->CollectionPaths[HID_MAX_COLLECTIONS - 1])
                      return HID_PARSE_InsufficientCollectionPaths;

                    CurrCollectionPath++;
                  }

                  CurrCollectionPath->Parent = ParentCollectionPath;
                }

                CurrCollectionPath->Type       = ReportItemData;
                CurrCollectionPath->Usage.Page = CurrStateTable->Attributes.Usage.Page;

                if (UsageListSize)
                {
                  CurrCollectionPath->Usage.Usage = UsageList[0];

                  for (uint8_t i = 1; i < UsageListSize; i++)
                    UsageList[i - 1] = UsageList[i];

                  UsageListSize--;
                }
                else if (UsageMinMax.Minimum <= UsageMinMax.Maximum)
                {
                  CurrCollectionPath->Usage.Usage = UsageMinMax.Minimum++;
                }

                break;

              case HID_RI_END_COLLECTION(0):
                if (CurrCollectionPath == NULL)
                  return HID_PARSE_UnexpectedEndCollection;

                CurrCollectionPath = CurrCollectionPath->Parent;
                break;

              case HID_RI_INPUT(0):
              case HID_RI_OUTPUT(0):
              case HID_RI_FEATURE(0):
                for (uint8_t ReportItemNum = 0; ReportItemNum < CurrStateTable->ReportCount; ReportItemNum++)
                {
                  HID_ReportItem_t NewReportItem;

                  memcpy(&NewReportItem.Attributes,
                         &CurrStateTable->Attributes,
                         sizeof(HID_ReportItem_Attributes_t));

                  NewReportItem.ItemFlags      = ReportItemData;
                  NewReportItem.CollectionPath = CurrCollectionPath;
                  NewReportItem.ReportID       = CurrStateTable->ReportID;

                  if (UsageListSize)
                  {
                    NewReportItem.Attributes.Usage.Usage = UsageList[0];

                    for (uint8_t i = 1; i < UsageListSize; i++)
                      UsageList[i - 1] = UsageList[i];

                    UsageListSize--;
                  }
                  else if (UsageMinMax.Minimum <= UsageMinMax.Maximum)
                  {
                    NewReportItem.Attributes.Usage.Usage = UsageMinMax.Minimum++;
                  }

                  uint8_t ItemTypeTag = (HIDReportItem & (HID_RI_TYPE_MASK | HID_RI_TAG_MASK));

                  if (ItemTypeTag == HID_RI_INPUT(0))
                    NewReportItem.ItemType = HID_REPORT_ITEM_In;
                  else if (ItemTypeTag == HID_RI_OUTPUT(0))
                    NewReportItem.ItemType = HID_REPORT_ITEM_Out;
                  else
                    NewReportItem.ItemType = HID_REPORT_ITEM_Feature;

                  NewReportItem.BitOffset = CurrReportIDInfo->ReportSizeBits[NewReportItem.ItemType];

                  CurrReportIDInfo->ReportSizeBits[NewReportItem.ItemType] += CurrStateTable->Attributes.BitSize;

                  ParserData->LargestReportSizeBits = MAX(ParserData->LargestReportSizeBits, CurrReportIDInfo->ReportSizeBits[NewReportItem.ItemType]);

                  if (ParserData->TotalReportItems == HID_MAX_REPORTITEMS)
                    return HID_PARSE_InsufficientReportItems;

                  memcpy(&ParserData->ReportItems[ParserData->TotalReportItems],
                         &NewReportItem, sizeof(HID_ReportItem_t));

                  if (!(ReportItemData & HID_IOF_CONSTANT) && CALLBACK_HIDParser_FilterHIDReportItem(&NewReportItem))
                    ParserData->TotalReportItems++;
                }

                break;

              default:
                break;
            }

            if ((HIDReportItem & HID_RI_TYPE_MASK) == HID_RI_TYPE_MAIN)
            {
              UsageMinMax.Minimum = 0;
              UsageMinMax.Maximum = 0;
              UsageListSize       = 0;
            }
          }

          if (!(ParserData->TotalReportItems))
            return HID_PARSE_NoUnfilteredReportItems;

          return HID_PARSE_Successful;
        }

        bool USB_GetHIDReportItemInfo(const uint8_t* ReportData,
                                      HID_ReportItem_t* const ReportItem)
        {
          if (ReportItem == NULL)
            return false;

          uint16_t DataBitsRem  = ReportItem->Attributes.BitSize;
          uint16_t CurrentBit   = ReportItem->BitOffset;
          uint32_t BitMask      = (1 << 0);

          if (ReportItem->ReportID)
          {
            if (ReportItem->ReportID != ReportData[0])
              return false;

            ReportData++;
          }

          ReportItem->PreviousValue = ReportItem->Value;
          ReportItem->Value = 0;

          while (DataBitsRem--)
          {
            if (ReportData[CurrentBit / 8] & (1 << (CurrentBit % 8)))
              ReportItem->Value |= BitMask;

            CurrentBit++;
            BitMask <<= 1;
          }

          return true;
        }

        void USB_SetHIDReportItemInfo(uint8_t* ReportData,
                                      HID_ReportItem_t* const ReportItem)
        {
          if (ReportItem == NULL)
            return;

          uint16_t DataBitsRem  = ReportItem->Attributes.BitSize;
          uint16_t CurrentBit   = ReportItem->BitOffset;
          uint32_t BitMask      = (1 << 0);

          if (ReportItem->ReportID)
          {
            ReportData[0] = ReportItem->ReportID;
            ReportData++;
          }

          ReportItem->PreviousValue = ReportItem->Value;

          while (DataBitsRem--)
          {
            if (ReportItem->Value & (1 << (CurrentBit % 8)))
              ReportData[CurrentBit / 8] |= BitMask;

            CurrentBit++;
            BitMask <<= 1;
          }
        }

        uint16_t USB_GetHIDReportSize(HID_ReportInfo_t* const ParserData,
                                      const uint8_t ReportID,
                                      const uint8_t ReportType)
        {
          for (uint8_t i = 0; i < HID_MAX_REPORT_IDS; i++)
          {
            uint16_t ReportSizeBits = ParserData->ReportIDSizes[i].ReportSizeBits[ReportType];

            if (ParserData->ReportIDSizes[i].ReportID == ReportID)
              return (ReportSizeBits / 8) + ((ReportSizeBits % 8) ? 1 : 0);
          }

          return 0;
        }


      #endif /* __HIDParser_P__ */
  }+

}