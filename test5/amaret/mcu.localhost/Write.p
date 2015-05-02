package mcu.localhost

----
This module simply encapsulates a way to print output on the localhost
----

module Write {

	+{ #include <stdio.h> }+

	public outs(string s) {
		+{printf("%s", s)}+
	}

	public outi(uint32 i) {
		+{printf("%i", i)}+
	}
}