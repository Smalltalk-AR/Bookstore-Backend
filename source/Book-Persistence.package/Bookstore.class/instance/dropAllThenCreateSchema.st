RDB-Protocol
dropAllThenCreateSchema
	self
		dropAllTables;
		createAllSequences;
		createAllTables