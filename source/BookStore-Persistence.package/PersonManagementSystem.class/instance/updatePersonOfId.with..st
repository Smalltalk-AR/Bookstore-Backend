Updating
updatePersonOfId: anId with: updatedPerson
	^ generalPersistenceSystem update: (self findById: anId) with: updatedPerson