accessing
current
	^ Current ifNil: [ self newInstance ] ifNotNil: [ :system | system ]