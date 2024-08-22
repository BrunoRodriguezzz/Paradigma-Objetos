# Paradigma-Objetos

Un objeto es algo que puedo representar mediante una idea o un concepto. Se puede representar de varias maneras y lo que importa no es ese algo real sino nuestra idea mental. Puede no ser algo real (una deuda, un string), pero existe en mi cabeza.

**Sistema:** Conjunto de objetos que se envian mensajes para alcanzar un determinado objetivo.
**Interfaz:** La conforman los mensajes que le puedo enviar a la entidad.
**Mensajes:** Cosas que le puedo pedir a un objeto
- Tengo que conocerlo -> se que puedo pedirle.
- No quiero saber como lo hace (saberlo me ata a el, me *acopla*) eso es propio del objeto.
**Método:** Es la porción de codigo que se ejecuta al recibir un mensaje. Mensaje /= Método.
**Ambiente:** Es el arenero en el que estan los objetos y el observador.
**Referencias:** Es lo que permite que el observador y el objeto se conozcan. Para ello se utilizan variables que es la forma en la que el observador se dirige al objeto.

## Metodo
Es el codigo que se ejecuta al recibir un mensaje. 
- Algunos mensajes responden preguntas.
    - Pepita, ¿Cuál es tu energía? ==> pepita.energia() ==> 10
- Otros mensajes disparan acciones, en estos casos nos interesa mas el *efecto colateral*
    - Pepita, ¡Volá! ==> pepita.vola(10) ==> pepita se desplaza 10 kilómetros.