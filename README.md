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
```
keyboard.right().onPressDo({
  pepita.position(pepita.position().right(1))
})
```
En este 

## Sintaxis
`object`: Define un nuevo objeto el cual tenemos que nombrar. Entre llaves definimos los comportamientos y atributos. Ejemplo `objetct pepita{}`.

`var`: Define una referencia o un atributo con un nombre y un valor. Ejemplo `var energia = 100`.

`method`: Define un método que puede recibir parametros. Entre llaves ponemos el comportamiento. Ejemplo `method comer(cant){}`. 

## Metodo o Implementacion
Es el codigo que se ejecuta al recibir un mensaje. Para buscar el codigo correspondiente a ese método se usa una estrategia denominada **method lookup**
- Algunos mensajes responden preguntas. Es decir que **no tienen efecto**
  - Pepita, ¿Cuál es tu energía? ==> pepita.energia() ==> 10
- Otros mensajes disparan acciones, en estos casos nos interesa mas el *efecto colateral*, es decir **tienen efecto**.
  - Pepita, ¡Volá! ==> pepita.vola(10) ==> pepita se desplaza 10 kilómetros.

## Diagrama dinamico
Nos permite ver los objetos que estan actualmente en nuestro ambiente, junto a sus atributos que en este contexto se denominan referencias. El garbage collector basicamente es lo que impide que se muestren objetos que no estan referenciados, por ende aquellos objeto que pierdan su referencia dejaran de mostrarse en el diagrama.

## Polimorfimo
Puedo agregar mas objetos que interactuen con un objeto sin la necesidad de adaptar al objeto que interactua.

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
````

**Test first:** Hacer primero un test que de mal para despues resolver el error.

## WollokGame
No es el objetivo de la materia pero sirve para practicar

```
import wollok.game.*
```

Con eso podemos obtener todos los mensajes de que tiene el objeto **game**

- game: Es un objeto
- program: No es un objeto
- position: Es un objeto

### Algunos metodos

`addVisual`: Permite mostrar un objeto pero el objeto tiene que entender el mensaje position. Ejemplo de los mensajes que debe entender el objeto:
```
method position() = game.at(1,1)
method image() = pepita.pnj
```
`addVisualCharacter`: Permite que ese objeto se pueda mover en las cuatro direcciones.

`property`: En la var posicion permite que se mueva izquierda o derecha.

La desventaja es que "no puedo hacer nada con ese movimiento". (Que se canse por ejemplo).

`say`: Permite que el objeto "hable". Ejemplo:
```
game.say(pepita, "Hola")
```

`onTick`: Permite ejecutar eventos temporales. Ejemplo:
```
game.onTick(2000, "moverse", {Bloque})
```
