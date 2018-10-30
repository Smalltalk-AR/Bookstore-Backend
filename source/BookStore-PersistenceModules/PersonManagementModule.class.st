"
System to manage persons
"
Class {
	#name : #PersonManagementModule,
	#superclass : #PersistenceModule,
	#category : 'BookStore-PersistenceModules'
}

{ #category : #Configuring }
PersonManagementModule >> creationDescriptorBlock [

	^ [ :aDescriptor | 
	| table |
	table := self persistenceSystem tableNamed: self tableName.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping)
		from: #firstName
		to: (table fieldNamed: 'firstName').
	(aDescriptor newMapping: DirectMapping)
		from: #lastName
		to: (table fieldNamed: 'lastName').
	(aDescriptor newMapping: DirectMapping) from: #country to: (table fieldNamed: 'country').
	 ]
]

{ #category : #Configuring }
PersonManagementModule >> creationModelBlock [

	^ [ :aModel | 
	aModel
		newAttributeNamed: #id;
		newAttributeNamed: #firstName;
		newAttributeNamed: #lastName;
		newAttributeNamed: #country]
]

{ #category : #Configuring }
PersonManagementModule >> creationTableBlock [

	^ [ :aTable | 
	aTable createFieldNamed: 'id' type: self persistenceSystem platform sequence.
	aTable createFieldNamed: 'firstName' type: self persistenceSystem platform text.
	aTable createFieldNamed: 'lastName' type: self persistenceSystem platform text.
	aTable createFieldNamed: 'country' type: self persistenceSystem platform text.
	(aTable fieldNamed: 'id') bePrimaryKey ]
]

{ #category : #Accessing }
PersonManagementModule >> describedClass [
	^ Person
]

{ #category : #Accessing }
PersonManagementModule >> name [

	^#Personas
]

{ #category : #Accessing }
PersonManagementModule >> registerPersistence [

	(PersistenceConfigurationRegistrationAgent toRegisterIn: self persistenceSystem)
		registerConfigurationFor: self
]

{ #category : #Accessing }
PersonManagementModule >> tableName [
	^ 'PERSON'
]
