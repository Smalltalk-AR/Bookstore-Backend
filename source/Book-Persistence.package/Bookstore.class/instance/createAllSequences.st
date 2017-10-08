RDB-Protocol
createAllSequences
	self platform areSequencesExplicitlyCreated
		ifFalse: [ ^ self ].
	self allSequences
		do: [ :each | 
			self glorpSession accessor
				createSequence: each
				ifError: [ :error | Transcript show: error messageText ] ]
