
/*
 * ======== COMPOSITION test1.ComposPreset ========
 */

var $$c = function() {
    const ComposPreset = {};
    ComposPreset.ComposPreset = ComposPreset
    ComposPreset.$name = 'test1.ComposPreset';
    ComposPreset.pollen$used = 0;
    ComposPreset.Cls1 = $units['test1.Cls1'];
    ComposPreset.pollen__presets__ = function() {
        var $$text = '';
        ($units['test1.Cls1'].blueInitialValue) = 9;
        return $$text;
    }
    ComposPreset.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    return ComposPreset;
}
var $$u = $$c();
$units['test1.ComposPreset'] = $$u;
$units.push($$u);

