graph handling
refreshGraphWith: aBoolean
	self graph addLast: aBoolean.
	self graph: (self graph copyFrom: 2 to: self graph size).