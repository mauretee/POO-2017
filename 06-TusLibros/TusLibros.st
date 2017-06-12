!classDefinition: #TusLibrosTest category: #TusLibros!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 19:42:08'!
testNuevoCarritoEstaVacio
	self assert: (Carrito new isEmpty)! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 20:24:48'!
testUnCarritoNoEstaVacioLuegoDeAgregarUnProducto
	| elQuijote unCarrito |
	unCarrito := Carrito new.
	self assert: unCarrito agregar: 1 copiasDe: elQuijote! !


!classDefinition: #Carrito category: #TusLibros!
Object subclass: #Carrito
	instanceVariableNames: 'productos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 20:46:41'!
agregar: unaCantidad copiasDe: unLibro
	|laCantidad|
	laCantidad := productos at: unLibro ifPresent: [ :cantidadActual | cantidadActual + unaCantidad ] ifAbsent: [ unaCantidad ].
	 ^productos add: (Association key: unLibro value: laCantidad)! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 20:26:58'!
isEmpty
	^productos size = 0! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 20:47:45'!
productos
	^productos! !


!classDefinition: #LibrosFactory category: #TusLibros!
Object subclass: #LibrosFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!LibrosFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 20:51:05'!
elQuijote
	^Producto new with: 1234! !


!classDefinition: #Producto category: #TusLibros!
Object subclass: #Producto
	instanceVariableNames: 'ISBN'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Producto methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 20:51:28'!
with: anISBN
	ISBN := anISBN.! !
