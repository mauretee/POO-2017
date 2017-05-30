!classDefinition: #DistanciaTest category: #'Distance-Solution'!
TestCase subclass: #DistanciaTest
	instanceVariableNames: 'unMetro dosMetro cienCentimetros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanciaTest methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 19:03:59'!
test01
	unMetro := Metro with:1.
	self assert:unMetro = unMetro
! !

!DistanciaTest methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 19:05:17'!
test02
	unMetro := Metro with:1.
	dosMetro := Metro with:2.
	self assert:(unMetro + unMetro = dosMetro).
! !

!DistanciaTest methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 19:06:14'!
test03
	unMetro := Metro with:1.
	cienCentimetros := Centimetro with:2.
	self assert:(unMetro + unMetro = dosMetro).
! !


!classDefinition: #Distancia category: #'Distance-Solution'!
Object subclass: #Distancia
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Distancia methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:49:26'!
= unaDistancia
	self value = (self class desde:unaDistancia) value.! !


!classDefinition: #Centimetro category: #'Distance-Solution'!
Distancia subclass: #Centimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Centimetro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:57:46'!
comoCentimetro
	^self.! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:57:41'!
comoMetro
	^ Metro value:(value/100).! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:57:34'!
comoMilimetro
	^Milimetro value:(value/10).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimetro class' category: #'Distance-Solution'!
Centimetro class
	instanceVariableNames: ''!

!Centimetro class methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 19:00:35'!
desde:unaDistancia
	^unaDistancia comoCentimetro.! !


!classDefinition: #Metro category: #'Distance-Solution'!
Distancia subclass: #Metro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:56:38'!
comoCentimetro
	^Centimetro value:(value*100).! !

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:57:11'!
comoMetro
	^self.! !

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:56:24'!
comoMilimetro
	^Milimetro value:(value*1000).! !

!Metro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 19:03:30'!
initializeWith:unValue
	^ value := unValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Metro class' category: #'Distance-Solution'!
Metro class
	instanceVariableNames: ''!

!Metro class methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 19:00:11'!
desde:unaDistancia
	^unaDistancia comoMetro.! !

!Metro class methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 19:03:12'!
with: unValue 
	^ self new initializeWith:unValue.! !


!classDefinition: #Milimetro category: #'Distance-Solution'!
Distancia subclass: #Milimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Milimetro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:58:07'!
comoCentimetro
	^Centimetro value:(value/10).! !

!Milimetro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:59:11'!
comoMetro
	^Metro value:(value/1000).! !

!Milimetro methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:58:11'!
comoMilimetro
	^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimetro class' category: #'Distance-Solution'!
Milimetro class
	instanceVariableNames: ''!

!Milimetro class methodsFor: 'as yet unclassified' stamp: 'M 5/30/2017 18:59:44'!
desde:unaDistancia
	^ unaDistancia comoMilimetro.! !
