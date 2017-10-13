*BookStore-Service
fromJson: aNeoJSon
	^ (Book
		titled: (aNeoJSon at: #title)
		wroteBy: (aNeoJSon at: #author)
		editedBy: (aNeoJSon at: #editorial)
		createdOn: (aNeoJSon at: #year))
		id: (aNeoJSon at: #id);
		yourself