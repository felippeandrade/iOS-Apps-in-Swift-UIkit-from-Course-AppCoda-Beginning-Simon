import Foundation

//##Propriedades computadas
//Uma propriedade computada na verdade não armazena um valor. Em vez disso, ele fornece seu próprio getter e setter para calcular o valor.
//Você poderia usar métodos em vez de propriedades computadas? Certo. Para mim, é uma questão de estilo de codificação. Propriedades computadas são especialmente úteis para realizar conversões e cálculos simples. Como você pode ver nos exemplos, a implementação é muito mais limpa.

//No passado, você poderia criar um método que realizasse o cálculo e retornasse o preço total. Com o Swift, você pode usar propriedades computadas.
//A Hotelclasse tem duas propriedades armazenadas: roomPricee roomCount.
//totalPrice é uma propriedade computada. Em vez de armazenar um valor fixo, ele define um getter personalizado que realmente realiza o cálculo e retorna o preço total dos quartos.
class Hotel01 {
    var roomCount: Int
    var roomPrice: Int
    var totalPrice: Int {
        get {
            return roomCount * roomPrice
        }
    }

    init(roomCount: Int = 10, roomPrice: Int = 100) {
        self.roomCount = roomCount
        self.roomPrice = roomPrice
    }
}

//you can access the computed property through dotted syntax
let hotel01 = Hotel01(roomCount: 30, roomPrice: 100)
print("Total price: \(hotel01.totalPrice)")


//Opcionalmente, você pode definir um setter customizado para a propriedade computada. Considere o mesmo exemplo novamente:
class Hotel02 {
    var roomCount: Int
    var roomPrice: Int
    var totalPrice: Int {
        get {
            return roomCount * roomPrice
        }

        set /*(newValue)*/ { //será Int pq totalPrice é Int //não é obrigatorio declarar (newValue)
            let newRoomPrice = Int(newValue / roomCount)
            roomPrice = newRoomPrice
        }
    }

    init(roomCount: Int = 10, roomPrice: Int = 100) {
        self.roomCount = roomCount
        self.roomPrice = roomPrice
    }
}
let hotel02 = Hotel02() //inicializei usando construtor padrao já definido da classe
hotel02.roomPrice
hotel02.totalPrice = 200 //entra no set e adiciona 200 em (newValue)
hotel02.roomPrice
print("Total price: \(hotel02.totalPrice)") //entra no get

//


class Foo {
    var myPropertyValue: Int = 0
    var myProperty: Int {
        get {
            return myPropertyValue
        }
        set {
            print("The value of myProperty changed from \(myPropertyValue) to \(newValue)")
            myPropertyValue = newValue
        }
    }
}

var x30 = Foo()

var y30 = x30.myProperty
print(y30) //myPropertyValue

x30.myProperty = 1 //imprime: The value of myProperty changed from 0 to 1 //atribui no newValue

var k30 = x30.myProperty
print(k30)

var z30 = x30.myPropertyValue
print(z30)

x30.myProperty = 2 //imprime: The value of myProperty changed from 1 to 2

//#Observadores de propriedade

//Os observadores de propriedade observam e respondem a mudanças no valor de uma propriedade. Os observadores são chamados sempre que o valor de uma propriedade é definido. Você tem a opção de definir dois tipos de observadores em uma propriedade:

//didSet é chamado imediatamente após o novo valor ser armazenado. //mais usado

//willSet é chamado imediatamente antes do valor ser armazenado. //tem comportamento igual o set

class Hotel04 {
    var roomCount: Int
    var roomPrice: Int {
        didSet { //didSet é chamado imediatamente após o novo valor ser armazenado. //não é chamado com o valor do construtor
            if roomPrice > 1000 {
                roomPrice = 1000
            }
        }
    }

    var totalPrice: Int {
        get {
            return roomCount * roomPrice
        }

        set {
            let newRoomPrice = Int(newValue / roomCount)
            roomPrice = newRoomPrice
        }
    }

    init(roomCount: Int = 10, roomPrice: Int = 100) {
        self.roomCount = roomCount
        self.roomPrice = roomPrice
    }
}

let hotel04 = Hotel04()
hotel04.roomPrice //100
hotel04.roomPrice = 4000 //sera 1000
hotel04.roomPrice //1000

//

class Hotel05{
    var roomCount: Int
    var roomPrice: Int {
        willSet { //willSet é chamado imediatamente antes do valor ser armazenado.
            if roomPrice > 1000 {
               roomPrice = 1000
                print(roomPrice)
            }
        }
    }

    var totalPrice: Int {
        get {
            return roomCount * roomPrice
        }

        set {
            let newRoomPrice = Int(newValue / roomCount)
            roomPrice = newRoomPrice
        }
    }

    init(roomCount: Int = 10, roomPrice: Int = 2000) {
        self.roomCount = roomCount
        self.roomPrice = roomPrice
    }
}

let hotel05 = Hotel05()
hotel05.roomPrice //2000
hotel05.roomPrice = 9000 //primeiro entra ou nao no no if, atribui ou nao 1000, pois depende do construtor, mas depois sempre atribui 9000
hotel05.roomPrice //9000

//

struct Person50 {
    var clothes: String {
        willSet {
            updateUI1(msg: "I'm changing from \(clothes) to \(newValue)")
            //clothes fica armazenado com valor do construtor
            //newValue é o valor atribuido la em baixo
        }

        didSet {
            updateUI1(msg: "I just changed from \(oldValue) to \(clothes)")
            //oldValue fica armazenado com valor do construtor
            //clothes é o valor atribuido la em baixo
        }
    }
}

func updateUI1(msg: String) {
    print(msg)
}

var taylor1 = Person50(clothes: "T-shirts")
taylor1.clothes = "short skirts"
