// !--
//
//   Three animations.
//   -----------------
//
// Turn on
// Play Device On Animation
//
// Play First Animation - on repeat
//
//   if [double click]
//     enter monochrome animation
//
//   if [one click]
//
// Play Second Animation
//
//   if [double click]
//     enter monochrome animation
//
//   if [one click]
//
// Play Third Animation
//
//   if [double click]
//     enter monochrome animation
//
//   if [one click]
//
// Play Device Off Animation
// Turn off
//
// --!

import pollen.environment as Bijou

from Bijou import Button              // There needs to be some porting effort to move the button to a different board...
from Bijou import Led0
from Bijou import Led1
from silabs.stk.gecko import SegmentLcd as Lcd

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import RgbColorWalk
from bijou.pattern import StillColorPattern

from pollen.event import Event

module ThreeGo_ {

  enum SceneState { Intro, Scene1, Scene2, Scene3, Outro }
  uint8 currentScene = SceneState.Intro

  host Event sceneStoppedEvent = new Event(sceneStopped)

  host Scene sIntro = new Scene(1000, RgbColorWalk.start, RgbColorWalk.stop)
  host Scene sOne   = new Scene(6000, StillColorPattern.start, StillColorPattern.stop)
  host Scene sTwo   = new Scene(6000, StillColorPattern.start, StillColorPattern.stop)
  host Scene sThree = new Scene(6000, StillColorPattern.start, StillColorPattern.stop)
  host Scene sOutro = new Scene(1000, RgbColorWalk.start, RgbColorWalk.stop)
  Scene cScene = sIntro
  bool clickStopped = false

  host ThreeGo_() {
    Button.setClickHandlerOnHost(handleClick)
    Button.setDoubleClickHandlerOnHost(handleDoubleClick)
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    Lcd.writeString("Intro")
    Projector.addScene(sIntro)             // Queue up intro scene 
    Projector.start(sceneStoppedEvent)     // Start the projector    
    Bijou.run()                            // Run event system
  }

  //--- Private Methods -----------------------------------------------------//

  sceneStopped() {

    if (currentScene == SceneState.Intro) {                // intro stopped, start scene 1 
      currentScene = SceneState.Scene1
      cScene = sOne
      StillColorPattern.setColorRGB(255, 0, 0)
      Projector.addScene(cScene)   
      Lcd.writeString("Scene1")

    } elif (currentScene == SceneState.Outro) {            // outro stopped, print out something for now
      Projector.addScene(sOutro)   
      Lcd.writeString("Outro")                   // Later: go into low power mode
      currentScene = SceneState.Intro           // after outro we go back to intro for now..            
      cScene = sIntro

    } else {                                     // otherwise, repeat the scene      
      if (currentScene == SceneState.Scene1) {
        StillColorPattern.setColorRGB(255, 0, 0)
      } elif (currentScene == SceneState.Scene2) {
        StillColorPattern.setColorRGB(0, 255, 0)
      } elif (currentScene == SceneState.Scene3) {
        StillColorPattern.setColorRGB(0, 0, 255)        
      }
      
      Projector.addScene(cScene)   // requeue up current scene
    }
  }


  handleClick() {

    if (!clickStopped) {
      cScene.stop()

      if (currentScene == SceneState.Scene1) {      
        currentScene = SceneState.Scene2
        cScene = sTwo
        Lcd.writeString("Scene2")
      } elif (currentScene == SceneState.Scene2) {
        currentScene = SceneState.Scene3
        cScene = sThree
        Lcd.writeString("Scene3")
      } elif (currentScene == SceneState.Scene3) {
        currentScene = SceneState.Outro
        cScene = sOutro
        Lcd.writeString("Outro")
      }
    } else {
      clickStopped = false
      restartScene()
    }
  }


  handleDoubleClick() {

    if (!clickStopped) {
      cScene.stop()
      Lcd.writeString("DbClick")
      clickStopped = true
    } else {
      clickStopped = false
      restartScene()
    }
  }

  restartScene() {
    if (currentScene == SceneState.Scene1) {
      Lcd.writeString("Scene1")
    } elif (currentScene == SceneState.Scene2) {
      Lcd.writeString("Scene2")
    } elif (currentScene == SceneState.Scene3) {
      Lcd.writeString("Scene3")
    }
    Projector.addScene(cScene)    
  }
}
