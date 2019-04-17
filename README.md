# UnifiedVersions

## Installation 


```Smalltalk
Metacello new
 baseline:'UnifiedVersions';
 repository: 'github://Lin777/UnifiedVersions:master/src';
 load.
 ```
 
 ## Example

```Smalltalk
UnifiedDiffMorph from: '(Array
	with: ''delete''
	with: [ :award | self deleteAward: award.
				self updateStateTab: self tabName. ]
	with: [ :award | award id , ''-delete'' ]
	with: ''Delete''
	with: ''return confirm(''Are you sure you want to delete this item?'');'')' to: '(Array
	with: ''delete''
	with: [ :award | self deleteAward: award.
				self updateStateTab: self tabName. ]
	with: [ :award | award id , ''-delete'' ]
	with: ''Delete''
	with: ''return confirm(''Are you sure you want to delete this item?'');''
	with: false)'
```

## Result

![An image](unified.png) <!-- .element height="50%" width="50%" -->
