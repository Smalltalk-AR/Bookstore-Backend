Instance Creation
titled: aTitle editedBy: anEditorial createdOn: aYear by: anAuthor
	self
		assertNotEmpty: aTitle;
		assertNotEmpty: anEditorial;
		assertNotNil: aYear.
	^ self new
		initializeTitled: aTitle
		editedBy: anEditorial
		createdOn: aYear
		by: anAuthor