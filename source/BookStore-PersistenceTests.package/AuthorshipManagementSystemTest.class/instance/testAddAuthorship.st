tests
testAddAuthorship
	| authorship |
	self assert: authorshipManagementSystem getAll isEmpty.
	authorship := Authorship about: self someBook by: self someAuthor.
	authorshipManagementSystem add: authorship.
	self assertCollection: authorshipManagementSystem getAll hasSameElements: (Array with: authorship)