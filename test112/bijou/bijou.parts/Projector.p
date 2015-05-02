
!--
    Projector module

    A projector is in a constant loop checking if a color is queued up, and 
    if it is, it projects the color (writes it to the LED / display)

    The loop of the projector happens via a timer that has a tick rate,
    what is called here pLoopDuration. Since the loop ticks go through a
    timer, other events in the system still have a chance to run. The projector
    is a primary part of a system though and is quite an active component.
--! 

import pollen.environment as Bijou 
//from Bijou import ColorLed

from pollen.event import Event
from pollen.time import Timer
from bijou.parts import LedState
from bijou.parts import Scene
from pollen.data import Queue{Scene} as SceneQueue


module Projector {

  const uint8 SceneQueueSize = 10
  host SceneQueue sceneQ = new SceneQueue(SceneQueueSize)  

  host Event showEvent = new Event(showScene)
  Event stoppedEvent = null
  bool sceneRunning = false
  Scene s = null


  public start(Event onStop) {
    stoppedEvent = onStop
  }

  public stop() {
    // Ouch. Doesn't do anything :| 
  }

  public bool addScene(Scene scene) {
    bool ret = sceneQ.add(scene)
    uint8 len = sceneQ.getLength()

    if (sceneQ.getLength() == 1) { 
      showEvent.post() 
    }
    return ret
  }

  //------------------------------------
  // Private methods
  //------------------------------------

  showScene() {
    print "Projector show Scene.."
    if (!sceneQ.isEmpty()) {      
      s = sceneQ.remove()
      uint8 len = sceneQ.getLength()
      print "showing and queue length is " + len + "\n"      
      s.start(sceneStopped)
      sceneRunning = true            
    } else {
      print "not showing\n"
    }

  }

  sceneStopped() {
    print "Projector scene stopped.."
    sceneRunning = false
    if (!sceneQ.isEmpty()) {
      showEvent.post()          // post event to have next scene shown
      print "queue not empty!!\n\n\n"
    } else {
      print "queue is empty\n\n"      
      if (stoppedEvent != null) {
        stoppedEvent.post()
      }
    }

  }

}