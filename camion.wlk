import cosas.*

object camion {
    const cosas = []
    method agregar(cosa){
        cosas.add(cosa)
    }
    method pesoTotal(){
        var total = 1000
        cosas.forEach({c => total = total + c.peso()})
        return total
    }
    method pesosSonPares(){
        return cosas.all({c => c.peso() % 2 == 0})
    }
    method cosaDePeso(unPeso){
        return cosas.any({c => c.peso() == unPeso})
    }
    method primerCosaDePeligrosidad(nivelPeligrosidad){
        return cosas.first({c => c.nivelPeligrosidad() == nivelPeligrosidad})
    }
    method cosasDeMayorPeligrosidad(nivelPeligrosidad){
        return cosas.filter({c => c.nivelPeligrosidad() > nivelPeligrosidad})
    }
    method cosasConMayorPeligrosidadQue(unCosa){
        return self.cosasDeMayorPeligrosidad(unCosa.nivelPeligrosidad())
    }
    method estaExcedido(){
        return self.pesoTotal() > 2500
    }
    method puedeCircularEnRuta(nivelPeligrosidad){
        return !self.estaExcedido() && self.ningunObjetoEsPeligroso(nivelPeligrosidad)
    }
    method ningunObjetoEsPeligroso(nivelPeligrosidad){
        return cosas.all({c => c.nivelPeligrosidad() < nivelPeligrosidad})
    }
    method tieneCosaDePesoEntre(valorMin, valorMax){
        return cosas.any({c => c.peso() >= valorMin
                                && c.peso() <= valorMax})
    }
    method cosaMasPesada(){
        return cosas.max({c => c.peso()})
    }
}