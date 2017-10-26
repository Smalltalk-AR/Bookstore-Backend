tests
testAddAuthorship
	| authorship authorshipFromDatabase |
	self assert: authorshipManagementSystem  authorshipsCount equals: 0.
	authorship := Authorship about: self someBook by: self someAuthor.
	authorshipManagementSystem addAuthorship: authorship.
	self assert: authorshipManagementSystem authorshipsCount equals: 1.
	authorshipFromDatabase := authorshipManagementSystem allAuthorships anyOne.
	self assert: authorshipFromDatabase equals: authorship