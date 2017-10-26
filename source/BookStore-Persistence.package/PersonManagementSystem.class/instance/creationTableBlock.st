Configuring
creationTableBlock
	^ [ :aTable | 
	| bookIdForeignKey |
	aTable createFieldNamed: 'id' type: self platform sequence.
	aTable createFieldNamed: 'firstName' type: self platform text.
	aTable createFieldNamed: 'lastName' type: self platform text.
	aTable createFieldNamed: 'country' type: self platform text.
	bookIdForeignKey := aTable createFieldNamed: 'book_id' type: self platform text.
	aTable addForeignKeyFrom: bookIdForeignKey to: ((self relatedObjectTableNamed: #BOOK) fieldNamed: #id).
	(aTable fieldNamed: 'id') bePrimaryKey ]