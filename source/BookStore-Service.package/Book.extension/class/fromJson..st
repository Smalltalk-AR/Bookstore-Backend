*BookStore-Service
fromJson: aNeoJSon
	^ (self class titled: (aNeoJSon at: #title) editedBy: (aNeoJSon at: #editorial) createdOn: (aNeoJSon at: #year) by: (aNeoJSon at: #author))
		id: (aNeoJSon at: #id);
		yourself