!classDefinition: #TusLibrosTest category: #TusLibros!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'carrito cashier tarjetaVencida carritoConLibros tarjeta'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:53:38'!
setUp
	| unCatalogo |
	unCatalogo := Dictionary new.
	unCatalogo at: 'libro' put: 5.
	carrito := Carrito withCatalogo: unCatalogo.
	
	carritoConLibros := Carrito withCatalogo: unCatalogo.
	carritoConLibros agregar: 'libro'.
	
	cashier := Cashier vendeElDia: 1 conElLibroDeVentas: Bag new.
	
	tarjetaVencida := TarjetaDeCredito expiraEl: 0.
	tarjeta := TarjetaDeCredito expiraEl: 10.! !

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

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:41:41'!
test08CuandoLaTarjetaEstaVencidaNoSeLlamaAlMerchantProcessor
	self should: [ cashier checkout: carritoConLibros pagandoCon: tarjetaVencida ] raise: Error description: 'No se puede realizar una compra con una tarjeta vencida'.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:49:04'!
test09CuandoLaTarjetaNoTieneCreditoLaVentaNoSeRealiza
	self should: [ cashier checkout: carritoConLibros pagandoCon: tarjeta ] raise: Error description: 'No se pudo realizar la compra porque la tarjeta no cuenta con crédito suficiente'.
	self assert: (cashier libroDeVentas size = 0).! !


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
	instanceVariableNames: 'diaDeVenta libroDeVentas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:31:02'!
checkout: unCarrito pagandoCon: unaTarjeta
	unCarrito productos isEmpty ifTrue: [ self error: 'No se puede hacer checkout de un carrito vacío' ].
	(unaTarjeta estaExpiradaEl: diaDeVenta) ifTrue: [ self error: 'No se puede realizar una compra con una tarjeta vencida' ]! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:34:29'!
vendeElDia: unaFecha
	diaDeVenta := unaFecha.! !


!Cashier methodsFor: 'initialization' stamp: 'FGJ 6/26/2017 23:03:56'!
libroDeVentas
	^libroDeVentas! !

!Cashier methodsFor: 'initialization' stamp: 'FGJ 6/26/2017 22:57:19'!
vendeElDia: unDia conElLibroDeVentas: unLibroDeVentas 
	diaDeVenta := unDia.
	libroDeVentas := unLibroDeVentas.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: 'libroDeVentas'!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:34:07'!
vendeElDia: unaFecha
	self new vendeElDia: unaFecha! !


!Cashier class methodsFor: 'accessing' stamp: 'FGJ 6/26/2017 22:50:49'!
libroDeVentas
	^libroDeVentas! !


!Cashier class methodsFor: 'instance creation' stamp: 'FGJ 6/26/2017 22:55:34'!
vendeElDia: unDia conElLibroDeVentas: unLibroDeVentas 
	self new vendeElDia: unDia conElLibroDeVentas: unLibroDeVentas! !


!classDefinition: #TarjetaDeCredito category: #TusLibros!
Object subclass: #TarjetaDeCredito
	instanceVariableNames: 'vencimiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TarjetaDeCredito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:32:14'!
estaExpiradaEl: unaFecha
	^vencimiento < unaFecha! !

!TarjetaDeCredito methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:28:44'!
expiraEl: unaFecha
	vencimiento := unaFecha.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TarjetaDeCredito class' category: #TusLibros!
TarjetaDeCredito class
	instanceVariableNames: ''!

!TarjetaDeCredito class methodsFor: 'as yet unclassified' stamp: 'FGJ 6/26/2017 22:28:26'!
expiraEl: unaFecha
	self new expiraEl: unaFecha! !
