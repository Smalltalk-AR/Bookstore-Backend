Book-Configuration
tableForBOOK: aTable
	aTable createFieldNamed: 'id' type: platform sequence.
	aTable createFieldNamed: 'title' type: platform text.
	aTable createFieldNamed: 'author' type: platform text.
	aTable createFieldNamed: 'editorial' type: platform text.
	aTable createFieldNamed: 'year' type: platform text.
	(aTable fieldNamed: 'id') bePrimaryKey