
/*
 * ======== MODULE test57.SetFuncRefOnHost ========
 */

var $$c = function() {
    const SetFuncRefOnHost = {};
    SetFuncRefOnHost.SetFuncRefOnHost = SetFuncRefOnHost
    SetFuncRefOnHost.$name = 'test57.SetFuncRefOnHost';
    SetFuncRefOnHost.pollen$used = 0;
    SetFuncRefOnHost.ClsFuncRef = $units['test57.ClsFuncRef'];
    SetFuncRefOnHost.targetInit = new $$Ref('test57_SetFuncRefOnHost_targetInit__I');
    SetFuncRefOnHost.setTheFuncRefOnTarg1 = new $$Ref('test57_SetFuncRefOnHost_setTheFuncRefOnTarg1__I');
    SetFuncRefOnHost.setTheFuncRefOnTarg2 = new $$Ref('test57_SetFuncRefOnHost_setTheFuncRefOnTarg2__I');
    SetFuncRefOnHost.setTheFuncRefOnTarg3 = new $$Ref('test57_SetFuncRefOnHost_setTheFuncRefOnTarg3__I');
    SetFuncRefOnHost.setTheFuncRefOnTarg4 = new $$Ref('test57_SetFuncRefOnHost_setTheFuncRefOnTarg4__I');
    SetFuncRefOnHost.pollen__run = new $$Ref('test57_SetFuncRefOnHost_pollen__run__E');
    SetFuncRefOnHost.targetTheHandler = new $$Ref('test57_SetFuncRefOnHost_targetTheHandler__I');
    SetFuncRefOnHost.pollen__shutdown = new $$Ref('test57_SetFuncRefOnHost_pollen__shutdown__E');
    SetFuncRefOnHost.$$hostInit = function() {
        var $$text = '';
        SetFuncRefOnHost.clsFR = new $units['test57.ClsFuncRef'].ClsFuncRef('test57_SetFuncRefOnHost_clsFR__V'); SetFuncRefOnHost.clsFR.new_host();
        SetFuncRefOnHost.setTheFuncRefOnHost1((SetFuncRefOnHost.hostTheHandler));
        SetFuncRefOnHost.setTheFuncRefOnHost2((SetFuncRefOnHost.targetTheHandler));
        SetFuncRefOnHost.setTheFuncRefOnHost3((SetFuncRefOnHost.hostTheHandler));
        SetFuncRefOnHost.setTheFuncRefOnHost4((SetFuncRefOnHost.targetTheHandler));
        return $$text;
    }
    SetFuncRefOnHost.setTheFuncRefOnHost1 = function( h ) {
        var $$text = '';
        (SetFuncRefOnHost.myHandler1_Host) = (h);
        return $$text;
    }
    SetFuncRefOnHost.setTheFuncRefOnHost2 = function( h ) {
        var $$text = '';
        (SetFuncRefOnHost.myHandler2_Host) = (h);
        return $$text;
    }
    SetFuncRefOnHost.setTheFuncRefOnHost3 = function( h ) {
        var $$text = '';
        (SetFuncRefOnHost.myHandler3_Targ) = (h);
        return $$text;
    }
    SetFuncRefOnHost.setTheFuncRefOnHost4 = function( h ) {
        var $$text = '';
        (SetFuncRefOnHost.myHandler4_Targ) = (h);
        return $$text;
    }
    SetFuncRefOnHost.hostTheHandler = function() {
        var $$text = '';
         printf("host Handler called\n") ;

        return $$text;
    }
    SetFuncRefOnHost.pollen__uses__ = function() {
        $$bind($units['test57.ClsFuncRef'], 'pollen$used', true);
    }
    SetFuncRefOnHost.$$privateInit = function() {
        SetFuncRefOnHost.flag = true;
        SetFuncRefOnHost.flag2 = true;
    }
    return SetFuncRefOnHost;
}
var $$u = $$c();
$units['test57.SetFuncRefOnHost'] = $$u;
$units.push($$u);

