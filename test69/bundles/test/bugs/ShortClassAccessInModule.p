
module ShortClassAccessInModule {

  class Foo {
    uint8 data = 0

    public uint8 getData() {
      return @data
    }
  }

  pollen.run() {

  }
}