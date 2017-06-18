Accessing
hash
	^ title hash bitXor: (author hash bitXor: (editorial hash bitXor: year hash))