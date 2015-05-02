from pollen.interfaces import GlobalInterrupts as GI

module OtherInterrupts implements GI {
	public uint16 disable() { }
	public enable() { }
	public uint16 other_disable() { }
	public other_enable() { }
}
