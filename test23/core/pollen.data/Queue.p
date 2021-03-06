package pollen.data 

-------------------------------------------------------------------------------

Queue Data Structure

A first-in-first-out list type implemented as an array of fixed length.

-------------------------------------------------------------------------------

meta {type T} 

class Queue {
	
	host uint8 capacity
	T [] elements
	uint8 head = 0, tail = 0, len = 0
	
	host Queue(uint8 size) {
    @capacity = size
    elements = T[size]
	}
	
	Queue() {
		@head = @tail = @len = 0
	}
	
	public host uint8 capacity() { return @capacity	}
	public uint8 capacity() { return @capacity }		
	public uint8 length() {	return @len }

	public bool enqueue(T t) {
		if (len < capacity) {
			elements[tail] = t
			len++
			tail++
			if (tail == capacity) {	
				tail = 0		# wrap around
			}        				
			return true
		} else {
			return false
		}
	}
	
	public T dequeue() {
		T t = 0
				
		if (len > 0) {
			t = elements[head]
			head++ 
			if (head == capacity) { head = 0 } 
			len-- 
		}
		
		return t
	}
	

}