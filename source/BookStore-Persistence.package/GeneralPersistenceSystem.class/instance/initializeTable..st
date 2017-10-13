Configuration
initializeTable: newTable
	configurations
		detect: [ :configuration | configuration tableName = newTable name ]
		ifFound: [ :configuration | configuration configTable: newTable ]
		ifNone: [ self noTableInitializerFound: newTable ].
	newTable postInitializeIn: self