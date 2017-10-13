Configuring
creationTableBlock
	^ [ :aTable | 
	aTable createFieldNamed: 'id' type: self platform sequence.
	aTable createFieldNamed: 'title' type: self platform text.
	aTable createFieldNamed: 'author' type: self platform text.
	aTable createFieldNamed: 'editorial' type: self platform text.
	aTable createFieldNamed: 'year' type: self platform text.
	(aTable fieldNamed: 'id') bePrimaryKey ]