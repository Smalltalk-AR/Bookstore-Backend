Accessing
systemManageEntity: anEntity
	^ self systemManage: anEntity ifFound: [ :system | system ] ifNotFound: [ Error signal: 'Sistema no inicializado' ]