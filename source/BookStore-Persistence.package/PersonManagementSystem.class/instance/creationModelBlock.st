Configuring
creationModelBlock

	^ [ :aModel | 
	aModel
		newAttributeNamed: #id;
		newAttributeNamed: #firstName;
		newAttributeNamed: #lastName;
		newAttributeNamed: #country;
		newAttributeNamed: #books collectionOf: Book ]