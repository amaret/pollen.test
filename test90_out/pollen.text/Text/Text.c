
/*
 * ======== string literals ========
 */

static const char pollen_text_Text__s__fileName[] = "Text.p";
static const char pollen_text_Text__s__0[] = "Text";

/*
 * ======== function definitions ========
 */

int32 pollen_text_Text_strcmp__E( string s1, string s2 ) {
    
         while (*s1 == *s2++)
                 if (*s1++ == '\0')
                         return (0);
         return (*(const unsigned char *)s1 - *(const unsigned char *)(s2 - 1));
   ;

}

int32 pollen_text_Text_strncmp__E( string s1, string s2, uint16 n ) {
     
         if (n == 0)
                 return (0);
         do {
                 if (*s1 != *s2++)
                         return (*(const unsigned char *)s1 -
                                 *(const unsigned char *)(s2 - 1));
                 if (*s1++ == '\0')
                         break;
         } while (--n != 0);
         return (0);
    ;

}

uint16 pollen_text_Text_strlen__E( string s ) {
    uint16 i;
    byte * b = (char*) (s);
    i = 0;
    while ((b[(i)]) != '\0') {
        (i)++;
    }
    return(  (i)  );
}

void pollen_text_Text_itoa__E( int32 num, byte  str[], uint8 base ) {
    uint16 i;
    bool isNegative;
    uint32 rem;
    i = 0;
    isNegative = false;
    if ((num) == 0) {
        (str[(i)++]) = '0';
        (str[(i)]) = '\0';
        return;
    }
    if ((num) < 0 && (base) == 10) {
        (isNegative) = true;
        (num) = -(num);
    }
    while ((num) != 0) {
        rem = (num) % (base);
        (str[(i)++]) = ((rem) > 9) ? ((rem) - 10) + 0x61 : (rem) + 0x30;
        (num) = (num) / (base);
    }
    if ((isNegative)) {
        (str[(i)++]) = '-';
    }
    (str[(i)]) = '\0';
    pollen_text_Text_reverse__E((str), (i));
}

void pollen_text_Text_reverse__E( byte  data[], uint16 length ) {
    uint16 start;
    uint16 end;
    byte b;
    start = 0;
    end = (length) - 1;
    while ((start) < (end)) {
        b = (data[(start)]);
        (data[(start)]) = (data[(end)]);
        (data[(end)]) = (b);
        (start)++;
        (end)--;
    }
}

void pollen_text_Text_targetInit__I() {
}

