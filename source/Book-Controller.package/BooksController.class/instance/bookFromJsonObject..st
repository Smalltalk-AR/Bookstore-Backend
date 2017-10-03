Parsing
bookFromJsonObject: jsonBookObject
	^ (Book
		titled: (jsonBookObject at: #title)
		wroteBy: (jsonBookObject at: #author)
		editedBy: (jsonBookObject at: #editorial)
		createdOn: (jsonBookObject at: #year))
		id: (jsonBookObject at: #id);
		yourself