accessing
stop
	self current
		ifNil: [ "Do nothing" ]
		ifNotNil: [ :system | 
			system disconnect.
			Current := nil ]