DB-Creation
createAllSequences
	self platform areSequencesExplicitlyCreated
		ifTrue: [ self allSequences
				do: [ :each | 
					self glorpSession accessor
						createSequence: each
						ifError: [ :error | Transcript show: error messageText ] ] ]