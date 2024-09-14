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