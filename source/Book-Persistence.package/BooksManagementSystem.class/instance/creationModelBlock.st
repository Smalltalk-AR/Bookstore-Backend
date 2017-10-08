Configuring
creationModelBlock
	^ [ :aModel | 
	aModel
		newAttributeNamed: #id;
		newAttributeNamed: #title;
		newAttributeNamed: #author;
		newAttributeNamed: #editorial;
		newAttributeNamed: #year ]