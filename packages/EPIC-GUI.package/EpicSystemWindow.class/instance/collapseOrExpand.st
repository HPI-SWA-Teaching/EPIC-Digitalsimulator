resize/collapse
collapseOrExpand
	"Mostly copied from SystemWindow.
	Collapse or expand the window, depending on existing state"
	| cf |
	isCollapsed
		ifTrue: 
			["Expand -- restore panes to morphics structure"
			isCollapsed := false.
			self activate.  "Bring to frint first"
			Preferences collapseWindowsInPlace
				ifTrue: 
					[fullFrame := fullFrame align: fullFrame topLeft with: self getBoundsWithFlex topLeft]
				ifFalse:
					[collapsedFrame := self getBoundsWithFlex].
			collapseBox ifNotNil: [collapseBox setBalloonText: 'collapse this window' translated].
			self setBoundsWithFlex: fullFrame.
			paneMorphs reverseDo: 
					[:m |  self addMorph: m unlock.
					self world startSteppingSubmorphsOf: m.
					m collapseRestore].
			self addPaneSplitters]
		ifFalse: 
			["Collapse -- remove panes from morphics structure"
			isCollapsed := true.
			fullFrame := self getBoundsWithFlex.
			"First save latest fullFrame"
			paneMorphs do: [:m | m collapseDelete; releaseCachedState].
			self removePaneSplitters.
			self removeCornerGrips.
			model modelSleep.
			cf := self getCollapsedFrame.
			(collapsedFrame isNil and: [Preferences collapseWindowsInPlace not]) ifTrue:
				[collapsedFrame := cf].
			self setBoundsWithFlex: cf.
			collapseBox ifNotNil: [collapseBox setBalloonText: 'expand this window' translated ].
			expandBox ifNotNil: [expandBox setBalloonText: 'expand this window' translated ].
			self sendToBack].
	self layoutChanged