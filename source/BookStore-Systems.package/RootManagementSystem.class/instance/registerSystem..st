Configuring
registerSystem: aSystem
	self
		systemManage: aSystem describedClass
		ifFound: [ :system | Error signal: 'Error: Ya hay un sistema instalado para la entidad' ]
		ifNotFound: [ subsystems add: aSystem ]