Class {
	#name : #DiffUnifiedChangeRecordConverter,
	#superclass : #AbstractMethodReferenceConverter,
	#category : #'Tool-Unified-Diff-Spec-Tools-VersionBrowser'
}

{ #category : #private }
DiffUnifiedChangeRecordConverter >> internalGetText [
	| priorSource |
	priorSource := (self priorVersionOfAMethod: method) ifNotNil: [ :m | m sourceCode ] ifNil: [ '' ].
	^ Array with: priorSource with: method sourceCode
]

{ #category : #private }
DiffUnifiedChangeRecordConverter >> priorVersionOfAMethod: aChangeRecord [
	| index |
	index := referencesList identityIndexOf: aChangeRecord .
	^ referencesList at: index+1 ifAbsent: [ nil ]
]
