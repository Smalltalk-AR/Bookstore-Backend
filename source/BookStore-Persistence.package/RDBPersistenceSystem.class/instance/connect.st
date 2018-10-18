Connection
connect

	| accessor |
	accessor := DatabaseAccessor forLogin: login.
	glorpSession := GlorpSession forSystem: self.
	glorpSession accessor: accessor.
	self connectionFailed: false.
	[ accessor login ] ifError: [ :err | self connectionFailed: true ]