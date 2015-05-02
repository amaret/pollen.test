
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void localhost_Lifecycle_pollen__reset__E();
void localhost_Lifecycle_pollen__ready__E();
void localhost_Lifecycle_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_text_Text_ pollen_text_Text;

/*
 * ======== struct module definition (unit Text) ========
 */

struct pollen_text_Text_ {
};
typedef struct pollen_text_Text_ pollen_text_Text_;

/*
 * ======== function members (unit Text) ========
 */

extern int32 pollen_text_Text_strcmp__E( string s1, string s2 );
extern int32 pollen_text_Text_strncmp__E( string s1, string s2, uint16 n );
extern uint16 pollen_text_Text_strlen__E( string s );
extern void pollen_text_Text_itoa__E( int32 num, byte  str[], uint8 base );
extern void pollen_text_Text_reverse__E( byte  data[], uint16 length );
extern void pollen_text_Text_targetInit__I();


/*
 * ======== data members (unit Text) ========
 */

