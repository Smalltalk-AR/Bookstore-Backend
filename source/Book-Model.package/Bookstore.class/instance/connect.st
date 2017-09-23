RDB-Protocol
connect
	| accessor |
	accessor := DatabaseAccessor forLogin: self createLogin.
	self glorpSession: (GlorpSession forSystem: self).
	self glorpSession accessor: accessor.
	self connectionFailed: false.
	[ accessor login ] ifError: [ :err | self connectionFailed: true ]
