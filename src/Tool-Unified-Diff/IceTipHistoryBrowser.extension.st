Extension { #name : #IceTipHistoryBrowser }

{ #category : #'*Tool-Unified-Diff' }
IceTipHistoryBrowser >> initializeWidgets [
	super initializeWidgets.	
	commitList := self newIceTable.
	commitInfoTabs := self instantiate: IceTipCommitInfoUnifiedPresenter.
	
	self initializeCommitList.
	
	commitList widget 
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self.
	
	self focusOrder 
		add: commitList;
		add: commitInfoTabs.
		
	self refresh
]
