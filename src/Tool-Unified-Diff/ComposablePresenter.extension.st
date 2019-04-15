Extension { #name : #ComposablePresenter }

{ #category : #'*Tool-Unified-Diff' }
ComposablePresenter >> newUnifiedDiff [
	^ self instantiate: DiffUnified
]
