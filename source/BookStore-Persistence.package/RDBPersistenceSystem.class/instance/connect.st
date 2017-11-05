Connection
connect
	| accessor |
	accessor := DatabaseAccessor forLogin: self createLogin.
	glorpSession := GlorpSession forSystem: self.
	glorpSession accessor: accessor.
	self connectionFailed: false.
	[ accessor login ] ifError: [ :err | self connectionFailed: true ]