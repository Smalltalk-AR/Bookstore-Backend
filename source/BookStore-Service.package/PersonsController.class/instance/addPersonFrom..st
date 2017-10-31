Actions
addPersonFrom: jsonStringPerson
	| person result |
	person := Person fromJson: (NeoJSONObject fromString: jsonStringPerson).
	result := personManagementSystem addPerson: person.
	^ TeaResponse ok
		body: result;
		headers: self normalHeaders