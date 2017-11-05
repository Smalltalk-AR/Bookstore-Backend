Accessing
current

	^ Current ifNil: [ self newInstance ] ifNotNil: [ :system | system ]