Actions
getAll
	^ TeaResponse ok
		body: persistentObjectManagementSystem getAll;
		headers: self normalHeaders