"
Services of the books. Handle requests from frontend and interacts with Controller
"
Class {
	#name : #GenericService,
	#superclass : #Object,
	#instVars : [
		'server',
		'controller',
		'basePath',
		'apiPath'
	],
	#category : 'BookStore-Service'
}

{ #category : #'Instance Creation' }
GenericService class >> deployingOn: aTeapotServer at: aBasePath withApiPath: anApiPath delegatingTo: aController [
	^ self new initializeDeployingOn: aTeapotServer at: aBasePath withApiPath: anApiPath delegatingTo: aController
]

{ #category : #acccessing }
GenericService >> fullPath [
	^ basePath , '/' , apiPath
]

{ #category : #initialization }
GenericService >> initializeAllObjectsService [
	server GET: (self fullPath) -> [ :req | controller getAll ]
]

{ #category : #initialization }
GenericService >> initializeCreateObjectService [
	server POST: self fullPath -> [ :req | controller addBasedOn: req contents ]
]

{ #category : #initialization }
GenericService >> initializeDeleteObjectService [
	server DELETE: (self fullPath,'/<id>') -> [ :req | controller removeById: (req at: #id) ]
]

{ #category : #initialization }
GenericService >> initializeDeployingOn: aTeapotServer at: aBasePath withApiPath: anApiPath delegatingTo: aController [
	basePath := aBasePath.
	apiPath := anApiPath.
	server := aTeapotServer.
	controller := aController.
	self
		initializeCreateObjectService;
		initializeDeleteObjectService;
		initializeUpdateObjectService;
		initializeAllObjectsService;
		initializeOptions
]

{ #category : #initialization }
GenericService >> initializeOptions [
	server
		OPTIONS: (self fullPath) -> controller options;
		OPTIONS: (self fullPath , '/<id>') -> controller options
]

{ #category : #initialization }
GenericService >> initializeUpdateObjectService [
	server
		PUT: (self fullPath , '/<id>') -> [ :req | controller updateObjectWithId: (req at: #id) withObjectBasedOn: req contents ]
]
