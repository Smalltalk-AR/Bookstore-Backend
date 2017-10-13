DB-Creation
createAllTables
	| accessor errorBlock |
	accessor := self glorpSession accessor.
	errorBlock := [ :errorx | Transcript show: errorx messageText ].
	self allTables
		do: [ :each | accessor createTable: each ifError: errorBlock ];
		do: [ :each | accessor createTableIndexes: each ifError: errorBlock ];
		do: [ :each | accessor createTableFKConstraints: each ifError: errorBlock ]