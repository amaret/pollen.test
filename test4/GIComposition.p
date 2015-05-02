import GlobalInterrupts
import OtherInterrupts as OtherI
import OtherInterrupts as AsInterrupts2
composition GIComposition {

   export GlobalInterrupts
   export OtherI
   export AsInterrupts2
   #export GlobalInterrupts.disable

}
