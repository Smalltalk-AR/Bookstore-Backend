Configuring
creationTableBlock

	^ [ :aTable | 
	aTable createFieldNamed: 'id' type: self platform sequence.
	aTable createFieldNamed: 'firstName' type: self platform text.
	aTable createFieldNamed: 'lastName' type: self platform text.
	aTable createFieldNamed: 'country' type: self platform text.
	(aTable fieldNamed: 'id') bePrimaryKey ]