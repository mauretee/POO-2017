!classDefinition: #TusLibrosTest category: #TusLibros!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'carrito cashier tarjetaVencida'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:51:00'!
setUp
	| unCatalogo |
	unCatalogo := Dictionary new.
	unCatalogo at: 'libro' put: 5.
	carrito := Carrito withCatalogo: unCatalogo.
	
	cashier := Cashier new.
	
	tarjetaVencida := Dictionary new.
	tarjetaVencida at: 'fechaDeExpiración' put: 4.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:24:19'!
test01NuevoCarritoEstaVacio

	self assert: (carrito estaVacio)! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:25:15'!
test02UnCarritoNoEstaVacioLuegoDeAgregarUnLibro
	
	carrito agregar: 'libro'.
	
	self deny: carrito estaVacio.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:26:32'!
test03UnCarritoContieneUnLibroLuegoDeAgregarlo
	
	carrito agregar: 'libro'.
	
	self assert: (carrito productos size = 1)! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:27:09'!
test04UnCarritoContieneElLibroAgregadoLuegoDeAgregarlo
	
	carrito agregar: 'libro'.
	
	self assert: (carrito productos includes: 'libro')! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:29:14'!
test05ElContenidoDelCarritoSonLosLibrosAgregados
	
	carrito agregar: 'libro'.
	self assert: (carrito productos includes: 'libro')! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:29:55'!
test06NoSePuedenAgregarLibrosQueNoPertenecenAlCatalogo
	
	self should: [carrito agregar: 'libroFueraDeCatalogo'] raise: Error description: 'No se puede agregar un libro que no pertenece a la editorial'.
	self assert: carrito productos size = 0.
	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:41:23'!
test07NoSePuedeHacerCheckoutDeUnCarritoVacio
	self should: [ cashier checkout: carrito pagandoCon: nil ] raise: Error description: 'No se puede hacer checkout de un carrito vacío'.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:46:14'!
test08CuandoLaTarjetaEstaVencidaNoSeLlamaAlMerchantProcessor
	self should: [ cashier checkout: carrito pagandoCon: nil ] raise: Error description: 'No se puede hacer checkout de un carrito vacío'.! !


!classDefinition: #Carrito category: #TusLibros!
Object subclass: #Carrito
	instanceVariableNames: 'productos catalogo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:23:49'!
agregar: unLibro
	self agregar: 1 copiasDe: unLibro.! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:25:49'!
agregar: unaCantidad copiasDe: unLibro
	unaCantidad < 0 ifTrue: [ self error: 'Solo se pueden agregar cantidades positivas de libros' ].
	(catalogo includesKey: unLibro) ifFalse: [ self error: 'No se puede agregar un libro que no pertenece a la editorial' ].
	
	unaCantidad timesRepeat: [ productos add: unLibro ]! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:08:00'!
catalogo: unCatalogo
	catalogo := unCatalogo.! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:23:58'!
estaVacio
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

!Carrito class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:04:46'!
new
	|nuevoCarrito|
	nuevoCarrito := super new.
	nuevoCarrito productos: Bag new.
	^nuevoCarrito
	! !

!Carrito class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:09:59'!
withCatalogo: unCatalogo
	| unCarrito |
	unCarrito := self new.
	unCarrito catalogo: unCatalogo.
	^unCarrito! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'FGJ 6/25/2017 18:42:47'!
checkout: unCarrito pagandoCon: unaTarjeta
	unCarrito productos isEmpty ifTrue: [ self error: 'No se puede hacer checkout de un carrito vacío' ].! !


!classDefinition: #LibrosFactory category: #TusLibros!
Object subclass: #LibrosFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!LibrosFactory methodsFor: 'as yet unclassified' stamp: 'FGJ 6/13/2017 19:16:09'!
elQuijote
	^'ASDFASDF'! !
