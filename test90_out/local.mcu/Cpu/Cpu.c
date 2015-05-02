
/*
 * ======== string literals ========
 */

static const char local_mcu_Cpu__s__fileName[] = "Cpu.p";
static const char local_mcu_Cpu__s__0[] = "Cpu";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 
 #include <unistd.h> 

/*
 * ======== function definitions ========
 */

void local_mcu_Cpu_wait__E( uint16 us ) {
     printf("Cpu.wait %u\n", us); usleep(us) ;

}

uint32 local_mcu_Cpu_getFrequency__E() {
    return(  (local_mcu_Cpu_sysFreq__V)  );
}

void local_mcu_Cpu_reset__E() {
     printf("Cpu.reset\n") ;

}

void local_mcu_Cpu_cycle__E() {
     printf("Cpu.cycle\n"); usleep(1) ;

}

void local_mcu_Cpu_targetInit__I() {
}

void local_mcu_Cpu_shutdown__E() {
     printf("Cpu.shutdown\n") ;

}

void local_mcu_Cpu_setFrequency__E( uint32 hz ) {
    (local_mcu_Cpu_sysFreq__V) = (hz);
}

