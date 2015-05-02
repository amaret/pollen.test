
/*
 * ======== COMPOSITION test62.ArrConfig ========
 */

var $$c = function() {
    const ArrConfig = {};
    ArrConfig.ArrConfig = ArrConfig
    ArrConfig.$name = 'test62.ArrConfig';
    ArrConfig.pollen$used = 0;
    ArrConfig.ArrMod = $units['test62.ArrMod'];
    ArrConfig.ArrCls = $units['test62.ArrCls'];
    ArrConfig.pollen__presets__ = function() {
        var $$text = '';
        $$printf("running ArrConfig() preset...\n");
        ($units['test62.ArrMod'].sizeHost) = 16;
        ($units['test62.ArrMod'].sizeTarg) = 20;
        ($units['test62.ArrMod'].errsizeHost) = ArrConfig.size();
        ($units['test62.ArrMod'].errsizeTarg) = ArrConfig.size();
        ($units['test62.ArrCls'].cls_sizeHost) = 24;
        ($units['test62.ArrCls'].cls_sizeTarg) = 28;
        ($units['test62.ArrCls'].err_cls_sizeHost) = ArrConfig.size();
        ($units['test62.ArrCls'].err_cls_sizeTarg) = ArrConfig.size();
        $$printf("DONE ArrConfig() preset...\n");
        return $$text;
    }
    ArrConfig.size = function() {
        var $$text = '';
        return(  16  );
        return $$text;
    }
    return ArrConfig;
}
var $$u = $$c();
$units['test62.ArrConfig'] = $$u;
$units.push($$u);

