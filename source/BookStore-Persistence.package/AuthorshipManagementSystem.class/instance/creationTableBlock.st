Configuring
creationTableBlock
	^ [ :aTable | 
	| bookIdForeignKey personIdForeignKey |
	aTable createFieldNamed: 'id' type: self platform sequence.
	bookIdForeignKey := aTable createFieldNamed: 'book_id' type: self platform int4.
	aTable addForeignKeyFrom: bookIdForeignKey to: ((self relatedObjectTableNamed: #BOOK) fieldNamed: #id).
	personIdForeignKey := aTable createFieldNamed: 'person_id' type: self platform int4.
	aTable addForeignKeyFrom: bookIdForeignKey to: ((self relatedObjectTableNamed: #PERSON) fieldNamed: #id).
	(aTable fieldNamed: 'id') bePrimaryKey ]