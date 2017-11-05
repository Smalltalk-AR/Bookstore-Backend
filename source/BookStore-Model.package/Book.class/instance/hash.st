Comparing
hash
	^ title hash bitXor: (editorial hash bitXor: (releaseYear hash bitXor: author hash))