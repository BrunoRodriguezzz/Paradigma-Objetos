// Parcial planetas

class Persona{
    var property monedas = 20
    var edad

    method recursos() = monedas

    method gastarmonedas(cantidad){
        if(monedas-cantidad < 0){
            //Error
        }
        else monedas -= cantidad
    }

    method conseguirmonedas(cantidad){
        monedas += cantidad
    }

    method esDestacado() =  edad.between(18, 65) || monedas > 30

    method cumplirAnios(){edad += 1}
}

class Muralla{
    var property longitud
    method valor() = 10*longitud
}

class Museo{
    var property superficie
    var property importancia
    method valor() = superficie*importancia
}

class Planeta{
    const personas
    const construcciones

    method agregarContruccion(construccion) {construcciones.add(construccion)}
    method delegacionDiplomatica() = personas.filter({p => p.esDestacado() || p == self.masmonedas()})
    method masmonedas() = personas.max({p => p.monedas()})
    method esFamosos() = construcciones.all({c => c.valor()>100})
    method estaPersona(persona) = personas.contains(persona)
}

class Productor inherits Persona(){
    const tecnicas = ["cultivo"]

    method aprenderTecnica(tecnica){tecnicas.add(tecnicas)}
    override method recursos() = monedas*tecnicas.size()
    override method esDestacado() = super() || tecnicas.size() > 5

    method trabajar(tecnica, tiempo) {
        if(tecnicas.contains(tecnica)){
            monedas += 3*tiempo
        }
        else monedas -= 1
    }

    method trabajarPlaneta(planeta, tiempo){
        if(planeta.estaPersona(self) && !tecnicas.isEmpty()){
            self.trabajar(tecnicas.last(), tiempo)
        }
    }
}

class Constructor inherits Persona(){
    const construccionesHechas
    const origen

    override method recursos() = monedas + 10*construccionesHechas.size()
    override method esDestacado() = construccionesHechas.size() > 5
    method trabajarPlaneta(planeta, tiempo) {
        const queConstrui = origen.queConstruyo(self, tiempo)
        planeta.agregarContruccion(queConstrui)
        construccionesHechas.add(queConstrui)
        self.gastarmonedas(5)
    }
}

object montania{
    method queContruyo(persona, tiempo) {
        const nuevaMuralla = new Muralla(longitud = tiempo/2)
        return nuevaMuralla
        }  
}

object costa{
    method queConstruyo(persona, tiempo) {
        const nuevoMuseo = new Museo(superficie = tiempo, importancia = 1)
        return nuevoMuseo
    }
}

object llanura{
    method queConstruyo(persona, tiempo){
        if(persona.esDestacado()){
            const nuevoMuseo = new Museo(superficie = tiempo, importancia = persona.proporcional())
            return nuevoMuseo
        }
        else {
            const nuevaMuralla = new Muralla(longitud =  tiempo/2)
            return nuevaMuralla
        }
    }
}

