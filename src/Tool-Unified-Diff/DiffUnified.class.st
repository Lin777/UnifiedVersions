Class {
	#name : #DiffUnified,
	#superclass : #DiffPresenter,
	#category : #'Tool-Unified-Diff-Spec-Core-Widgets'
}

{ #category : #specs }
DiffUnified class >> adapterName [

	^ #MorphicDiffUnifiedAdapter
]

{ #category : #specs }
DiffUnified class >> defaultSpec [
	<spec>
	
	^ #(MorphicDiffUnifiedAdapter
		adapt: #(model))
]
