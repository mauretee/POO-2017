!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:48:49'!
gameWithLiveCells: aCollection withSize:aSize
	^  (GameOfLife withLiveCells: aCollection  withSize: aSize) nextGeneration.! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:52:25'!
test01AliveCellWithLessThanTwoAliveNeighDies

	"|gameOfLife |"
	
"	gameOfLife := GameOfLife withLiveCells: { 1@1 }  withSize: 3@3."
	"gameOfLife nextGeneration."
	
	self assert: ((self gameWithLiveCells:{1@1} withSize:3@3) isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:53:29'!
test02AliveCellWithTwoAliveNeighStaysAlive
	self deny: ((self gameWithLiveCells:{1@1. 2@0. 1@0} withSize:3@3) isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:55:31'!
test03AliveCellWithThreeAliveNeighStaysAlive
		self deny: ((self gameWithLiveCells:{1@1. 2@0. 1@0. 1@2} withSize:3@3) isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:56:19'!
test04AliveCellWithMoreThanThreeAliveNeighDies
	self assert: ((self gameWithLiveCells:{1@1. 2@0. 1@0. 1@2. 0@1} withSize:3@3) isDeadAt: 1@1)! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:57:27'!
test05DeadCellWithThreeAliveNeighResurects
	self deny: ((self gameWithLiveCells:{2@0. 1@0. 0@0} withSize:3@3) isDeadAt: 1@1)! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 20:59:58'!
test06CreateCellOutsideBounds

	self 
		should: [ GameOfLife withLiveCells: { 2@0. 1@0. 1@4 } withSize: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:23:26'!
addDeadCellsTo:aCollection
	0 to: size x do: [ :x |
		0 to: size y do: [ :y |
			(aliveCells includes: x@y) not ifTrue: [ aCollection add: x@y]]].! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:22:45'!
deadCells
	| deadCells |
	
	deadCells _ OrderedCollection new.
	self addDeadCellsTo:deadCells.
	^deadCells ! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 21:11:17'!
hasToResurrect: aCell

	^(self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 19:57:05'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'M 5/16/2017 18:40:35'!
initializeWith: aCollectionOfAliveCells withSize: aSize
	|table|
	table := 0@0 corner: aSize.
	size := aSize.
	aliveCells := aCollectionOfAliveCells.
	(aliveCells allSatisfy: [:aCell | table containsPoint: aCell]) ifFalse: [ self error: 'celda fuera de rango' ]! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/10/2017 10:28:24'!
isDeadAt: aCell

	^(aliveCells includes: aCell) not! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 21:05:39'!
nextGeneration
	
	aliveCells := (aliveCells select: [ :aCell | self hasToSurvive: aCell ]) union:
		(self deadCells select: [ :aDeadCell | self hasToResurrect: aDeadCell ])! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/10/2017 10:29:35'!
numberOfAliveNeighboursOf: aCell

	^(aCell eightNeighbors intersection: aliveCells) size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!

!GameOfLife class methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 20:38:14'!
withLiveCells: aCollectionOfAliveCells withSize: aPoint 
	
	^self new initializeWith: aCollectionOfAliveCells withSize: aPoint ! !
