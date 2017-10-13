accessing
start
	self current ifNil: [ self newInstance ] ifNotNil: [ "Do nothing" ].
	^self current connect.