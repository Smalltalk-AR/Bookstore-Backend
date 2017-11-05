Actions
removeById: anId
	^ TeaResponse ok
		body: (persistentObjectManagementSystem removeById: anId);
		headers: self normalHeaders