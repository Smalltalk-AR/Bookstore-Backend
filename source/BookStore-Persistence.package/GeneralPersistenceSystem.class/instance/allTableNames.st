DB-Creation
allTableNames
	^ configurations collect: [ :configuration | configuration tableName ]