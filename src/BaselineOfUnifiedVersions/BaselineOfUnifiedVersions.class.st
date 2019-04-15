Class {
	#name : #BaselineOfUnifiedVersions,
	#superclass : #BaselineOf,
	#classVars : [
		'Initialized'
	],
	#category : #BaselineOfUnifiedVersions
}

{ #category : #baselines }
BaselineOfUnifiedVersions >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'Tool-Unified-Diff']
]
