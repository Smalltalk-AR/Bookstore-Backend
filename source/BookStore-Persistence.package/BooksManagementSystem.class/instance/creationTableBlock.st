Configuring
creationTableBlock
	^ [ :aTable | 
	aTable createFieldNamed: 'id' type: self platform sequence.
	aTable createFieldNamed: 'title' type: self platform text.
	aTable createFieldNamed: 'editorial' type: self platform text.
	aTable createFieldNamed: 'releaseYear' type: self platform text.
	(aTable fieldNamed: 'id') bePrimaryKey ]