!classDefinition: #TusLibrosTest category: #TusLibros!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'factory carrito'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 20:11:09'!
setUp
	carrito := Bag new.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 20:11:32'!
test01NuevoCarritoEstaVacio

	self assert: (carrito isEmpty)! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 20:11:55'!
test02UnCarritoNoEstaVacioLuegoDeAgregarUnLibro
	
	carrito add: 'libro'.
	
	self deny: (carrito isEmpty).! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 20:13:17'!
testUnCarritoContieneUnLibroLuegoDeAgregarlo
	| unLibro |
	
	unLibro := 'AAA'.
	
	carrito add: unLibro.
	
	self assert: (carrito size = 1)! !


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

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 19:34:28'!
copiasDe: unLibro
	^productos at: unLibro ifPresent: [ :cantidad | cantidad ] ifAbsent: [ 0 ]! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 20:26:58'!
isEmpty
	^productos size = 0! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/12/2017 20:47:45'!
productos
	^productos! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 19:27:35'!
productos: unosProductos
	productos := unosProductos.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: #TusLibros!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 19:27:06'!
new
	|nuevoCarrito|
	nuevoCarrito := super new.
	nuevoCarrito productos: Dictionary new.
	^nuevoCarrito
	! !


!classDefinition: #LibrosFactory category: #TusLibros!
Object subclass: #LibrosFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!LibrosFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 19:16:09'!
elQuijote
	^'ASDFASDF'! !
