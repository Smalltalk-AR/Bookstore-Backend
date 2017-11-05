Actions
addBasedOn: aJSONString
	| jsonObject persistentObject result |
	jsonObject := NeoJSONObject fromString: aJSONString.
	persistentObject := persistedClass fromJson: jsonObject.
	result := persistentObjectManagementSystem add: persistentObject.
	^ TeaResponse ok
		body: result;
		headers: self normalHeaders