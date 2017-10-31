Actions
removePersonOfId: anId
	^ TeaResponse ok
		body: (personManagementSystem removePersonWithId: anId);
		headers: self normalHeaders