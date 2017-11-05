Comparing
hash
	^ firstName hash bitXor: (lastName hash bitXor: country hash)