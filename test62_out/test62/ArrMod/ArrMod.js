
/*
 * ======== MODULE test62.ArrMod ========
 */

var $$c = function() {
    const ArrMod = {};
    ArrMod.ArrMod = ArrMod
    ArrMod.$name = 'test62.ArrMod';
    ArrMod.pollen$used = 0;
    ArrMod.targetInit = new $$Ref('test62_ArrMod_targetInit__I');
    ArrMod.$$hostInit = function() {
        var $$text = '';
        ArrMod.targBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_targBuff_sizeTarg__A', false);
        ArrMod.hostBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_hostBuff_sizeTarg__A', false);
        ArrMod.err_targBuff_sizeTarg = new $$Array((ArrMod.errsizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_targBuff_sizeTarg__A', false);
        ArrMod.err_hostBuff_sizeTarg = new $$Array((ArrMod.errsizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_hostBuff_sizeTarg__A', false);
        $$printf("hostInit ArrMod() (after privateInit, after preset Initializer):\n");
        $$printf(" sizeHost ", (ArrMod.sizeHost), "\n");
        $$printf("   init on dcln to 8\n");
        $$printf(" sizeTarg ", (ArrMod.sizeTarg), "\n");
        $$printf("   init on dcln to 6\n");
        $$printf(" errsizeHost ", (ArrMod.errsizeHost), "\n");
        $$printf("   init on dcln to 7\n");
        $$printf(" errsizeTarg ", (ArrMod.errsizeTarg), "\n");
        $$printf("   init on dcln to 5\n");
        return $$text;
    }
    ArrMod.sizes = function() {
        var $$text = '';
        $$printf("sizes ArrMod() (after privateInit, after preset Initializer):\n");
        $$printf(" sizeHost ", (ArrMod.sizeHost), "\n");
        $$printf("   init on dcln to 8\n");
        $$printf(" sizeTarg ", (ArrMod.sizeTarg), "\n");
        $$printf("   init on dcln to 6\n");
        $$printf(" errsizeHost ", (ArrMod.errsizeHost), "\n");
        $$printf("   init on dcln to 7\n");
        $$printf(" errsizeTarg ", (ArrMod.errsizeTarg), "\n");
        $$printf("   init on dcln to 5\n");
        return $$text;
    }
    ArrMod.pollen__uses__ = function() {
    }
    ArrMod.$$privateInit = function() {
        ArrMod.sizeHost = 8;
        ArrMod.sizeTarg = 6;
        ArrMod.errsizeHost = 7;
        ArrMod.errsizeTarg = 5;
        ArrMod.targBuff_sizeTarg = new $$Array((ArrMod.sizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_targBuff_sizeTarg__A', false);
        ArrMod.err_targBuff_sizeTarg = new $$Array((ArrMod.errsizeTarg), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_targBuff_sizeTarg__A', false);
    }
    ArrMod.$$hostInitLastPass = function() {
        ArrMod.targBuff_sizeHost = new $$Array((ArrMod.sizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_targBuff_sizeHost__A', false);
        ArrMod.hostBuff_sizeHost = new $$Array((ArrMod.sizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_hostBuff_sizeHost__A', false);
        ArrMod.err_targBuff_sizeHost = new $$Array((ArrMod.errsizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_targBuff_sizeHost__A', false);
        ArrMod.err_hostBuff_sizeHost = new $$Array((ArrMod.errsizeHost), function($$cn,$$idx){ return 0;}, 'test62_ArrMod_err_hostBuff_sizeHost__A', false);
    }
    return ArrMod;
}
var $$u = $$c();
$units['test62.ArrMod'] = $$u;
$units.push($$u);

