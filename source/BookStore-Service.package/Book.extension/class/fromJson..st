*BookStore-Service
fromJson: aNeoJSon
	^ (self
		titled: (aNeoJSon at: #title)
		editedBy: (aNeoJSon at: #editorial)
		createdOn: (aNeoJSon at: #releaseYear)
		by:(aNeoJSon at: #author) )
		id: (aNeoJSon at: #id);
		yourself