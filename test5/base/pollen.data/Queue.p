package pollen.data 

----

FIFO queue data type implemented as an array of fixed length.

----
#from mcu.localhost import Write

meta {type T, uint8 cap} class Queue {
	
	host uint8 capacity = cap
	T elements[capacity]
	uint8 head = 0, tail = 0, num = 0
		
	//Queue() {
	//	@head = @tail = @num = 0
	//}
	
	public host setCapacity(uint8 cap) { @capacity = cap }

	public bool enqueue(T t) {
		if (num < capacity) {
			elements[tail] = t
			num++
			tail++
			if (tail == capacity) {	
				tail = 0		# wrap around
			}
			
        	#Write.outs("enqueue: h, t: ")
        	#Write.outi(head)
        	#Write.outs(" ")
        	#Write.outi(tail)
        	#Write.outs("\n")
        				
			return true
		} else {
			return false
		}
	}
	
	public T dequeue() {
		T t = 0
				
		if (num > 0) {
			t = elements[head]
			head++ 
			if (head == capacity) { head = 0 } 
			num-- 
        	#Write.outs("dequeue: h, t: ")
        	#Write.outi(head)
        	#Write.outs(" ")
        	#Write.outi(tail)
        	#Write.outs("\n")
		}
		
		return t
	}
	
	public uint8 length() {
		return num
	}
	
	public uint8 getCapacity() {
		return capacity
	}
	
	public host uint8 getCapacity() {
		return capacity
	}
}
