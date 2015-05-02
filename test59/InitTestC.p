import InitTestM2
composition InitTestC {

  export InitTestM2.foo

  host InitTestC() {
    print "InitTestC host init\n"
  }
}

