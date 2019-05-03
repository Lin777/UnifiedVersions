Class {
	#name : #IceTipCommitInfoUnifiedPresenter,
	#superclass : #IceTipCommitInfoPresenter,
	#instVars : [
		'headTabUnifiedContainer',
		'ancestorTabUnifiedContainer',
		'headUnifiedTab',
		'ancestorUnifiedTab'
	],
	#category : #'Tool-Unified-Diff'
}

{ #category : #accessing }
IceTipCommitInfoUnifiedPresenter >> beForCommit [
	headTabContainer := IceTipHistoryDiffFromHead tab: headTab.
	ancestorTabContainer := IceTipHistoryDiffToAncestor tab: ancestorTab.
	headTabUnifiedContainer:= IceTipHistoryDiffFromHead tab: headUnifiedTab. 
	ancestorTabUnifiedContainer := IceTipHistoryDiffToAncestor tab: ancestorUnifiedTab.
]

{ #category : #accessing }
IceTipCommitInfoUnifiedPresenter >> beForMerge [
	headTabContainer := IceTipHistoryDiffToHead tab: headTab.
	ancestorTabContainer := IceTipHistoryDiffToAncestor tab: ancestorTab.
	headTabUnifiedContainer:= IceTipHistoryDiffToHead tab: headUnifiedTab. 
	ancestorTabUnifiedContainer := IceTipHistoryDiffToAncestor tab: ancestorUnifiedTab.
]

{ #category : #initialization }
IceTipCommitInfoUnifiedPresenter >> initializeCommitPanel [
	"This will be initialised in fact on the first refresh"
	commitTabPanel
		addTab: (infoTab := self newInfoTab);
		addTab: (headTab := self newDiffTab 
			label: 'Diff from HEAD';
			whenTabSelected: [ self refreshDiffFromHead ];
			yourself);
		addTab: (ancestorTab := self newDiffTab 
			label: 'Diff from ancestor';
			whenTabSelected: [ self refreshDiffFromAncestor ];
			yourself);
		addTab: (headUnifiedTab := self newDiffTab 
			label: 'Unifed diff from HEAD';
			whenTabSelected: [ self refreshUnifiedDiffFromHead ];
			yourself);
		addTab: (ancestorUnifiedTab := self newDiffTab 
			label: 'Unified diff from ancestor';
			whenTabSelected: [ self refreshUnifiedDiffFromAncestor ];
			yourself).
		
	headTabContainer tab: headTab.
	ancestorTabContainer tab: ancestorTab.
	headTabUnifiedContainer tab: headUnifiedTab. 
	ancestorTabUnifiedContainer tab: ancestorUnifiedTab
]

{ #category : #private }
IceTipCommitInfoUnifiedPresenter >> refreshUnifiedDiffFromAncestor [
	ancestorTabUnifiedContainer updateUnifiedContentsOn: selectedModel
]

{ #category : #private }
IceTipCommitInfoUnifiedPresenter >> refreshUnifiedDiffFromAncestorLabel [
	ancestorTabUnifiedContainer updateLabelOn: selectedModel
]

{ #category : #private }
IceTipCommitInfoUnifiedPresenter >> refreshUnifiedDiffFromHead [
	headTabUnifiedContainer updateUnifiedContentsOn: selectedModel
]

{ #category : #private }
IceTipCommitInfoUnifiedPresenter >> refreshUnifiedDiffFromHeadLabel [
	headTabUnifiedContainer updateLabelOn: selectedModel
]

{ #category : #private }
IceTipCommitInfoUnifiedPresenter >> showInfoTabs [
	"This is just an optimisation to not refresh always. This way it will happen 
	 just if we come from a 'non-selection'"
	(commitTabPanel tabs includes: infoTab) ifFalse: [
		self removeAllCommitPanelTabs.
		commitTabPanel 
			addTab: infoTab;
			addTab: headTabContainer tab;
			addTab: ancestorTabContainer tab ;
			addTab: headTabUnifiedContainer tab;
			addTab: ancestorTabUnifiedContainer tab]. 
	
	self refreshCommitInfo.
	"refresh tab headers"
	self refreshDiffFromHeadLabel.
	self refreshDiffFromAncestorLabel.
	self refreshUnifiedDiffFromHeadLabel .
	self refreshUnifiedDiffFromAncestorLabel .
	"Refresh selected tab contents"
	commitTabPanel selectedTab ifNotNil: #tabSelected.

	
]
