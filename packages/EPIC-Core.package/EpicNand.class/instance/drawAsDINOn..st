simulation
drawAsDINOn:aCanvas
	| p arcBox |
	arcBox := Rectangle 
				center: self gateBoxDIN leftCenter
				extent: self gateBoxDIN extent * (2@1). 
	p := EpicPolygon new.
	p 
		addPoint: self gateBoxDIN bottomLeft;
		addPoint: self gateBoxDIN topLeft;
		addArc: arcBox clippedBy: self gateBoxDIN.
	
	self drawPolygon: p on: aCanvas.
	aCanvas 
		fillOval: self notDotDIN color: Color black;
		frameOval:  self notDotDIN color: Color black.
	
	self inputPorts do: [:eachPort |
		aCanvas 
			line: eachPort center 
			to: (self gateBoxDIN left) @ (eachPort center y)
			color: Color black
	].
	
	aCanvas 
		line: self outputPorts first center 
		to: (self notDotDIN right) @ (self outputPorts first center y)
		color: Color black