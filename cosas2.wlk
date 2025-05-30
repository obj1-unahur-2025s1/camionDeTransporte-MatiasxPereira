object knightRider {
    method peso() = 500
    method peligrosidad() = 10 
    method bultos() = 1
    method consecuenciaDeLaCarga() {} 
}

object bumblebee {
    var estaComoRobot = false
    method estaComoRobot() = estaComoRobot
    method transformarseEnAuto() {estaComoRobot = false}
    method transformarseEnRobot() {estaComoRobot = true} 
    method peso() = 800 
    method peligrosidad() = if(estaComoRobot) 30 else 15    
    method bultos() = 2
    method consecuenciaDeLaCarga() {self.transformarseEnRobot()} 

}

object ladrillos {
    var cantidad = 0
    method cantidad(unaCantidad) {cantidad = unaCantidad}
    method peso() = 2 * cantidad
    method peligrosidad() = 2  
    method bultos() = if (cantidad<=100) 1
                      else if (cantidad.between(101,300)) 2
                      else 3
    method consecuenciaDeLaCarga() {cantidad+=12} 
}

object arena {
    var property peso = 0
    //method peso(unPeso) {peso=unPeso}
    //method peso() = peso
    method peligrosidad() = 1    
    method bultos() = 1
    method consecuenciaDeLaCarga() {peso = 0.max(peso - 10)}
}

object bateriaAntiAerea {
    var estaConMisiles = false
    method cargarMisiles() {estaConMisiles = true}
    method descargarMisiles() {estaConMisiles = false}
    method peso() = if(estaConMisiles) 300 else 200
    method peligrosidad() = if(estaConMisiles) 100 else 0   
    method bultos() = if(estaConMisiles) 2 else 1
    method consecuenciaDeLaCarga() {self.cargarMisiles()}
}

object contenedorPortuario {
    const cosas = []
    method agregarCosa(unaCosa) {cosas.add(unaCosa)}
    method quitarCosa(unaCosa) {cosas.remove(unaCosa)}
    method agregarVariasCosas(unaListaDeCosas) {cosas.addAll(unaListaDeCosas)}
    method peso() = 100 + self.pesoDeLasCosas()
    method pesoDeLasCosas() = cosas.sum({c => c.peso()})
    method peligrosidad() = if(cosas.isEmpty()) 0 else cosas.max({c => c.peligrosidad()}).peligrosidad()
    method bultos() = 1 + cosas.sum({c=>c.bultos()})  
    method consecuenciaDeLaCarga() {cosas.forEach({c=>c.consecuenciaDeLaCarga()})}
}

object residuosRadiactivos {
    var property peso = 0
    method peligrosidad() = 200
    method bultos() = 1
    method consecuenciaDeLaCarga() {peso() += 15}
}

object embalaje {
    var property cosaEnvuelta = arena 
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2  
    method bultos() = 2
    method consecuenciaDeLaCarga() {}
}