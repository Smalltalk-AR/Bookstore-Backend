Actions
allPersons
	^ TeaResponse ok
		body: personManagementSystem allPersons;
		headers: self normalHeaders