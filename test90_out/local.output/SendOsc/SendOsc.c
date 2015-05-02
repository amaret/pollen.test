
/*
 * ======== string literals ========
 */

static const char local_output_SendOsc__s__fileName[] = "SendOsc.p";
static const char local_output_SendOsc__s__1[] = "SendOsc";
static const char local_output_SendOsc__s__0[] = "oscsend 127.0.0.1 7000 /led/1 iii ";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void local_output_SendOsc_sendRGB__E( uint8 r, uint8 g, uint8 b ) {
    byte tmp[5];
    string t;
    uint8 len;
    
    t = (tmp);
    len = 0;
    local_output_SendOsc_sprint__I((local_output_SendOsc_header__V), (local_output_SendOsc_data__A), 0);
    pollen_text_Text_itoa__E((r), (tmp), 10);
    local_output_SendOsc_sprint__I((t), (local_output_SendOsc_data__A), pollen_text_Text_strlen__E((local_output_SendOsc_header__V)));
    (len) = pollen_text_Text_strlen__E((local_output_SendOsc_data__A));
    (local_output_SendOsc_data__A[(len)]) = ' ';
    (local_output_SendOsc_data__A[(len) + 1]) = '\0';
    pollen_text_Text_itoa__E((g), (tmp), 10);
    local_output_SendOsc_sprint__I((t), (local_output_SendOsc_data__A), pollen_text_Text_strlen__E((local_output_SendOsc_data__A)));
    (len) = pollen_text_Text_strlen__E((local_output_SendOsc_data__A));
    (local_output_SendOsc_data__A[(len)]) = ' ';
    (local_output_SendOsc_data__A[(len) + 1]) = '\0';
    pollen_text_Text_itoa__E((b), (tmp), 10);
    local_output_SendOsc_sprint__I((t), (local_output_SendOsc_data__A), pollen_text_Text_strlen__E((local_output_SendOsc_data__A)));
     system(local_output_SendOsc_data__A) ;

}

void local_output_SendOsc_sprint__I( string s, byte  data[], uint16 start ) {
    uint16 i;
    byte * b = (char*) (s);
    i = 0;
    while ((b[(i)]) != '\0') {
        (data[(start) + (i)]) = (b[(i)]);
        (i)++;
    }
    (data[(start) + (i)]) = '\0';
}

void local_output_SendOsc_targetInit__I() {
}

