Configuring
creationTableBlock
	^ [ :aTable | |personIdForeignKey|
	aTable createFieldNamed: 'id' type: self platform sequence.
	aTable createFieldNamed: 'title' type: self platform text.
	aTable createFieldNamed: 'editorial' type: self platform text.
	aTable createFieldNamed: 'releaseYear' type: self platform text.
	personIdForeignKey := aTable createFieldNamed: 'author_id' type: self platform int4.
	aTable addForeignKeyFrom: personIdForeignKey to: ((self relatedObjectTableNamed: #PERSON) fieldNamed: #id).	
	(aTable fieldNamed: 'id') bePrimaryKey ]