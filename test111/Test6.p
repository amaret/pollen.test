import pollen.environment 

# TEST intrinsic pollen.reset - is its unit used?

module Test6 {


  #pollen.reset() {  // gets multiply defined pollen.reset error
  #  MyApp.reset()
  #}

  pollen.run() {
  }

  MyAppUnknownState() {

      #pollen.reset()

  }

}
