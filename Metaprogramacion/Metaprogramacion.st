!classDefinition: #AddInstanceVariableTests category: #Metaprogramacion!
TestCase subclass: #AddInstanceVariableTests
	instanceVariableNames: 'aClassToRefactor withConflictingSuperclass withConflictingSubclass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!

!AddInstanceVariableTests methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 20:36:10'!
setUp

	aClassToRefactor := Object subclass: #Pepe instanceVariableNames: 'a' classVariableNames: '' poolDictionaries: '' category: 'Metaprogramacion'.
	aClassToRefactor compile: 'm1 |c| c := 1. ^c '.
	withConflictingSuperclass := aClassToRefactor subclass: #Pepito instanceVariableNames: 'b' classVariableNames: '' poolDictionaries: '' category: 'Metaprogramacion'.
	withConflictingSubclass := aClassToRefactor.! !

!AddInstanceVariableTests methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 20:33:30'!
tearDown
	
	aClassToRefactor removeFromSystem.
	withConflictingSuperclass removeFromSystem.! !

!AddInstanceVariableTests methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 19:46:05'!
test01WhenVarNameIsEmptyItRaises
	
	self 
		should: [ AddInstanceVariable named: '' in: aClassToRefactor ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText = 'The instance variable name cannot be empty' ]! !

!AddInstanceVariableTests methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 19:47:03'!
test02WhenVarNameIsInvalidItRaises
	
	self 
		should: [ AddInstanceVariable named: '1+1' in: aClassToRefactor ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText = 'The instance variable name cannot contain invalid symbols nor start with a number' ]! !

!AddInstanceVariableTests methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 20:06:28'!
test03WhenVarNameIsDefinedInSuperclassItRaises
	
	self 
		should: [ AddInstanceVariable named: 'a' in: withConflictingSuperclass ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText = 'The instance variable cannot be defined in a superclass' ]! !

!AddInstanceVariableTests methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 20:29:19'!
test04WhenVarNameIsDefinedInSubclassItRaises
	
	self 
		should: [ AddInstanceVariable named: 'b' in: withConflictingSubclass ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText = 'The instance variable cannot be defined in a subclass' ]! !

!AddInstanceVariableTests methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 21:06:14'!
test05WhenAMethodShadowsTheNewInstVarNameItWarns
	
	self 
		should: [ AddInstanceVariable named: 'c' in: aClassToRefactor ]
		raise: Warning
		withExceptionDo: [ :anError | self assert: anError messageText = 'There is a local variable on method m1 that shadows c' ]! !

!AddInstanceVariableTests methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 21:17:20'!
test06CanAddAnInstVarNamed
	| refactorer |
	refactorer := AddInstanceVariable named: 'd' in: aClassToRefactor.
	
	refactorer apply.
	
	self assert: (aClassToRefactor instVarNames includes: 'd').
	
	aClassToRefactor removeInstVarName: 'd'.! !


!classDefinition: #AddInstanceVariable category: #Metaprogramacion!
Object subclass: #AddInstanceVariable
	instanceVariableNames: 'aClassToRefactor aVarToAdd'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!

!AddInstanceVariable methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 21:12:15'!
apply
	aClassToRefactor addInstVarName: aVarToAdd.! !

!AddInstanceVariable methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 21:11:29'!
withAClassToRefactor: aClass aVarToAdd: aVar
	
	aClassToRefactor := aClass.
	aVarToAdd := aVar.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AddInstanceVariable class' category: #Metaprogramacion!
AddInstanceVariable class
	instanceVariableNames: ''!

!AddInstanceVariable class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/29/2017 21:13:25'!
named: aVar in: aClass
	| vars |
	aVar isEmpty ifTrue: [ self error: 'The instance variable name cannot be empty' ].
	vars := Scanner new scanFieldNames: aVar.
	((vars size = 1) and: [ (vars at: 1) = aVar ]) ifFalse: [ self error: 'The instance variable name cannot contain invalid symbols nor start with a number' ].
	(aClass allSuperclasses anySatisfy: [ :aSuperclass | aSuperclass instVarNames includes: aVar ]) ifTrue: [ self error: 'The instance variable cannot be defined in a superclass' ].
	(aClass allSubclasses anySatisfy: [ :aSuperclass | aSuperclass instVarNames includes: aVar ]) ifTrue: [ self error: 'The instance variable cannot be defined in a subclass' ].
	
	aClass methodsDo: [ :aMethod | (aMethod methodNode tempNames includes: aVar) ifTrue: [ Warning new signal: 'There is a local variable on method ', aMethod selector, ' that shadows ', aVar ] ].
	aClass allSubclasses do: [ :aSuper | aSuper methodsDo: [ :aMethod | (aMethod methodNode tempNames includes: aVar) ifTrue: [ Warning new signal: 'There is a local variable on method ', aMethod selector, ' that shadows ', aVar ] ] ].
	
	^self new withAClassToRefactor: aClass aVarToAdd: aVar.! !
