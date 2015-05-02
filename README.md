#Pollen Test

The test sources are in t*[0-9].
The translated and linked tests  are in t*[0-9]_out.
The masters are in test_results.
The master for a test consists of all translator output text files 
  concatenated with translator messages and (if this is a runnable test) 
  the results of running the test.
  

Commands are in bin.
To run test suite:
  testPollen 
  testPollen -help // for options.

A successful run should have no output at all. 
Only regressions are reported. 

This tests pollen.jar, not the cloud compiler.
