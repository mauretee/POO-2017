!classDefinition: #Measure category: #'Measure-Solution'!
Magnitude subclass: #Measure
	instanceVariableNames: 'amount unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:31:25'!
* aNumber
	^Measure new initializeWith: amount * aNumber of: unit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:21:54'!
+ aMeasure
	aMeasure unit base = unit base
		ifTrue: [ ^self addOfSameBase: aMeasure ]
		ifFalse: [ ^MeasureSum with: (Array withAll: #( self aMeasure )) ]! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:30:52'!
- aMeasure
	|baseAmount amountToAdd |
	baseAmount := aMeasure unit convertToBase value: (aMeasure amount).
	amountToAdd := unit convertFromBase value: baseAmount.
	^Measure new initializeWith: (amount - amountToAdd) of: unit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:31:36'!
/ aNumber
	^Measure new initializeWith: amount / aNumber of: unit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:39:55'!
< aMeasure
	|thisBaseAmount anotherBaseAmount|
	anotherBaseAmount := aMeasure unit convertToBase value: (aMeasure amount).
	thisBaseAmount := unit convertToBase value: amount.	
	^ thisBaseAmount < anotherBaseAmount! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:13:17'!
= aMeasure
	self class = aMeasure class 
		ifTrue: [ ^self unit base = aMeasure unit base and: [(self unit convertToBase value: amount) = (aMeasure unit convertToBase value: (aMeasure amount)) ] ]
		ifFalse: [ ^false ]! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:08:11'!
addOfSameBase: aMeasure
	|baseAmount amountToAdd |
	baseAmount := aMeasure unit convertToBase value: (aMeasure amount).
	amountToAdd := unit convertFromBase value: baseAmount.
	^Measure new initializeWith: (amount + amountToAdd) of: unit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:18:46'!
amount
	^amount! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:44:09'!
convertTo: aUnit
	aUnit base = unit base
		ifTrue: [ ^Measure initializeWith: (aUnit convertFromBase value: (unit convertToBase value: amount)) of: aUnit ]
		ifFalse: [ ^self error: 'Cant convert to a unit with different base.' ]! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:18:46'!
hash
	^(amount * unit factor) hash! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:18:46'!
initializeWith: anAmount of: aUnit
	amount := anAmount.
	unit := aUnit.! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:18:46'!
negated
	^Distance new initializeWith: amount * -1 of: unit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:18:46'!
printString
	|humanReadable|
	humanReadable := amount printString, ' ', unit metric.
	amount > 1 
		ifTrue: [ ^humanReadable, 's' ]
		ifFalse: [ ^humanReadable ]! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:27:11'!
tryAddOfSameBase: aMeasure
	aMeasure unit base = unit base
		ifTrue: [ ^self addOfSameBase: aMeasure ]
		ifFalse: [ ^self ]! !

!Measure methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:18:46'!
unit
	^unit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Measure class' category: #'Measure-Solution'!
Measure class
	instanceVariableNames: ''!

!Measure class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:18:46'!
initializeWith: anAmount of: aUnit
	^self new initializeWith: anAmount of: aUnit! !


!classDefinition: #MeasureSum category: #'Measure-Solution'!
Magnitude subclass: #MeasureSum
	instanceVariableNames: 'addends'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasureSum methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:26:00'!
+ aMeasure
	aMeasure class = Measure
		ifTrue: [ ^MeasureSum with: (addends collect: [ :each | each tryAddWithSameBase: aMeasure ]) ]
		ifFalse: [ ^self error: 'Only Measures can be added to a MeasureSum.' ]! !

!MeasureSum methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:10:27'!
with: someAddends
	addends := someAddends.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MeasureSum class' category: #'Measure-Solution'!
MeasureSum class
	instanceVariableNames: ''!

!MeasureSum class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:10:02'!
initializeWith: someAddends
	^self new with: someAddends! !


!classDefinition: #MeasureTest category: #'Measure-Solution'!
TestCase subclass: #MeasureTest
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:07:45'!
factory
	^factory! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:06:02'!
setUp
	factory := MeasureFactory new.! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:25:08'!
testAddMeasuresOfSameBase
	self assert: (self factory oneMeter + self factory oneHundredCentimeters) = self factory twoMeters.
	self assert: (self factory oneMinute + self factory oneMinute) = (self factory sixtySeconds + self factory sixtySeconds).! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:01:13'!
testCompareTwoEqualMeasuresAreEqual
	self assert: self factory oneMeter = self factory oneMeter.
	self assert: self factory oneCelsius = self factory oneCelsius.
	self assert: self factory oneMinute = self factory oneMinute.! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:38:09'!
testComparesMeasuresOfSameBase
	self assert: self factory oneMinute < self factory oneDay.
	self assert: self factory oneMeter >= self factory oneCentimeter.! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:45:52'!
testConvertsToMeasuresOfSameBase
	self assert: (self factory oneMeter convertTo: (Unit centimeter)) amount = 100.! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:36:49'!
testMultiplyByNumber
	self assert: (self factory oneDay  = (self factory oneMinute * 60 * 24)).! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:56:44'!
testMultiplyNumberByUnit
	self assert: (self factory oneDay  = ((60 * 24) * Unit minute)).! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:30:02'!
testSubstractMeasuresOfSameBase
	self assert: (self factory oneMeter - self factory oneHundredCentimeters) = self factory zeroMeters.
	self assert: (self factory twoMinutes - self factory oneMinute) = (self factory twoMinutes - self factory sixtySeconds).! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:01:04'!
testTwoEquivalentMeasuresAreEqual
	self assert: self factory oneMeter = self factory oneHundredCentimeters.
	self assert: self factory oneMinute = self factory sixtySeconds.! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:03:13'!
testTwoMeasuresOfDifferentBaseAreNotEqual
	self deny: self factory oneMeter = self factory oneCelsius.
	self deny: self factory oneKelvin = self factory sixtySeconds.! !

!MeasureTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 23:05:40'!
testTwoMeasuresOfDifferentBaseCanBeAdded
	self assert: (self factory oneMeter + self factory oneCelsius) = (self factory oneHundredCentimeters + (274 * (Unit kelvin))).! !


!classDefinition: #MeasureFactory category: #'Measure-Solution'!
Object subclass: #MeasureFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 20:59:54'!
minusOneMeter
	^Measure initializeWith: -1 of: Unit meter! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 20:58:35'!
oneCelsius
	^Measure initializeWith: 1 of: Unit celsius! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:00:03'!
oneCentimeter
	^Measure initializeWith: 1 of: Unit centimeter! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:01:10'!
oneDay
	^Measure initializeWith: 1 of: Unit day! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:00:09'!
oneHundredCentimeters
	^Measure initializeWith: 100 of: Unit centimeter! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:00:57'!
oneKelvin
	^Measure initializeWith: 1 of: Unit kelvin! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:00:17'!
oneMeter
	^Measure initializeWith: 1 of: Unit meter! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:01:22'!
oneMinute
	^Measure initializeWith: 1 of: Unit minute! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:01:41'!
sixtySeconds
	^Measure initializeWith: 60 of: Unit second! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:00:24'!
twoHundredCentimeters
	^Measure initializeWith: 200 of: Unit centimeter! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:00:31'!
twoMeters
	^Measure initializeWith: 2 of: Unit meter! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:30:22'!
twoMinutes
	^Measure initializeWith: 2 of: Unit minute! !

!MeasureFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:00:38'!
zeroMeters
	^Measure initializeWith: 0 of: Unit meter! !


!classDefinition: #Unit category: #'Measure-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'metric convertToBase convertFromBase base'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:16:49'!
= aUnit
	self class = aUnit class
		ifTrue: [ ^factor = aUnit factor and: [ ^metric = aUnit metric ] ]
		ifFalse: [ ^false]! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:55:00'!
adaptToInteger: aNumber andSend: aSymbol
	aSymbol = #*
		ifTrue: [ ^Measure initializeWith: aNumber of: self ]
		ifFalse: [ ^self error: 'Multiplication is the only arithmetic operation with number that Unit supports.' ] ! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:11:13'!
base
	^base! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:19:33'!
convertFromBase
	^convertFromBase! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:11:23'!
convertToBase
	^convertToBase! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:20:08'!
initializeWith: aMetric convertToBase: aConverterToBase convertFromBase: aConverterFromBase base: aBase
	metric := aMetric.
	convertToBase := aConverterToBase.
	convertFromBase := aConverterFromBase.
	base := aBase.! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:16:49'!
metric
	^metric! !

!Unit methodsFor: 'as yet unclassified' stamp: 'FGJ 6/6/2017 20:16:49'!
printString
	^metric! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Unit class' category: #'Measure-Solution'!
Unit class
	instanceVariableNames: ''!

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:20:49'!
celsius
	^ self new initializeWith: 'celsius' convertToBase: [ :amount | amount - 273 ] convertFromBase: [ :amount | amount + 273] base: 'kelvin'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:21:29'!
centimeter
	^ self new initializeWith: 'centimeter' convertToBase: [ :amount | amount * 10 ] convertFromBase: [ :amount | amount / 10] base: 'meter'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:21:51'!
day
	^ self new initializeWith: 'day' convertToBase: [ :amount | amount * 60 * 60 * 24 ] convertFromBase: [ :amount | amount / (60 * 60 * 24) ] base: 'second'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 21:22:05'!
decameter
	^ self new initializeWith: 'decameter' convertToBase: [ :amount | amount * 10000 ] convertFromBase: [ :amount | amount / 10000 ] base: 'meter'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:17:11'!
decimeter
	^ self new initializeWith: 'decimeter' convertToBase: [ :amount | amount * 100 ] convertFromBase: [ :amount | amount / 100] base: 'meter'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:17:42'!
fahrenheit
	^ self new initializeWith: 'fahrenheit' convertToBase: [ :amount | (amount + 45967/100) * 5/9 ] convertFromBase: [ :amount | (amount * 9/5) - 45967/100] base: 'kelvin'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:17:58'!
hectometer
	^ self new initializeWith: 'hectometer' convertToBase: [ :amount | amount * 100000 ] convertFromBase: [ :amount | amount / 100000] base: 'meter'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:18:18'!
hour
	^ self new initializeWith: 'hour' convertToBase: [ :amount | amount * 60 * 60 ] convertFromBase: [ :amount | amount / (60 * 60)] base: 'second'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:18:28'!
kelvin
	^ self new initializeWith: 'celsius' convertToBase: [ :amount | amount ]  convertFromBase: [ :amount | amount ] base: 'kelvin'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:18:39'!
kilometer
	^ self new initializeWith: 'kilometer' convertToBase: [ :amount | amount * 1000000 ] convertFromBase: [ :amount | amount / 1000000] base: 'meter'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:18:48'!
meter
	^ self new initializeWith: 'meter' convertToBase: [ :amount | amount * 1000 ] convertFromBase: [ :amount | amount / 1000] base: 'meter'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:18:57'!
milimeter
	^ self new initializeWith: 'milimeter' convertToBase: [ :amount | amount ] convertFromBase: [ :amount | amount ] base: 'meter'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:19:05'!
minute
	^ self new initializeWith: 'minute' convertToBase: [ :amount | amount * 60 ] convertFromBase: [ :amount | amount / 60] base: 'second'! !

!Unit class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/7/2017 22:19:12'!
second
	^ self new initializeWith: 'second' convertToBase: [ :amount | amount ] convertFromBase: [ :amount | amount ] base: 'second'! !
