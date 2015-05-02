import Scene
# TEST using module members with '@'
module Test {
     
    host Scene sc = new Scene(20)
    uint32 duration = 0
    Scene scene = null

    public start(Scene s) {
        @scene = s     
        @duration = @scene.getDuration()  // This gets a type error
        @duration = scene.getDuration()  // This doesn't
    
        if (duration < 100) {
          duration = 100
        }
    
        duration -= 15
      }
   pollen.run() {
      start(sc)
   }
}
