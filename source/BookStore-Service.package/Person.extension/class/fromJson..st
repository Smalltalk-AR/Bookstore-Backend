*BookStore-Service
fromJson: aNeoJSon

	^ (self
		named: (aNeoJSon at: #firstName)
		lastName: (aNeoJSon at: #lastName)
		bornIn: (aNeoJSon at: #country))
		books: (aNeoJSon at:#books);
		id: (aNeoJSon at: #id);
		yourself