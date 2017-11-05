accessing
stop

	Current
		ifNil: [ "Do nothing" ]
		ifNotNil: [ :system | 
			system disconnect.
			Current := nil ]