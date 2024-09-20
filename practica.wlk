class ArmaFilo {
    var filo
    const longitud
    method poder() = filo*longitud

    method establecerFilo(nuevoFilo) {  //No hace falta porq cuando creemos el objeto le damos los valores
      if(nuevoFilo.between(0, 1)){
        filo = nuevoFilo
      }
    }
}

class ArmaContundente {
    const peso
    method poder() = peso
}

class Casco {
    method armadura(peleador) = 5     //Recibe el peleador para que sea polimorfico( casco - escudo )
}

class Escudo {
    method armadura(peleador) = 5 + 0.1* peleador.destreza()
}

class GladiadoresMirmilones {
    var vida = 100
    const arma
    var armadura

    const fuerza
    method fuerza() = fuerza
    method destreza() = 15

    method cambiarArmadura(nuevaArmadura) {
        armadura = nuevaArmadura
    }

    // Pelea

    method poderAtaque() = fuerza + arma.poder()

    method atacar(enemigo) {
        const damage = self.poderAtaque() - enemigo.defensa()
        if(damage > 0) enemigo.perderVida(damage)
    }

    method perderVida(cantidad) {
        if(vida - cantidad <= 0) vida = 0
        else vida -= cantidad
    }
}

class GladiadoreDimacherus {
    var vida = 100
    const arma 

    method fuerza() = 10
    const destreza
    method destreza() = destreza
}
