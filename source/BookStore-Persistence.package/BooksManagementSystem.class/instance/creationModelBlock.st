Configuring
creationModelBlock

	^ [ :aModel | 
	aModel
		newAttributeNamed: #id;
		newAttributeNamed: #title;
		newAttributeNamed: #editorial;
		newAttributeNamed: #releaseYear ]