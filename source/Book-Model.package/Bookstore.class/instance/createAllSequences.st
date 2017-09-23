RDB-Protocol
createAllSequences
	self glorpSession system platform areSequencesExplicitlyCreated
		ifFalse: [ ^ self ].
	self glorpSession system allSequences
		do: [ :each | 
			self glorpSession accessor
				createSequence: each
				ifError: [ :error | Transcript show: error messageText ] ]
