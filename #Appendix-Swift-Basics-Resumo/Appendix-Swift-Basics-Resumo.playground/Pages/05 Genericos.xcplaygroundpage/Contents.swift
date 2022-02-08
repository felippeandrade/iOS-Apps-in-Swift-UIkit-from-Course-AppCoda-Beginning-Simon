import Foundation

//##Genéricos

//#Funções genéricas
//permitem que você escreva funções flexíveis.

//func process01(a: Int, b: Int) {
//     // do something
//}
//
//func process02(a: Double, b: Double) {
//     // do something
//}

//Ambas as funções são muito semelhantes. Supondo que os corpos das funções sejam idênticos, a principal diferença são os tipos de entradas que eles recebem. Com os Genéricos, você pode simplificá-los em uma função genérica que lida com vários tipos de entrada.
//Agora ele define um tipo de espaço reservado em vez de um nome de tipo real.
func process03<T>(a: T, b: T) {
     // do something
    print("genericos")
}

//Você pode chamar a função de processo da mesma maneira. O tipo real a ser usado no lugar de T será determinado cada vez que a função for chamada.
process03(a: 689, b: 3.0)

//#Funções genéricas com restrições de tipo

// Suponha que você esteja escrevendo outra função para comparar se dois valores inteiros são iguais.
func isEqual01(a: Int, b: Int) -> Bool {
    return a == b
}

//Se você precisar comparar outros tipos de valor, como String, escreverá outra função como esta:
func isEqual02(a: String, b: String) -> Bool {
    return a == b
}

//a função não compilará. O problema está na a==b verificação de igualdade. Embora a função aceite valores com qualquer tipo, nem todo tipo pode suportar o operador igual a ( ==).
//func isEqual<T>(a: T, b: T) -> Bool {
//    return a == b
//}

//Nesse caso, você precisa aplicar uma restrição de tipo para a função genérica
//Você escreve a restrição de tipo colocando uma restrição de protocolo após o nome de um parâmetro de tipo, separada por dois pontos. Aqui o Equatable é a restrição de protocolo. Em outras palavras, a função só aceitará valores que suportem o protocolo Equatable
func isEqual03<T: Equatable>(a: T, b: T) -> Bool {
    return a == b
}

//In Swift, it comes with a standard protocol called Equatable. For any types conforming to the Equatable protocol, they support the equal to (==) operator. All standard types like String, Int, Double support the Equatable protocol.
//So you can use the isEqual function like this:

isEqual03(a: 3, b: 3)             // true
isEqual03(a: "test", b: "test")   // true
isEqual03(a: 20.3, b: 20.5)       // false


//#Generic Types
//You are not limited to use Generics in functions. Swift allows you to define your own generic types. This can be custom classes or structure. The built-in (internos) Array and Dictionary are examples of generic types.

class IntStore {
    var items = [Int]()

    func addItem(item: Int) {
        items.append(item)
    }

    func findItemAtIndex01(index: Int) -> Int {
        return items[index]
    }
}

//Aparentemente, a IntStoreclasse suporta itens no Int tipo. Não seria ótimo se você pudesse definir uma ValueStoreclasse genérica que gerenciasse qualquer tipo de valor? Aqui está a versão genérica da classe.
//O parâmetro de tipo após o nome da classe indica que a classe é um tipo genérico.
class ValueStore<T> {
    var items = [T]()

    func addItem(item: T) {
        items.append(item)
    }

    func findItemAtIndex02(index: Int) -> T {
        return items[index] //o acesso de array não pode ser generico, precisa ter um numero
    }
}

//Para instanciar a classe, você escreve o tipo a ser armazenado ValueStore entre colchetes angulares.
var store = ValueStore<String>()
store.addItem(item: "This")
store.addItem(item: "is")
store.addItem(item: "generic")
store.addItem(item: "type")
let value = store.findItemAtIndex02(index: 1)
