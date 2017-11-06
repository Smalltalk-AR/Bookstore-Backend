Test
testAccessing
	| book |
	book := Book titled: 'title' editedBy: 'editorial' createdOn: 2001.
	self
		assert: book title equals: 'title';
		assert: book editorial equals: 'editorial';
		assert: book releaseYear equals: 2001