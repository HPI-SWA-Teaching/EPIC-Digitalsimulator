package search
allRequiredPackages

	| packages |
	packages := Set new.
	self allRequiredClasses do: [ :eachClass |
		packages add: eachClass category].
	^ packages