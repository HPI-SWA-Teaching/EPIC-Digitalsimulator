initialization
initialize
	super initialize.
	self 	
		layoutPolicy: ProportionalLayout new;
		scrollPane: ScrollPane new.
	self
		addMorph: self scrollPane fullFrame: self panelFrame;
		createTabBar