menu creation
createFileMenu
	^ (EpicMenu new)
		add: 'New'
			target: self editorBox navigationBar
			selector: #createNewTab;
		addLine;
		add: 'Open...'
			target: self 
			selector: #open;
		add: 'Save as...'
			target: self
			selector: #saveAs;
		add: 'Export...'
			target: self
			selector: #export;
		addLine;
		add: 'Close'
			target: self
			selector: #close;
		yourself