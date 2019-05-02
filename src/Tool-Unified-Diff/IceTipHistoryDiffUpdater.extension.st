Extension { #name : #IceTipHistoryDiffUpdater }

{ #category : #'*Tool-Unified-Diff' }
IceTipHistoryDiffUpdater >> newUnifiedDiffPanelFor: aDiffModel [
	^ IceTipUnifiedDiffPanel on: aDiffModel
]

{ #category : #'*Tool-Unified-Diff' }
IceTipHistoryDiffUpdater >> updateUnifiedContentsOn: aCommitModel [
	aCommitModel ifNil: [ ^ self ].
	self tab contents: (self newUnifiedDiffPanelFor: (self diffFor: aCommitModel)) buildWithSpec
]
