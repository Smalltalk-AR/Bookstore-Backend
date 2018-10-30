"
A parametrizable configurator for persistence of objects
"
Class {
	#name : #PersistenceConfiguration,
	#superclass : #Object,
	#instVars : [
		'modelCreationBlock',
		'descriptorCreationBlock',
		'tableCreationBlock',
		'describedClass',
		'platform',
		'tableName'
	],
	#category : 'BookStore-Persistence'
}

{ #category : #'Instance Creation' }
PersistenceConfiguration class >> for: aDescribedClass using: aPersistenceSystem creatingClassModelWith: aModelCreationBlock creatingDescriptorModelWith: aDescriptorCreationBlock creatingTableNamed: aTableName 
		with:  aTableCreationBlock [

	^ self new
		initializeFor: aDescribedClass 
		using: aPersistenceSystem
		creatingClassModelWith: aModelCreationBlock
		creatingDescriptorModelWith: aDescriptorCreationBlock
		creatingTableNamed: aTableName 
		with: aTableCreationBlock	
]

{ #category : #Configuration }
PersistenceConfiguration >> configClassModel: aModel [
	modelCreationBlock value: aModel
]

{ #category : #Configuration }
PersistenceConfiguration >> configDescriptor: aDescriptor [
	descriptorCreationBlock value: aDescriptor 
]

{ #category : #Configuration }
PersistenceConfiguration >> configTable: aTable [
	tableCreationBlock value: aTable 
]

{ #category : #Accessing }
PersistenceConfiguration >> describedClass [
	^describedClass
]

{ #category : #Initialization }
PersistenceConfiguration >> initializeFor: aDescribedClass 
		using: aPersistenceSystem
		creatingClassModelWith: aModelCreationBlock
		creatingDescriptorModelWith: aDescriptorCreationBlock
		creatingTableNamed: aTableName 
		with: aTableCreationBlock [	
	
	describedClass :=  aDescribedClass.
	platform := aPersistenceSystem platform.
	tableName := aTableName.
	modelCreationBlock := aModelCreationBlock.
	descriptorCreationBlock := aDescriptorCreationBlock.
	tableCreationBlock := aTableCreationBlock
]

{ #category : #Accessing }
PersistenceConfiguration >> platform [
	^platform
]

{ #category : #Accessing }
PersistenceConfiguration >> tableName [
	^tableName
]
