drawing
drawAsANSIOn: aCanvas

	| p xyratio|
	p := EpicPolygon new.
	xyratio := 0.
	p
		addPoint: self gateBoxANSI topRight;
		addPoint: self gateBoxANSI bottomRight;
		addPoint: self gateBoxANSI bottomLeft - (0@(self gateBoxANSI extent y / 3));
		addPoint: self gateBoxANSI bottomLeft - (0@(self gateBoxANSI extent y  * 2 / 3)).
	
	self drawPolygon: p on: aCanvas.

	self outputPorts do: [:eachPort |
		aCanvas 
			line: eachPort center 
			to: (self gateBoxANSI right) @ (eachPort center y)
			color: Color black].
	
	self 
		drawBodyOn: aCanvas;
		connectOutputPortsOn: aCanvas;
		connectSelectorPortsOn: aCanvas.
	aCanvas 
		line: self inputPorts first center 
		to: (self gateBoxANSI left) @ (self inputPorts first center y)
		color: Color black
