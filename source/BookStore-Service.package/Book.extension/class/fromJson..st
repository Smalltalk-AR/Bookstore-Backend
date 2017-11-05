*BookStore-Service
fromJson: aNeoJSon
	^ (Book
		titled: (aNeoJSon at: #title)
		editedBy: (aNeoJSon at: #editorial)
		createdOn: (aNeoJSon at: #releaseYear))
		id: (aNeoJSon at: #id);
		yourself