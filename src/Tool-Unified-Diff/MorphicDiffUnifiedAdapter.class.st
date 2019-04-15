Class {
	#name : #MorphicDiffUnifiedAdapter,
	#superclass : #MorphicDiffAdapter,
	#category : #'Tool-Unified-Diff-Spec-MorphicAdapters-Base'
}

{ #category : #factory }
MorphicDiffUnifiedAdapter >> buildWidget [
	^ UnifiedDiffMorph new  
		on: self ;
		from: self leftText to: self rightText contextClass: self contextClass;
		 hResizing:	#spaceFill;
		vResizing: #spaceFill;
		setBalloonText: self help;
		showOptions: self showOptions;
		leftLabel: self leftLabel rightLabel: self rightLabel;
		showOnlyDestination: true;
		yourself
]
