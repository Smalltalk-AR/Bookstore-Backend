Configuring
creationModelBlock
	^ [ :aModel | 
	aModel
		newAttributeNamed: #id;
		newAttributeNamed: #book type: Book;
		newAttributeNamed: #person type: Person ]