Instance Creation
named: firstName lastName: aLastName bornIn: aCountry 
self
		assertNotEmpty: firstName;
		assertNotEmpty: aLastName.
	^ self new initializeNamed: firstName lastName: aLastName bornIn: aCountry