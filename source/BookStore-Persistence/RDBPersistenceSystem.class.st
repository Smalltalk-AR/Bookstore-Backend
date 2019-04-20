"
System that knows how to persist objects
"
Class {
	#name : #RDBPersistenceSystem,
	#superclass : #DescriptorSystem,
	#instVars : [
		'glorpSession',
		'connectionFailed',
		'configurations',
		'login',
		'state',
		'parentBinding'
	],
	#classVars : [
		'Current'
	],
	#category : #'BookStore-Persistence'
}

{ #category : #accessing }
RDBPersistenceSystem class >> new [

	^ self basicNew initialize
]

{ #category : #Query }
RDBPersistenceSystem >> add: anObject [

	self glorpSession inUnitOfWorkDo: [ self glorpSession register: anObject ].
	^anObject
]

{ #category : #Configuration }
RDBPersistenceSystem >> addConfiguration: aConfiguration [
	configurations add: aConfiguration
]

{ #category : #Query }
RDBPersistenceSystem >> allOf: aClass [

	^ self glorpSession read: aClass
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> allTableNames [
	^ configurations collect: #tableName
]

{ #category : #'System protocol' }
RDBPersistenceSystem >> assertIsOrphan [
	AssertionChecker
		refuse: [ parentBinding isDefined ]
		because: 'Cannot register a subsystem already managed by other composite.'
		raising: SystemControlError
]

{ #category : #'System protocol' }
RDBPersistenceSystem >> beChildOf: aCompositeSystem [
	self assertIsOrphan.
	parentBinding := Binding to: aCompositeSystem
]

{ #category : #'System protocol' }
RDBPersistenceSystem >> beOrphan [
	parentBinding := Binding
		undefinedExplainedBy: 'This subsystem is not registered in any composite system'
		raising: SystemControlError
]

{ #category : #Connection }
RDBPersistenceSystem >> connect [
	| accessor |
	accessor := DatabaseAccessor forLogin: login.
	glorpSession := StatelessApplicationGlorpSession forSystem: self.
	glorpSession accessor: accessor.
	connectionFailed := false.
	[ accessor login ] ifError: [ :err | connectionFailed := true ]
]

{ #category : #Configuration }
RDBPersistenceSystem >> constructClassesFromDescriptorMethods [
	allClasses addAll: (configurations collect: #describedClass)
]

{ #category : #Query }
RDBPersistenceSystem >> countOf: aClass [
	^ self glorpSession count: aClass
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> createAllSequences [
	self platform areSequencesExplicitlyCreated
		ifTrue: [ self allSequences
				do: [ :each | 
					self glorpSession accessor
						createSequence: each
						ifError: [ :error | Transcript show: error messageText ] ] ]
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> createAllTables [
	| accessor errorBlock |
	accessor := self glorpSession accessor.
	errorBlock := [ :errorx | Transcript show: errorx messageText ].
	self allTables
		do: [ :each | accessor createTable: each ifError: errorBlock ];
		do: [ :each | accessor createTableIndexes: each ifError: errorBlock ];
		do:
				[ :each | accessor createTableFKConstraints: each ifError: errorBlock ]
]

{ #category : #Connection }
RDBPersistenceSystem >> createLogin [
	^ Login new
		database: platform;
		username: 'root';
		password: '';
		connectString: 'localhost_Bookstore';
		yourself
]

{ #category : #Connection }
RDBPersistenceSystem >> disconnect [
	glorpSession ifNotNil: [ glorpSession accessor logout ]
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> dropAllTables [
	self glorpSession accessor dropTables: self allTables
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> dropAllThenCreateSchema [
	self
		dropAllTables;
		createAllSequences;
		createAllTables
]

{ #category : #Query }
RDBPersistenceSystem >> findOneOf: aClass satisfying: aCondition [
	^ self glorpSession readOneOf: aClass where: aCondition
]

{ #category : #Accessing }
RDBPersistenceSystem >> glorpSession [

	^glorpSession  
	
]

{ #category : #Accessing }
RDBPersistenceSystem >> glorpSession: aGlorpSession [
	glorpSession := aGlorpSession
]

{ #category : #Connection }
RDBPersistenceSystem >> implementedInterfaces [
	^ #(#PersistenceSystemInterface)
]

{ #category : #Connection }
RDBPersistenceSystem >> implements: aSystemInterface [
	^ self implementedInterfaces
		anySatisfy: [ :interfaceKey | 
			aSystemInterface
				= ((Kepler classVarNamed: 'SystemInterfaces') >> interfaceKey) ]
]

{ #category : #Initialization }
RDBPersistenceSystem >> initialize [
	super initialize.
	self beOrphan.
	state := SystemStopped for: self.
	configurations := OrderedCollection new.
	self platform: MySQLPlatform new.
	NativeMySQLDriver beGlorpDefaultDriver.
	login := self createLogin
]

{ #category : #Configuration }
RDBPersistenceSystem >> initializeClassModel: aClassModel [
	configurations
		detect: [ :configuration | configuration describedClass = aClassModel describedClass ]
		ifFound: [ :configuration | configuration configClassModel: aClassModel ]
		ifNone: [  ].
	"Otherwise, just initialize it dynamically, so that old code with only descriptors will still work"
	^ aClassModel
]

{ #category : #Configuration }
RDBPersistenceSystem >> initializeDescriptor: aDescriptor [
	configurations
		detect: [ :configuration | configuration describedClass = aDescriptor describedClass ]
		ifFound: [ :configuration | configuration configDescriptor: aDescriptor ]
		ifNone: [ self noDescriptorInitializerFound: aDescriptor ]
]

{ #category : #Configuration }
RDBPersistenceSystem >> initializeTable: newTable [
	configurations
		detect: [ :configuration | configuration tableName = newTable name ]
		ifFound: [ :configuration | configuration configTable: newTable ]
		ifNone: [ self noTableInitializerFound: newTable ].
	newTable postInitializeIn: self
]

{ #category : #'state tracking' }
RDBPersistenceSystem >> isStarted [

	^ state isStarted
]

{ #category : #'state tracking' }
RDBPersistenceSystem >> isStopped [

	^ state isStopped
]

{ #category : #Initialization }
RDBPersistenceSystem >> login: aLogin [

	login := aLogin
		database: platform;
		yourself
]

{ #category : #'System protocol' }
RDBPersistenceSystem >> parent [

	^ parentBinding content
]

{ #category : #Query }
RDBPersistenceSystem >> remove: anObject [
	self glorpSession inUnitOfWorkDo: [ self glorpSession delete: anObject ].
	^ anObject
]

{ #category : #'state tracking' }
RDBPersistenceSystem >> shutDown [
	state shutDown.
	state := SystemStopped for: self
]

{ #category : #'state tracking' }
RDBPersistenceSystem >> shutDownWhenStarted [
	self disconnect
]

{ #category : #'state tracking' }
RDBPersistenceSystem >> startUp [
	state startUp.
	state := SystemStarted for: self
]

{ #category : #'state tracking' }
RDBPersistenceSystem >> startUpWhenStopped [
	self connect.
	self dropAllThenCreateSchema
]

{ #category : #Query }
RDBPersistenceSystem >> update: anObject with: anotherObject [
	self glorpSession
		inUnitOfWorkDo: [ anObject synchronizeWith: anotherObject.
			self glorpSession register: anObject ].
		^anObject 
]
