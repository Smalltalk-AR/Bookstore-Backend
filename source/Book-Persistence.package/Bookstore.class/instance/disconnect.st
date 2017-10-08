RDB-Protocol
disconnect
	self glorpSession ifNotNil: [ self glorpSession accessor logout ]
