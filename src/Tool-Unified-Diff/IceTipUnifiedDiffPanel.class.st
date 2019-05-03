Class {
	#name : #IceTipUnifiedDiffPanel,
	#superclass : #IceTipDiffPanel,
	#category : #'Tool-Unified-Diff'
}

{ #category : #initialization }
IceTipUnifiedDiffPanel >> initializeWidgets [
	changeList := self newIceTable.
	diffPanel := self instantiate: DiffUnified .
	
	self initializeChangeList.
	self initializeDiffPanel.
	
	changeList widget
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self.
		
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ].
	
	self focusOrder 
		add: changeList;
		add: diffPanel
]
