serialization testing
testCombineAndReopenCircuit
	| xml circuit |
	self testCombining.
	xml := self xmlForContentsOf: self editorPanel circuit subComponents first.
	self window open: (FileStream fileNamed: self temporaryCircuitFilePath).
	circuit := self editorPanel circuit asXMLDocument asString.
	
	self assert: [ circuit = xml ]