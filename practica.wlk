class ArmaFilo {
    const filo
    const longitud
    method poder() = filo*longitud

    // method establecerFilo(nuevoFilo) {  //No hace falta porq cuando creemos el objeto le damos los valores
    //   if(nuevoFilo.between(0, 1)){
    //     filo = nuevoFilo
    //   }
    // }
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

class GladiadorMirmilon {
    var vida = 100
    const arma
    var armadura

    const fuerza
    method fuerza() = fuerza
    method destreza() = 15

    method cambiarArmadura(nuevaArmadura) {
        armadura = nuevaArmadura
    }

    method estoyVivo() = vida > 0

    // Atacar

    method poderAtaque() = fuerza + arma.poder()

    method atacar(enemigo) {
        const damage = self.poderAtaque() - enemigo.defensa()
        enemigo.perderVida(damage)
    }

    method perderVida(cantidad) {
        if(vida - cantidad <= 0) vida = 0
        else vida -= cantidad
    }

    method defensa() = armadura.armadura(self) + self.destreza()

    // Pelea

    method pelear(enemigo) {
        self.atacar(enemigo.campeon())
        enemigo.campeon().atacar(self)
    }

    // Grupo

    method crearGrupo(compa) {
       const grupo = new Grupo(nombre = self.nombreGrupo(compa))
       grupo.agregarMiembros(self)
       grupo.agregarMiembro(compa)
       return grupo
    }

    method nombreGrupo(compa) = "mirmiolandia"

    method campeon() = self

    method curar() {vida = 100}
}

class GladiadorDimacherus {
    var vida = 100
    const armas = []

    method fuerza() = 10
    var destreza
    method destreza() = destreza

    method perderVida(cantidad) {
        if(vida - cantidad <= 0) vida = 0
        else vida -= cantidad
    }

    method agregarArma(arma) {
        armas.add(arma)
    }

    method quitarArma(arma) {
        armas.remove(arma)
    }

    method estoyVivo() = vida > 0

    // Atacar

    method atacar(enemigo) {
        destreza += 1
        const damage = self.poderAtaque() - enemigo.defensa()
        enemigo.perderVida(damage)
    }

    method poderAtaque() = armas.sum({arma => arma.poder()}) + self.fuerza()
    method defensa() = destreza/2

    // Pelea

    method pelear(enemigo) {
        self.atacar(enemigo.campeon())
        enemigo.campeon().atacar(self)
    }

    // Grupo

    method crearGrupo(compa) {
       const grupo = new Grupo(nombre = self.nombreGrupo(compa))
       grupo.agregarMiembros(self)
       grupo.agregarMiembro(compa)
       return grupo
    }

    method nombreGrupo(compa) = "D-" + (self.poderAtaque() + compa.poderAtaque())

    method campeon() = self

    method curar() {vida = 100}
}

class Grupo {
    const miembros = []
    const nombre
    var cantPeleas = 0

    method agregarMiembro(miem) {
        miembros.add(miem)
    }

    method quitarMiembro(miem) {
        miembros.remove(miem)
    }

    method campeon() {
        const candidatos = miembros.filter({campeon => campeon.estoyVivo()})
        return candidatos.max({campeon => campeon.poder()})
    }

    method pelear(enemigo) {
      3.times(self.campeon().pelear(enemigo.campeon()))
      cantPeleas += 1
    }

    method curar() {
        miembros.forEach({campeon => campeon.curar()})
    }
}

object coliseo {
    method combatir(enemigo1,enemigo2) {
        enemigo1.pelear(enemigo2)
    }

    method curar(entidad) {
        entidad.curar()
    }
}