!classDefinition: #Distance category: #'Distance-Solution'!
Magnitude subclass: #Distance
	instanceVariableNames: 'amount unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:47:08'!
* aNumber
	^Distance new initializeWith: amount * aNumber of: unit! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:46:09'!
+ aDistance
	|aDistanceConverted|
	aDistanceConverted := aDistance convertTo: unit.
	^Distance new initializeWith: amount + aDistanceConverted amount of: unit! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:46:31'!
- aDistance
	|aDistanceConverted|
	aDistanceConverted := aDistance convertTo: unit.
	^Distance new initializeWith: amount - aDistanceConverted amount of: unit! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:47:17'!
/ aNumber
	^Distance new initializeWith: amount / aNumber of: unit! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:50:15'!
< aDistance
	|aDistanceConverted|
	aDistanceConverted := aDistance convertTo: unit.	
	^amount < aDistanceConverted amount! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 22:46:47'!
= aDistance
	self class = aDistance class 
		ifTrue: [ ^self amount * (self unit factor) = ( (aDistance amount) * (aDistance unit factor) ) ]
		ifFalse: [ ^false ]! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:02:23'!
amount
	^amount! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:38:26'!
convertTo: aUnit
	|unitAmount|
	unitAmount := amount * unit factor / aUnit factor.
	^Distance new initializeWith: unitAmount of: aUnit ! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:43:33'!
hash
	^(amount * unit factor) hash! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:34:59'!
initializeWith: anAmount of: aUnit
	amount := anAmount.
	unit := aUnit.! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:48:11'!
negated
	^Distance new initializeWith: amount * -1 of: unit! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:25:40'!
printString
	|humanReadable|
	humanReadable := amount printString, ' ', unit metric.
	amount > 1 
		ifTrue: [ ^humanReadable, 's' ]
		ifFalse: [ ^humanReadable ]! !

!Distance methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:02:32'!
unit
	^unit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Distance class' category: #'Distance-Solution'!
Distance class
	instanceVariableNames: ''!

!Distance class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:34:28'!
initializeWith: anAmount of: aUnit
	^self new initializeWith: anAmount of: aUnit! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:43:38'!
minusOneMeter
	^Distance initializeWith: -1 of: Unit meter! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:44:14'!
oneCentimeter
	^Distance initializeWith: 1 of: Unit centimeter! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:44:34'!
oneHundredCentimeters
	^Distance initializeWith: 100 of: Unit centimeter! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:43:02'!
oneMeter
	^Distance initializeWith: 1 of: Unit meter! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:12:10'!
twoHundredCentimeters
	^Distance initializeWith: 200 of: Unit centimeter! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:45:05'!
twoMeters
	^Distance initializeWith: 2 of: Unit meter! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:45:14'!
zeroMeters
	^Distance initializeWith: 0 of: Unit meter! !


!classDefinition: #Unit category: #'Distance-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'metric factor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:35:11'!
= aUnit
	self class = aUnit class
		ifTrue: [ ^factor = aUnit factor and: [ ^metric = aUnit metric ] ]
		ifFalse: [ ^false]! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:03:18'!
factor
	^factor! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/5/2017 20:20:02'!
initializeWith: aMetric factor: aFactor
	metric := aMetric.
	factor := aFactor.! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:03:04'!
metric
	^metric! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:16:51'!
printString
	^metric! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Unit class' category: #'Distance-Solution'!
Unit class
	instanceVariableNames: ''!

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:10:51'!
centimeter
	^ self new initializeWith: 'centimeter' factor: 10! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:20:13'!
decameter
	^ self new initializeWith: 'decameter' factor: 10000! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:19:30'!
decimeter
	^ self new initializeWith: 'decimeter' factor: 100! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:20:03'!
hectometer
	^ self new initializeWith: 'hectometer' factor: 100000! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:20:29'!
kilometer
	^ self new initializeWith: 'kilometer' factor: 1000000! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:10:18'!
meter
	^ self new initializeWith: 'meter' factor: 1000! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 19:10:44'!
milimeter
	^ self new initializeWith: 'milimeter' factor: 1! !
