!classDefinition: #DistanciaTest category: #Distancia!
TestCase subclass: #DistanciaTest
	instanceVariableNames: 'unMetro dosMetros cienCentimetros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancia'!

!DistanciaTest methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:35:03'!
test01
	unMetro := Metro new.
	self assert: unMetro = unMetro.! !

!DistanciaTest methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:02:06'!
test02
	unMetro  := Metro new.
	unMetro initializeWith:1.
	dosMetros := (Metro new) initializeWith:2.
	self assert: (unMetro  + unMetro ) = dosMetros.! !

!DistanciaTest methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:15:45'!
test03
	unMetro := (Metro new) initializeWith: 1.
	cienCentimetros := (Centimetros new) initializeWith: 100.
	self assert:unMetro = cienCentimetros.! !

!DistanciaTest methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:39:35'!
test04
	unMetro := (Metro new) initializeWith: 1.
	cienCentimetros := (Centimetros new) initializeWith: 100.
	self assert:cienCentimetros =unMetro .! !


!classDefinition: #Centimetros category: #Distancia!
Object subclass: #Centimetros
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancia'!

!Centimetros methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:30:35'!
= unaDistancia.
	^ unaDistancia compareCentimetro: self.! !

!Centimetros methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:21:15'!
centimetroValue
	^value.! !

!Centimetros methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:21:02'!
compareCentimetro: unCentimetro
	^ unCentimetro centimetroValue = self centimetroValue.! !

!Centimetros methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:32:30'!
compareMetro: metros
	^ (self centimetroValue ) = ((metros metroValue)*100).! !

!Centimetros methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:17:16'!
initializeWith:unValue
	value := unValue .! !


!classDefinition: #Metro category: #Distancia!
Object subclass: #Metro
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distancia'!

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:13:10'!
+ unMetro
	^ (Metro new) initializeWith: (self metroValue + unMetro  metroValue ).! !

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:30:01'!
= unaDistancia 
	^ unaDistancia compareMetro: self.! !

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:26:51'!
compareCentimetro: centimetros
	^ (self metroValue)*100 = centimetros centimetroValue .! !

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:25:14'!
compareMetro: unMetro
	^ self metroValue  = unMetro metroValue .! !

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 19:12:38'!
initializeWith:unValue
	value := unValue.! !

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/22/2017 18:57:35'!
metroValue
	^value.! !
