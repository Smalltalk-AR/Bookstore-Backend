Managing
removeAuthorshipOfId: anId
	| authorship |
	authorship := self authorshipOfId: anId.
	^ self removeAuthorship: authorship