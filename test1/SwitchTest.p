
# TEST switch
module SwitchTest {

        enum State { UNINITIALIZED, INITIALIZATION, ACTIVE, IDLE, ERROR }
        public uint8 switch_test(uint8 state)  {
           uint8 nextState = State.UNINITIALIZED;
           switch(state)
           {
              case State.UNINITIALIZED:
                  nextState = State.INITIALIZATION
                  break
              case State.INITIALIZATION:
                  nextState = State.ACTIVE
                  break
              case State.IDLE:
              case State.ACTIVE:
                  nextState = state
                  break
              default:
                  nextState = State.ERROR
                  break
           }
           return nextState
        }
    }
     
