Actions
updateObjectWithId: anId withObjectBasedOn: aJSONString
	| jsonObject persistentObject result |
	jsonObject := NeoJSONObject fromString: aJSONString.
	persistentObject := persistedClass fromJson: jsonObject.
	result := persistentObjectManagementSystem updateById: anId with: persistentObject.
	^ TeaResponse ok
		body: result;
		headers: self normalHeaders