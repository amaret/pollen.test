
> testPollen       
Runs tests. -help for options.  (testResults is called by testPollen.)
Success is no output. Regressions reported. 

> testPollen -clean
Creates new masters and also deletes previous results for a test.

Scripts check for required files and report missing files.

How to use: 
testPollen        // run until all reported regressions are known to be fixed.
testPollen -clean // this will create new masters so the run will be clean.

Committing:
Be sure to run testPollen with -clean as the last test run before commit 
to delete binaries which clog up git.

Paths are relative to test dir so that testing on different machines 
should not produce spurious regressions from path differences.  
If some gcc produces absolute paths do a testPollen -clean. 

