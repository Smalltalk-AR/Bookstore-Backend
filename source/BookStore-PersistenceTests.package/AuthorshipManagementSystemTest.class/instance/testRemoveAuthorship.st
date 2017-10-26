tests
testRemoveAuthorship
	| authorship |
	self assert: authorshipManagementSystem authorshipsCount equals: 0.
	authorship := Authorship about: self someBook by: self someAuthor.
	authorshipManagementSystem addAuthorship: authorship.
	self assert: authorshipManagementSystem authorshipsCount equals: 1.
	authorshipManagementSystem removeAuthorshipOfId: authorship id.
	self assert: authorshipManagementSystem authorshipsCount equals: 0