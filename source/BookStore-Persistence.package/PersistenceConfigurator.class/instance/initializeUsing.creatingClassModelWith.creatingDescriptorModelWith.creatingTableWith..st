Initialization
initializeUsing: aPersistenceSystem creatingClassModelWith: aModelCreationBlock creatingDescriptorModelWith: aDescriptorCreationBlock creatingTableWith: aTableCreationBlock
	persistenceSystem := aPersistenceSystem.
	modelCreationBlock := aModelCreationBlock.
	descriptorCreationBlock := aDescriptorCreationBlock.
	tableCreationBlock := aTableCreationBlock