# Paradigma-Objetos

Un objeto es algo que puedo representar mediante una idea o un concepto. Se puede representar de varias maneras y lo que importa no es ese algo real sino nuestra idea mental. Puede no ser algo real (una deuda, un string), pero existe en mi cabeza.

**Sistema:** Conjunto de objetos que se envian mensajes para alcanzar un determinado objetivo.
**Interfaz:** La conforman los mensajes que le puedo enviar a la entidad. El **que**
**Mensajes:** Cosas que le puedo pedir a un objeto
- Tengo que conocerlo -> se que puedo pedirle.
- No quiero saber como lo hace (saberlo me ata a el, me *acopla*) eso es propio del objeto.
**Método:** Es la porción de codigo que se ejecuta al recibir un mensaje. **como** Mensaje /= Método.
**Ambiente:** Es el arenero en el que estan los objetos y el observador.
**Referencias:** Es lo que permite que el observador y el objeto se conozcan. Para ello se utilizan variables que es la forma en la que el observador se dirige al objeto.
**Estado de un objeto:** Esta formado por el conjunto de referencias de ese objeto. Al modelar una situacion buscamos que el estado de un objeto cambie solo por metodos propios de ese objeto.

## Sintaxis
`object`: Define un nuevo objeto el cual tenemos que nombrar. Entre llaves definimos los comportamientos y atributos. Ejemplo `objetct pepita{}`.
`var`: Define una referencia o un atributo con un nombre y un valor. Ejemplo `var energia = 100`.
`method`: Define un método que puede recibir parametros. Entre llaves ponemos el comportamiento. Ejemplo `method comer(cant){}`. 

## Metodo o Implementacion
Es el codigo que se ejecuta al recibir un mensaje. Para buscar el codigo correspondiente a ese método se usa una estrategia denominada **method lookup**
- Algunos mensajes responden preguntas.
  - Pepita, ¿Cuál es tu energía? ==> pepita.energia() ==> 10
- Otros mensajes disparan acciones, en estos casos nos interesa mas el *efecto colateral*
  - Pepita, ¡Volá! ==> pepita.vola(10) ==> pepita se desplaza 10 kilómetros.