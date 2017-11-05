*BookStore-Service
fromJson: aNeoJSon
	^ (Book
		titled: (aNeoJSon at: #title)
		editedBy: (aNeoJSon at: #editorial)
		createdOn: (aNeoJSon at: #year))
		id: (aNeoJSon at: #id);
		yourself