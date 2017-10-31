Actions
updatePersonOfId: anId withPersonFrom: jsonStringPerson
	| person result |
	person := Person fromJson: (NeoJSONObject fromString: jsonStringPerson).
	result := personManagementSystem updatePersonOfId: anId with: person.
	^ TeaResponse ok
		body: result;
		headers: self normalHeaders