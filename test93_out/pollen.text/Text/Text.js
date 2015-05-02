
/*
 * ======== MODULE pollen.text.Text ========
 */

var $$c = function() {
    const Text = {};
    Text.Text = Text
    Text.$name = 'pollen.text.Text';
    Text.pollen$used = 0;
    Text.itoa = new $$Ref('pollen_text_Text_itoa__E');
    Text.reverse = new $$Ref('pollen_text_Text_reverse__E');
    Text.strcmp = new $$Ref('pollen_text_Text_strcmp__E');
    Text.strncmp = new $$Ref('pollen_text_Text_strncmp__E');
    Text.strlen = new $$Ref('pollen_text_Text_strlen__E');
    Text.targetInit = new $$Ref('pollen_text_Text_targetInit__I');
    Text.$$hostInit = function() {
        var $$text = '';
        return $$text;
    }
    Text.pollen__uses__ = function() {
    }
    Text.$$privateInit = function() {
    }
    return Text;
}
var $$u = $$c();
$units['pollen.text.Text'] = $$u;
$units.push($$u);

