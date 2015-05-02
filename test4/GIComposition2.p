//import GIComposition 
from GIComposition import GlobalInterrupts
from GIComposition import OtherI
from GIComposition import OtherI as AsInterrupts
composition GIComposition2 {

   export GlobalInterrupts.enable
   export OtherI.other_enable
   export OtherI
   export AsInterrupts.disable
   #export AsInterrupts # commenting out makes the enable call in TestExports not resolve
}
