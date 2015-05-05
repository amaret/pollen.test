
module CommonDefines {
  
  +{
    #ifndef __CommonDefines_P__
    #define __CommonDefines_P__
  }+

  /////////////////////////////////////
  // Architectures.h
  /////////////////////////////////////

  +{
    /* Public Interface - May be used in end-application: */
      /* Macros: */
        /** Selects the Atmel 8-bit AVR (AT90USB* and ATMEGA*U* chips) architecture. */
        #define ARCH_AVR8           0

        /** Selects the Atmel XMEGA AVR (ATXMEGA* chips) architecture. */
        #define ARCH_XMEGA          2

        #define ARCH_           ARCH_AVR8

        #if !defined(ARCH)
          #define ARCH        ARCH_XMEGA
        #endif
  }+

  /////////////////////////////////////
  // CompilerSpecific.h
  /////////////////////////////////////

  +{
      #if defined(__GNUC__) || defined(__DOXYGEN__)
        /** Forces GCC to use pointer indirection (via the device's pointer register pairs) when accessing the given
         *  struct pointer. In some cases GCC will emit non-optimal assembly code when accessing a structure through
         *  a pointer, resulting in a larger binary. When this macro is used on a (non \c const) structure pointer before
         *  use, it will force GCC to use pointer indirection on the elements rather than direct store and load
         *  instructions.
         *
         *  \param[in, out] StructPtr  Pointer to a structure which is to be forced into indirect access mode.
         */
        #define GCC_FORCE_POINTER_ACCESS(StructPtr)   __asm__ __volatile__("" : "=b" (StructPtr) : "0" (StructPtr))

        /** Forces GCC to create a memory barrier, ensuring that memory accesses are not reordered past the barrier point.
         *  This can be used before ordering-critical operations, to ensure that the compiler does not re-order the resulting
         *  assembly output in an unexpected manner on sections of code that are ordering-specific.
         */
        #define GCC_MEMORY_BARRIER()                  __asm__ __volatile__("" ::: "memory");

        /** Determines if the specified value can be determined at compile-time to be a constant value when compiling under GCC.
         *
         *  \param[in] x  Value to check compile-time constantness of.
         *
         *  \return Boolean \c true if the given value is known to be a compile time constant, \c false otherwise.
         */
        #define GCC_IS_COMPILE_CONST(x)               __builtin_constant_p(x)
      #else
        #error "Compiler not supported. gcc only at this time."
      #endif
  }+

  /////////////////////////////////////
  // Attributes.h
  /////////////////////////////////////

  +{
      #if (__GNUC__ >= 3)
        /** Indicates to the compiler that the function can not ever return, so that any stack restoring or
         *  return code may be omitted by the compiler in the resulting binary.
         */
        #define ATTR_NO_RETURN               __attribute__ ((noreturn))

        /** Indicates that the function returns a value which should not be ignored by the user code. When
         *  applied, any ignored return value from calling the function will produce a compiler warning.
         */
        #define ATTR_WARN_UNUSED_RESULT      __attribute__ ((warn_unused_result))

        /** Indicates that the specified parameters of the function are pointers which should never be \c NULL.
         *  When applied as a 1-based comma separated list the compiler will emit a warning if the specified
         *  parameters are known at compiler time to be \c NULL at the point of calling the function.
         */
        #define ATTR_NON_NULL_PTR_ARG(...)   __attribute__ ((nonnull (__VA_ARGS__)))

        /** Removes any preamble or postamble from the function. When used, the function will not have any
         *  register or stack saving code. This should be used with caution, and when used the programmer
         *  is responsible for maintaining stack and register integrity.
         */
        #define ATTR_NAKED                   __attribute__ ((naked))

        /** Prevents the compiler from considering a specified function for in-lining. When applied, the given
         *  function will not be in-lined under any circumstances.
         */
        #define ATTR_NO_INLINE               __attribute__ ((noinline))

        /** Forces the compiler to never inline the specified function. When applied, the given function will be
         *  always be called explicitly under all circumstances.
         */
        #define ATTR_NEVER_INLINE            __attribute__ ((noinline))

        /** Forces the compiler to inline the specified function. When applied, the given function will be
         *  in-lined under all circumstances.
         */
        #define ATTR_ALWAYS_INLINE           __attribute__ ((always_inline))

        /** Indicates that the specified function is pure, in that it has no side-effects other than global
         *  or parameter variable access.
         */
        #define ATTR_PURE                    __attribute__ ((pure))

        /** Indicates that the specified function is constant, in that it has no side effects other than
         *  parameter access.
         */
        #define ATTR_CONST                   __attribute__ ((const))

        /** Marks a given function as deprecated, which produces a warning if the function is called. */
        #define ATTR_DEPRECATED              __attribute__ ((deprecated))

        /** Marks a function as a weak reference, which can be overridden by other functions with an
         *  identical name (in which case the weak reference is discarded at link time).
         */
        #define ATTR_WEAK                    __attribute__ ((weak))
      #endif

      /** Forces the compiler to not automatically zero the given global variable on startup, so that the
       *  current RAM contents is retained. Under most conditions this value will be random due to the
       *  behavior of volatile memory once power is removed, but may be used in some specific circumstances,
       *  like the passing of values back after a system watchdog reset.
       */
      #define ATTR_NO_INIT                     __attribute__ ((section (".noinit")))

      /** Places the function in one of the initialization sections, which execute before the main function
       *  of the application. Refer to the avr-libc manual for more information on the initialization sections.
       *
       *  \param[in] SectionIndex  Initialization section number where the function should be placed.
       */
      #define ATTR_INIT_SECTION(SectionIndex)  __attribute__ ((used, naked, section (".init" #SectionIndex )))

      /** Marks a function as an alias for another function.
       *
       *  \param[in] Func  Name of the function which the given function name should alias.
       */
      #define ATTR_ALIAS(Func)                 __attribute__ ((alias( #Func )))

      /** Marks a variable or struct element for packing into the smallest space available, omitting any
       *  alignment bytes usually added between fields to optimize field accesses.
       */
      #define ATTR_PACKED                      __attribute__ ((packed))

      /** Indicates the minimum alignment in bytes for a variable or struct element.
       *
       *  \param[in] Bytes  Minimum number of bytes the item should be aligned to.
       */
      #define ATTR_ALIGNED(Bytes)              __attribute__ ((aligned(Bytes)))    
  }+

  /////////////////////////////////////
  // Common.h
  /////////////////////////////////////

  +{
    #if (ARCH == ARCH_AVR8)
      #include <avr/io.h>
      #include <avr/interrupt.h>
      #include <avr/pgmspace.h>
      #include <avr/eeprom.h>
      #include <avr/boot.h>
      #include <math.h>
      #include <util/delay.h>

      typedef uint8_t uint_reg_t;

      #define ARCH_HAS_EEPROM_ADDRESS_SPACE
      #define ARCH_HAS_FLASH_ADDRESS_SPACE
      #define ARCH_HAS_MULTI_ADDRESS_SPACE
      #define ARCH_LITTLE_ENDIAN

    #elif (ARCH == ARCH_XMEGA)
      #include <avr/io.h>
      #include <avr/interrupt.h>
      #include <avr/pgmspace.h>
      #include <avr/eeprom.h>
      #include <math.h>
      #include <util/delay.h>

      typedef uint8_t uint_reg_t;

      #define ARCH_HAS_EEPROM_ADDRESS_SPACE
      #define ARCH_HAS_FLASH_ADDRESS_SPACE
      #define ARCH_HAS_MULTI_ADDRESS_SPACE
      #define ARCH_LITTLE_ENDIAN

    #else
      #error Unknown device architecture specified.
    #endif

  /* Public Interface - May be used in end-application: */
    /* Macros: */
      /** Macro for encasing other multi-statement macros. This should be used along with an opening brace
       *  before the start of any multi-statement macro, so that the macros contents as a whole are treated
       *  as a discrete block and not as a list of separate statements which may cause problems when used as
       *  a block (such as inline \c if statements).
       */
      #define MACROS                  do

      /** Macro for encasing other multi-statement macros. This should be used along with a preceding closing
       *  brace at the end of any multi-statement macro, so that the macros contents as a whole are treated
       *  as a discrete block and not as a list of separate statements which may cause problems when used as
       *  a block (such as inline \c if statements).
       */
      #define MACROE                  while (0)

      /** Convenience macro to determine the larger of two values.
       *
       *  \attention This macro should only be used with operands that do not have side effects from being evaluated
       *             multiple times.
       *
       *  \param[in] x  First value to compare
       *  \param[in] y  First value to compare
       *
       *  \return The larger of the two input parameters
       */
      #if !defined(MAX) || defined(__DOXYGEN__)
        #define MAX(x, y)               (((x) > (y)) ? (x) : (y))
      #endif

      /** Convenience macro to determine the smaller of two values.
       *
       *  \attention This macro should only be used with operands that do not have side effects from being evaluated
       *             multiple times.
       *
       *  \param[in] x  First value to compare.
       *  \param[in] y  First value to compare.
       *
       *  \return The smaller of the two input parameters
       */
      #if !defined(MIN) || defined(__DOXYGEN__)
        #define MIN(x, y)               (((x) < (y)) ? (x) : (y))
      #endif

      #if !defined(STRINGIFY) || defined(__DOXYGEN__)
        /** Converts the given input into a string, via the C Preprocessor. This macro puts literal quotation
         *  marks around the input, converting the source into a string literal.
         *
         *  \param[in] x  Input to convert into a string literal.
         *
         *  \return String version of the input.
         */
        #define STRINGIFY(x)            #x

        /** Converts the given input into a string after macro expansion, via the C Preprocessor. This macro puts
         *  literal quotation marks around the expanded input, converting the source into a string literal.
         *
         *  \param[in] x  Input to expand and convert into a string literal.
         *
         *  \return String version of the expanded input.
         */
        #define STRINGIFY_EXPANDED(x)   STRINGIFY(x)
      #endif

      #if !defined(CONCAT) || defined(__DOXYGEN__)
        /** Concatenates the given input into a single token, via the C Preprocessor.
         *
         *  \param[in] x  First item to concatenate.
         *  \param[in] y  Second item to concatenate.
         *
         *  \return Concatenated version of the input.
         */
        #define CONCAT(x, y)            x ## y

        /** CConcatenates the given input into a single token after macro expansion, via the C Preprocessor.
         *
         *  \param[in] x  First item to concatenate.
         *  \param[in] y  Second item to concatenate.
         *
         *  \return Concatenated version of the expanded input.
         */
        #define CONCAT_EXPANDED(x, y)   CONCAT(x, y)
      #endif

      #if !defined(ISR) || defined(__DOXYGEN__)
        /** Macro for the definition of interrupt service routines, so that the compiler can insert the required
         *  prologue and epilogue code to properly manage the interrupt routine without affecting the main thread's
         *  state with unintentional side-effects.
         *
         *  Interrupt handlers written using this macro may still need to be registered with the microcontroller's
         *  Interrupt Controller (if present) before they will properly handle incoming interrupt events.
         *
         *  \note This macro is only supplied on some architectures, where the standard library does not include a valid
         *        definition. If an existing definition exists, the alternative definition here will be ignored.
         *
         *  \ingroup Group_GlobalInt
         *
         *  \param[in] Name  Unique name of the interrupt service routine.
         */
        #define ISR(Name, ...)          void Name (void) __attribute__((__interrupt__)) __VA_ARGS__; void Name (void)
      #endif

    /* Inline Functions: */
      /** Function to reverse the individual bits in a byte - i.e. bit 7 is moved to bit 0, bit 6 to bit 1,
       *  etc.
       *
       *  \param[in] Byte  Byte of data whose bits are to be reversed.
       *
       *  \return Input data with the individual bits reversed (mirrored).
       */
      static inline uint8_t BitReverse(uint8_t Byte) ATTR_WARN_UNUSED_RESULT ATTR_CONST;
      static inline uint8_t BitReverse(uint8_t Byte)
      {
        Byte = (((Byte & 0xF0) >> 4) | ((Byte & 0x0F) << 4));
        Byte = (((Byte & 0xCC) >> 2) | ((Byte & 0x33) << 2));
        Byte = (((Byte & 0xAA) >> 1) | ((Byte & 0x55) << 1));

        return Byte;
      }

      /** Function to perform a blocking delay for a specified number of milliseconds. The actual delay will be
       *  at a minimum the specified number of milliseconds, however due to loop overhead and internal calculations
       *  may be slightly higher.
       *
       *  \param[in] Milliseconds  Number of milliseconds to delay
       */
      static inline void Delay_MS(uint16_t Milliseconds) ATTR_ALWAYS_INLINE;
      static inline void Delay_MS(uint16_t Milliseconds)
      {
        #if (ARCH == ARCH_AVR8)
        if (GCC_IS_COMPILE_CONST(Milliseconds))
        {
          _delay_ms(Milliseconds);
        }
        else
        {
          while (Milliseconds--)
            _delay_ms(1);
        }
        #elif (ARCH == ARCH_XMEGA)
        if (GCC_IS_COMPILE_CONST(Milliseconds))
        {
          _delay_ms(Milliseconds);
        }
        else
        {
          while (Milliseconds--)
            _delay_ms(1);
        }
        #endif
      }

      /** Retrieves a mask which contains the current state of the global interrupts for the device. This
       *  value can be stored before altering the global interrupt enable state, before restoring the
       *  flag(s) back to their previous values after a critical section using \ref SetGlobalInterruptMask().
       *
       *  \ingroup Group_GlobalInt
       *
       *  \return  Mask containing the current Global Interrupt Enable Mask bit(s).
       */
      static inline uint_reg_t GetGlobalInterruptMask(void) ATTR_ALWAYS_INLINE ATTR_WARN_UNUSED_RESULT;
      static inline uint_reg_t GetGlobalInterruptMask(void)
      {
        GCC_MEMORY_BARRIER();

        #if (ARCH == ARCH_AVR8)
        return SREG;
        #elif (ARCH == ARCH_XMEGA)
        return SREG;
        #endif
      }

      /** Sets the global interrupt enable state of the microcontroller to the mask passed into the function.
       *  This can be combined with \ref GetGlobalInterruptMask() to save and restore the Global Interrupt Enable
       *  Mask bit(s) of the device after a critical section has completed.
       *
       *  \ingroup Group_GlobalInt
       *
       *  \param[in] GlobalIntState  Global Interrupt Enable Mask value to use
       */
      static inline void SetGlobalInterruptMask(const uint_reg_t GlobalIntState) ATTR_ALWAYS_INLINE;
      static inline void SetGlobalInterruptMask(const uint_reg_t GlobalIntState)
      {
        GCC_MEMORY_BARRIER();

        #if (ARCH == ARCH_AVR8)
        SREG = GlobalIntState;
        #elif (ARCH == ARCH_XMEGA)
        SREG = GlobalIntState;
        #endif

        GCC_MEMORY_BARRIER();
      }

      /** Enables global interrupt handling for the device, allowing interrupts to be handled.
       *
       *  \ingroup Group_GlobalInt
       */
      static inline void GlobalInterruptEnable(void) ATTR_ALWAYS_INLINE;
      static inline void GlobalInterruptEnable(void)
      {
        GCC_MEMORY_BARRIER();

        #if (ARCH == ARCH_AVR8)
        sei();
        #elif (ARCH == ARCH_XMEGA)
        sei();
        #endif

        GCC_MEMORY_BARRIER();
      }

      /** Disabled global interrupt handling for the device, preventing interrupts from being handled.
       *
       *  \ingroup Group_GlobalInt
       */
      static inline void GlobalInterruptDisable(void) ATTR_ALWAYS_INLINE;
      static inline void GlobalInterruptDisable(void)
      {
        GCC_MEMORY_BARRIER();

        #if (ARCH == ARCH_AVR8)
        cli();
        #elif (ARCH == ARCH_XMEGA)
        cli();
        #endif

        GCC_MEMORY_BARRIER();
      }

  }+

  +{ #endif /* __CommonDefines_P__ */ }+
  
}