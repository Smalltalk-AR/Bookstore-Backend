Initialization
initializeUsing: aSpecificPersistenceSystem creatingClassModelWith: aCreationModelBlock creatingDescriptorModelWith: aCreationDescriptorBlock creatingTableWith: aCreationTableBlock
	describedClass := aSpecificPersistenceSystem describedClass.
	tableName := aSpecificPersistenceSystem tableName.
	platform := aSpecificPersistenceSystem platform.
	creatingClassModelBlock := aCreationModelBlock.
	creatingDescriptorModelBlock := aCreationDescriptorBlock.
	creatingTableBlock := aCreationTableBlock