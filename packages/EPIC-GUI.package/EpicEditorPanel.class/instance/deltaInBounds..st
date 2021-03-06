event handling
deltaInBounds: aDelta
	| lowDelta maxDelta delta mergeRect |
	mergeRect := Rectangle merging:(self selectedObjects collect: [:eachComponent|  
																		eachComponent bounds]).
	delta := aDelta.	
	maxDelta := (self bounds) deltaToEnsureInOrCentered: mergeRect extra: 1.
	lowDelta := (self bounds) deltaToEnsureInOrCentered: mergeRect extra: 0.	
	(delta x > maxDelta x)ifTrue: [ delta := maxDelta x @ delta y].
	(delta y > maxDelta y)ifTrue: [ delta := delta x @ maxDelta y].
	(delta x <= lowDelta x)ifTrue: [ delta := 1 @ delta y].
	(delta y <= lowDelta y)ifTrue: [ delta := delta x @ 1].
	^delta