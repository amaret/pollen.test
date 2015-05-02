class Cls1 {
    byte arrNoDim[]
    byte arrStr[] = { 'h', 'e', 'l', 'l', 'o' }
    public checkStuff() {
        arrNoDim @= arrStr
        print "\nCheck nested class accesses: " + "\n"
        print "arrNoDim[0]: " + arrNoDim[0] + "\n"
        string str 
        str = arrNoDim[0]                   
        print "arrNoDim: " + str + "\n"
        str = arrNoDim[1]                  
        print "arrNoDim[1] to end: " + str + "\n"
        arrNoDim[3] = 'z'
        str = arrNoDim                   
        print "arrNoDim 4th elem is 'z': " + str + "\n"
        str = arrStr                   
        print "arrStr via str: " + str + "\n"
        arrNoDim @= str
        for (uint8 i = 0; arrNoDim[i] != '\0'; i++) {
            str = arrNoDim[i]         
            print str + "\n"
            print "char " + arrNoDim[i] + "\n"
        }
    }
}
