Instance Creation
titled: aTitle wroteBy: anAuthor editedBy: anEditorial createdOn: aYear
	self assertNotNil: aTitle.
	self assertNotNil: anAuthor.
	self assertNotNil: anEditorial.
	self assertNotNil: aYear.
	^ self new
		initializeTitled: aTitle
		wroteBy: anAuthor
		editedBy: anEditorial
		createdOn: aYear