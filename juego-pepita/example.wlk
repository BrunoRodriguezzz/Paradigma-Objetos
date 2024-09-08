
object pepita {
    var energia = 100
    var position = game.at(1,10)

    method position() = position
    method position(newPos) {
        position = newPos
    }

    method image() = "pepita..png"

    method estaCansada() = energia < 20

    method volar() {
      energia -= 10
    }

    method comer(comida) {
      energia += comida.energia()
    }
}

object alpiste {

  method energia() = 30

  method position() = game.at(10,10)
  method image() = "alpiste.png"
}

object manzana {
  method energia() = 40
  method position() = game.at(3,5)
  method image() = "manzana.png"
}