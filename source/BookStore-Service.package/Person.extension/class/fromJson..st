*BookStore-Service
fromJson: aNeoJSon
	^ (self
		named: (aNeoJSon at: #firstName)
		lastName: (aNeoJSon at: #lastName)
		bornIn: (aNeoJSon at: #country))
		id: (aNeoJSon at: #id);
		yourself