# Paradigma-Objetos

Un objeto es algo que puedo representar mediante una idea o un concepto. Se puede representar de varias maneras y lo que importa no es ese algo real sino nuestra idea mental. Puede no ser algo real (una deuda, un string), pero existe en mi cabeza. Vamos a reunir los datos y procedimientos en un paquete, para lograr un *"encapsulamiento"*.

**Sistema:** Conjunto de objetos que se envian mensajes para alcanzar un determinado objetivo.

**Interfaz o Contrato:** La conforman los mensajes que le puedo enviar a la entidad y sus caracteristicas (por ejemplo que parametros le mando). El **que**

**Mensajes:** Cosas que le puedo pedir a un objeto. Tiene receptor, parámetros y valor de retorno.
- Tengo que conocerlo -> se que puedo pedirle.
- No quiero saber como lo hace (saberlo me ata a el, me *acopla*) eso es propio del objeto.

**Método:** Es la porción de codigo que se ejecuta al recibir un mensaje. El **como** Mensaje /= Método.

**Ambiente:** Es el arenero en el que estan los objetos y el observador.

**Referencias:** Es lo que permite que el observador y el objeto se conozcan. Para ello se utilizan variables que es la forma en la que el observador se dirige al objeto. Los unicos que pueden utilizar las referencias son los propios objetos. Algunas referencias son variables y otras son constantes. Siempre que hablo con un objeto hablo con su referencia.

**Estado de un objeto:** Esta formado por el conjunto de referencias de ese objeto. Al modelar una situacion buscamos que el estado de un objeto cambie solo por metodos propios de ese objeto.

> Evitar precalculos

**Bloques:**  Son como las lambdas de haskell. Ejemplo:
```wollok
keyboard.right().onPressDo({
  pepita.position(pepita.position().right(1))
})
```
En este 

## Sintaxis
`object`: Define un nuevo objeto el cual tenemos que nombrar. Entre llaves definimos los comportamientos y atributos. Ejemplo `objetct pepita{}`.

`var`: Define una referencia o un atributo con un nombre y un valor. Ejemplo `var energia = 100`. La principal diferencia es que esta referencia cambia.

`const`: Funciona de la misma forma que `var`, pero en este caso la refencia es siempre la misma.

`method`: Define un método que puede recibir parametros. Entre llaves ponemos el comportamiento. Ejemplo `method comer(cant){}`. 

## Propiedades
En wollok podemos definir `var` o `const` agregandole `property` lo que genera automáticamente un getter y/o un setter (en caso de que sea `const` no genera el setter) que no es visible. Esto es para tener que evitar escribir constantemente estos setters y getters y que el código sea más limpio, aunque quizas queramos que ciertos atributos tengan alguno de estos que sea específico. 
```wollok
object persona {
  var property vida = 100
}
```
Siempre se generan usando el nombre del atributo, en este caso:
- Getter: `persona.vida()`
- Setter: `persona.vida(90)`

## Metodo o Implementacion
Es el codigo que se ejecuta al recibir un mensaje. Para buscar el codigo correspondiente a ese método se usa una estrategia denominada **method lookup**
- Algunos mensajes responden preguntas. Es decir que **no tienen efecto**
  - Pepita, ¿Cuál es tu energía? ==> pepita.energia() ==> 10
- Otros mensajes disparan acciones, en estos casos nos interesa mas el *efecto colateral*, es decir **tienen efecto**.
  - Pepita, ¡Volá! ==> pepita.vola(10) ==> pepita se desplaza 10 kilómetros.

## Colecciones
Puede considerarse como una lista en un comienzo. Para diferenciarlo de una lista y tener realmente una colección se lo declara de la siguiente forma `var unConjunto = #{1,2,3,4}` y tiene métodos distintos. Por ejemplo no funciona `first()` (los conjuntos no tienen "primero").

`.union(otroConjunto)`: Une dos conjuntos.

## Listas

`.add(elemento)`: Para agregar elementos.

`.contains(elemento)`: Para ver si un elemento pertenece a la lista.

`.remove(elemento)`: Quita un elemento de la colección. Si estuviera repetido elimina el primero unicamente.

`.size()`: Devuelve el tamaño de la lista.

`.sum(bloque)`: Suma los elementos de una colección. Sin el bloque suma una lista de numeros. Por ejemplo:

```wollok
method cotizacion() = cartas.sum({c => c.valor})
```

`.any(condicion)`: Verifica si un elemento en la lista cumple con la condición. 

`.all(condicion)`: Verifica si todos los elementos en la lista cumple con la condición.

`.filter(condicion)`: Devuelvela lista pero solo con los elementos que cumplen una condición.

`.map(bloque)`: Mismo map de siempre.

`.max()`: Busca el máximo.

Hasta aca son todas preguntas, no alteran la lista orginal

`.forEach(bloque)`: Aplica algo a todos los elementos de la lista pero no retorna nada. Por lo que el bloque tampoco retorna nada

`.asSet()`: Tranforma una lista en un conjunto por lo que elimina repetidos.

## Clases
Lo podemos ver como un molde con el cual vamos creando despues las distintas instancias. Por ejemplo tenemos varios autos que todos responden al método esVeloz y tienen la variable patente, podemos declarar una clase vehículo con esas características aunque despues cada instancia (auto, moto, etc) tenga sus diferencias. Cuando el objeto obtiene todas la referencias definidas en su clase se lo llama **estructura**
```wollok
class Vehiculo {
	const patente
	var kilometraje
	var property velocidad = 100

	method esVeloz() = velocidad > 200
}

cons auto = new Vehiculo(	// Instancia auto.
	patente = "12ABC34",
	kilometraje = 100000
)  
```
En este caso podemos ver que `patente`y `kilometraje` son constantes que les asignamos su valor cuando instanciamos un vehículo (lo que se conoce como **variables de instancia**), pero todos los vehículos que instanciemos arrancan con 100 de velocidad. Además todos entienden el método esVeloz.

## Tipos
Un tipo es un conjunto de mensajes que entiende un objeto, un caso particular es considerar todos los mensajes que entiende un objeto, entonces el tipo está definido por la clase (en el ejemplo anterior es solo esVeloz). La ventaja de los tipos es que nos permite trabajar **polinnorficamente** con objetos o clases. Por poner un ejemplo podemos ver a un vehículo como objetos que entienden el mensaje `esVeloz()` y si tengo otra clase como proyectiles o objetos mientras todos entiendan el mensaje `esVeloz()` puedo tratarlos de la misma manera aunque la implementación del método sea distinta.

## Diagrama dinamico
Nos permite ver los objetos que estan actualmente en nuestro ambiente, junto a sus atributos que en este contexto se denominan referencias. El garbage collector basicamente es lo que impide que se muestren objetos que no estan referenciados, por ende aquellos objeto que pierdan su referencia dejaran de mostrarse en el diagrama.

## Polimorfimo
Puedo agregar mas objetos que interactuen con un objeto sin la necesidad de adaptar al objeto que interactua. Basicamente se que todos los objetos con los que vaya a trabajar entienden el mismo mensaje.

## Objetos anónimos
Son objetos sin referencia, que existen solo en el contexto en el que se utilizan y por lo general se utilizan en algunos test.

```wollok
import choferes.*
 
describe "Tests de Daniel" {
 
 	method crearPasajero(joven) = object {
      	method esJoven() = joven  
 	}
 	
 	test "Daniel no lleva a un pasajero joven" {
      	const pasajeroJoven = self.crearPasajero(true)
      	assert.notThat(daniel.llevaA(pasajeroJoven))
 	}
 	
 	test "Daniel lleva a un pasajero que no es joven" {
      	const pasajeroViejo = self.crearPasajero(false)
      	assert.that(daniel.llevaA(pasajeroViejo))
 	}
 
}
```

## Test
Para usar los test lo que queremos que no los tengamos que hacer nosotros, sino que sean hechos automaticamente.
Para eso vamos a usar archivos `.wTest. Ejemplo:
```wollok
import pepita.* // importa todos los objetos del archivo pepita

test "Al iniciar pepita no esta cansada"{
  assert.notThat(pepita.estaCansada())
}

// En este caso verifico que pepita no esta cansada al comenzar

test "Si la hacemos volar 9 metros, se cansa" {
  // Preparación

  // Ejercitación
  pepita.volar(9)

  // Verificacón
  assert.that(pepita.estaCansada())
}
```

**Test first:** Hacer primero un test que de mal para despues resolver el error.

## WollokGame
No es el objetivo de la materia pero sirve para practicar

`import wollok.game.*`

Con eso podemos obtener todos los mensajes de que tiene el objeto **game**

- game: Es un objeto
- program: No es un objeto
- position: Es un objeto

### Algunos metodos

`addVisual`: Permite mostrar un objeto pero el objeto tiene que entender el mensaje position. Ejemplo de los mensajes que debe entender el objeto:
```wollok
method position() = game.at(1,1)
method image() = pepita.pnj
```
`addVisualCharacter`: Permite que ese objeto se pueda mover en las cuatro direcciones.

`property`: En la var posicion permite que se mueva izquierda o derecha.

La desventaja es que "no puedo hacer nada con ese movimiento". (Que se canse por ejemplo).

`say`: Permite que el objeto "hable". Ejemplo:
```wollok
game.say(pepita, "Hola")
```

`onTick`: Permite ejecutar eventos temporales. Ejemplo:
```wollok
game.onTick(2000, "moverse", {Bloque})
```

## Diagrama estático
