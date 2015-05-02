
/*
 * ======== CLASS test57.ClsFuncRef ========
 */

var $$c = function() {
    const ClsFuncRef = {};
    ClsFuncRef.ClsFuncRef = ClsFuncRef
    ClsFuncRef.$name = 'test57.ClsFuncRef';
    ClsFuncRef.pollen$used = 0;
    ClsFuncRef.ClsFuncRef$$id = 1;
    ClsFuncRef.ClsFuncRef = function(cn) {
        this.$$id = ClsFuncRef.ClsFuncRef$$id++;
        this.$$cname = cn ? cn : 'test57_ClsFuncRef_ClsFuncRef__'+this.$$id+'__S';
        this.$$tname = 'test57_ClsFuncRef_ClsFuncRef';
        this.$$uname = 'test57.ClsFuncRef';
        this.myHandler1_Host = 0;
        this.myHandler2_Host = 0;
        this.myHandler3_Host = 0;
        this.myHandler4_Host = 0;
        this.flag = true;
        this.myHandler1_Targ = 0;
        this.myHandler2_Targ = 0;
        this.myHandler3_Targ = 0;
        this.myHandler4_Targ = 0;
        this.flag2 = true;
        this.tt = 0;
    }
    ClsFuncRef.ClsFuncRef.prototype = new $$Struct('test57.ClsFuncRef.ClsFuncRef');
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld = {};
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler1_Host = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler2_Host = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler3_Host = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler4_Host = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.flag = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler1_Targ = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler2_Targ = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler3_Targ = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.myHandler4_Targ = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.flag2 = false;
    ClsFuncRef.ClsFuncRef.prototype.$$isAggFld.tt = false;
    ClsFuncRef.ClsFuncRef.prototype.new_host = function() {
        var $$text = '';
        this.$$privateInit();
        this.setTheFuncRefOnHost1((ClsFuncRef.hostTheHandler));
        this.setTheFuncRefOnHost2((ClsFuncRef.targetTheHandler));
        this.setTheFuncRefOnHost3((ClsFuncRef.hostTheHandler));
        this.setTheFuncRefOnHost4((ClsFuncRef.targetTheHandler));
        this.$$hostInitLastPass();
        return this;
    }
    ClsFuncRef.ClsFuncRef.prototype.setTheFuncRefOnHost1 = function( h ) {
        var $$text = '';
        (this.myHandler1_Host) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.ClsFuncRef.prototype.setTheFuncRefOnHost2 = function( h ) {
        var $$text = '';
        (this.myHandler2_Host) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.ClsFuncRef.prototype.setTheFuncRefOnHost3 = function( h ) {
        var $$text = '';
        (this.myHandler3_Targ) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.ClsFuncRef.prototype.setTheFuncRefOnHost4 = function( h ) {
        var $$text = '';
        (this.myHandler4_Targ) = (h);
        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.ClsFuncRef.prototype.hostTheHandler = function() {
        var $$text = '';
         printf("host Handler called\n") ;

        this.$$hostInitLastPass();
        return $$text;
    }
    ClsFuncRef.pollen__uses__ = function() {
    }
    ClsFuncRef.ClsFuncRef.prototype.$$privateInit = function() {
        this.flag = true;
        this.flag2 = true;
        ClsFuncRef.tt = new $$Ref('test57_ClsFuncRef_ClsFuncRef_foo__E');
    }
    ClsFuncRef.ClsFuncRef.prototype.$$hostInitLastPass = function() {
    }
    return ClsFuncRef;
}
var $$u = $$c();
$units['test57.ClsFuncRef'] = $$u;
$units.push($$u);

