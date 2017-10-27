Accessing
systemManage: anEntity ifFound: foundBlock ifNotFound: noneBlock
	^ self subsystems detect: [ :system | system describedClass = anEntity ] ifFound: foundBlock ifNone: noneBlock