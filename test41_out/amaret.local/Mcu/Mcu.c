
/*
 * ======== string literals ========
 */

static const char amaret_local_Mcu__s__fileName[] = "Mcu.p";
static const char amaret_local_Mcu__s__0[] = "Mcu";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 
 #include <unistd.h> 

/*
 * ======== function definitions ========
 */

void amaret_local_Mcu_wait__E( uint32 us ) {
     usleep(us) ;

}

uint32 amaret_local_Mcu_getFrequency__E() {
    return(  (amaret_local_Mcu_sysFreq__V)  );
}

void amaret_local_Mcu_reset__E() {
     printf("Mcu.reset\n") ;

}

void amaret_local_Mcu_cycle__E() {
     usleep(1) ;

}

void amaret_local_Mcu_targetInit__I() {
}

void amaret_local_Mcu_shutdown__E() {
     printf("Mcu.shutdown\n") ;

}

void amaret_local_Mcu_setFrequency__E( uint32 hz ) {
    (amaret_local_Mcu_sysFreq__V) = (hz);
}

