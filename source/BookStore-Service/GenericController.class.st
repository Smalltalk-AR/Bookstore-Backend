"
Controller of the books application.Interacts with the model and the Interface
"
Class {
	#name : #GenericController,
	#superclass : #Object,
	#instVars : [
		'modelClass',
		'persistenceSystem'
	],
	#category : 'BookStore-Service'
}

{ #category : #'Instance Creation' }
GenericController class >> workingOn: aRootSystem managing: aClass [
	^ self new initializeWorkingOn: aRootSystem managing: aClass
]

{ #category : #Actions }
GenericController >> addBasedOn: aJSONString [
	^ TeaResponse ok
		body: (self addObjectBuiltFrom: aJSONString);
		headers: self normalHeaders
]

{ #category : #Actions }
GenericController >> addObjectBuiltFrom: aJSONString [
	| persistentObject jsonObject |
	jsonObject := NeoJSONObject fromString: aJSONString.
	persistentObject := modelClass fromJson: jsonObject.
	^ self persistenceSystem add: persistentObject
]

{ #category : #Actions }
GenericController >> getAll [
	^ TeaResponse ok
		body: (self persistenceSystem allOf: modelClass);
		headers: self normalHeaders
]

{ #category : #Actions }
GenericController >> getById: anId [

	^ self persistenceSystem findOneOf: modelClass satisfying: [ :each | each id = anId ]
]

{ #category : #initialization }
GenericController >> initializeWorkingOn: aRootSystem managing: aModelClass [

	persistenceSystem := aRootSystem systemImplementing: #PersistenceSystemInterface.
	modelClass := aModelClass
]

{ #category : #Defaults }
GenericController >> normalHeaders [

	^{('Access-Control-Allow-Origin' -> '*')}
]

{ #category : #Actions }
GenericController >> options [
	^ TeaResponse ok headers: self optionsHeaders
]

{ #category : #Defaults }
GenericController >> optionsHeaders [

	^ {('Content-Type' -> 'application/json').
	('Accept' -> 'application/json').
	('Access-Control-Allow-Methods' -> 'POST, GET, OPTIONS, DELETE, PUT').
	('Access-Control-Allow-Origin' -> '*').
	('Access-Control-Allow-Headers'
		->
			'X-Requested-With, Content-Type, Origin, Authorization, Accept, Client-Security-Token, Accept-Encoding')}
]

{ #category : #initialization }
GenericController >> persistenceSystem [
	
	^persistenceSystem 
]

{ #category : #Actions }
GenericController >> removeById: anId [

	^ TeaResponse ok
		body: (self persistenceSystem remove: (self getById: anId));
		headers: self normalHeaders
]

{ #category : #'private - actions' }
GenericController >> updateObjectWith: anId withObjectBuiltFrom: aJSONString [

	| jsonObject persistentObject |
	
	jsonObject := NeoJSONObject fromString: aJSONString.
	persistentObject := modelClass fromJson: jsonObject.
	^ self persistenceSystem update: (self getById: anId) with: persistentObject
]

{ #category : #Actions }
GenericController >> updateObjectWithId: anId withObjectBasedOn: aJSONString [

	^ TeaResponse ok
		body: (self updateObjectWith: anId withObjectBuiltFrom: aJSONString);
		headers: self normalHeaders
]
