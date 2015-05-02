
/*
 * ======== string literals ========
 */

static const char pollen_data_Qint8__s__fileName[] = "Qint8.p";
static const char pollen_data_Qint8__s__0[] = "Qint8";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

bool pollen_data_Qint8_Qint8_add__E( pollen_data_Qint8_ this, uint8 e ) {
    if (this->length < this->capacity) {
        this->elements[(this->tail)] = (e);
        ++(this->tail);
        ++(this->length);
        if ((this->tail) == (this->capacity)) {
            (this->tail) = 0;
        }
        return(  true  );
    }
    else {
        return(  false  );
    }
}

bool pollen_data_Qint8_Qint8_isEmpty__E( pollen_data_Qint8_ this ) {
    return(  (this->length) == 0  );
}

void pollen_data_Qint8_Qint8_printInt__I( pollen_data_Qint8_ this, uint32 i ) {
     printf("%d\n", i) ;

}

uint8 pollen_data_Qint8_Qint8_getLength__E( pollen_data_Qint8_ this ) {
    return(  this->length  );
}

pollen_data_Qint8_ pollen_data_Qint8_Qint8_new___E( pollen_data_Qint8_ this ) {
    return this;
}

uint8 pollen_data_Qint8_Qint8_remove__E( pollen_data_Qint8_ this ) {
    uint8 e;
    e = 0;
    if (!pollen_data_Qint8_Qint8_isEmpty__E(this)) {
        (e) = this->elements[(this->head)];
        ++(this->head);
        --(this->length);
        if ((this->head) == (this->capacity)) {
            (this->head) = 0;
        }
    }
    return(  (e)  );
}

void pollen_data_Qint8_Qint8_printStr__I( pollen_data_Qint8_ this, string str ) {
     printf("%s\n", str) ;

}

uint8 pollen_data_Qint8_Qint8_peek__E( pollen_data_Qint8_ this ) {
    if (!pollen_data_Qint8_Qint8_isEmpty__E(this)) {
        return(  (this->elements[(this->head)])  );
    }
}

uint8 pollen_data_Qint8_Qint8_getCapacity__E( pollen_data_Qint8_ this ) {
    return(  this->capacity  );
}

