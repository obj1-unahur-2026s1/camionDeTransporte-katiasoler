
object knightRider {
    method peso(){
        return 500
    }
    method nivelPeligrosidad(){
        return 10
    }
}
object bumblebee {
    var estaTransformado = false
    method peso(){
        return 800
    }
    method transformar(){
        estaTransformado = !estaTransformado
    }
    method nivelPeligrosidad(){
        if ( estaTransformado ) {
          return  15
        }
        return 30
    }
}
object paqueteDeLadrillos {
    var ladrillos = 1
    method peso(){
        return ladrillos * 2
    }
    method ladrillos(cantidad){
        ladrillos = cantidad
    }
    method nivelPeligrosidad(){
        return 2
    }
}
object arenaAgranel {
    var property peso = 0
    method nivelPeligrosidad(){
        return 1
    }
}
object bateria {
    var estaConMisiles = true
    method estaConMisiles(){
        estaConMisiles = true
    }
    method estaSinMisiles(){
        estaConMisiles = false
    }
    method peso(){
        if (estaConMisiles){
            return 300
        }
        return 200
    }
    method nivelPeligrosidad(){
        if ( estaConMisiles ){
            return 100
        }
        return 0
    }
}
object contenedorPortuario { 
    const cosas = []
    method agregar(cosa){
        cosas.add(cosa)
    }
    method peso(){
        var total = 100
        cosas.forEach({c =>  total = total + c.peso()})  
        return total
    }
    method nivelPeligrosidad(){
        if (self.estaVacio()){
            return 0
        }
        return cosas.max({c => c.nivelPeligrosidad()}).nivelPeligrosidad()
    }
    method estaVacio(){
        return cosas.isEmpty()
    }
}
object residuosRadiactivos {
    var property peso = 0
    method nivelPeligrosidad(){
        return 200
    }
}
object embalaje {
    var cosa = bateria
    method embalarA(unaCosa){
        cosa = unaCosa 
    }
    method peso(){
        return cosa.peso()
    }
    method nivelPeligrosidad(){
        return cosa.nivelPeligrosidad() / 2
    }
}