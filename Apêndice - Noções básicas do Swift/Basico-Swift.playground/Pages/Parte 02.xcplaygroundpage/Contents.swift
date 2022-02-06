
import Foundation
import UIKit
import Darwin

//##Visão geral dos opcionais

//Ao declarar variáveis ​​em Swift, elas são designadas como não opcionais por padrão. Em outras palavras, você deve atribuir um valor diferente de zero à variável.

//Se você tentar definir um valor nil como não opcional, o compilador dirá: "Nil(nada) não pode ser atribuído ao tipo String!"
var message: String = "Swift is awesome!" // OK
//message = nil // compile-time error //'nil' cannot be assigned to type 'String'

//O mesmo se aplica ao declarar propriedades em uma classe. As propriedades são designadas como não opcionais por padrão
class Messenger01 {
    var message1: String = "Swift is awesome!" // OK
    var results1 = [Int]() // OK
    //var message2: String // compile-time error //Stored property 'message2' without initial value prevents(impede) synthesized initializers //Você receberá um erro em tempo de compilação porque message2 não foi atribuído um valor inicial. //Ou seja tem que atribuir por padrao
}

//No entanto, isso não significa que você não possa declarar uma propriedade sem atribuir um valor inicial no Swift. Swift introduz o tipo opcional para indicar a ausência de um valor. Ele é definido adicionando um operador de ponto de interrogação ? após a declaração de tipo.

//Você ainda pode atribuir um valor quando a variável é definida como opcional. No entanto, se a variável não for atribuída com nenhum valor como o código abaixo, seu valor será automaticamente padronizado para nil

class Messenger02 {
    var message1: String = "Swift is awesome!" // OK
    var message2: String? // OK //será nil
}

var instancia1 = Messenger02()
var mensagem = instancia1.message2
//print(mensagem)

//#Por que opcionais?

//Swift é projetado para segurança. Os opcionais são um exemplo do fato de que o Swift é uma linguagem segura para tipos. Os opcionais fornecem verificações em tempo de compilação que impediriam que alguns erros comuns de programação ocorressem em tempo de execução.
//stockCodeé definido como opcional. Isso significa que ele pode conter uma string ou nil.
//Você não pode executar o código abaixo porque o compilador detecta um erro "Value of optional type 'String?' must be unwrapped to a value of type 'String'"

func findStockCode(company: String) -> String? {
    if (company == "Apple") {
        return "AAPL"
    } else if (company == "Google") {
        return "GOOG"
    }

    return nil
}

var stockCode02: String? = findStockCode(company: "Facebook")
let text02 = "Stock Code - "
//let message = text02 + stockCode02  // compile-time error
//print(message)


//#Desempacotando Opcionais
//Então, como podemos fazer o código acima funcionar? Precisamos testar se stockCode contém um valor nulo ou não.
//we used if to perform the nil-check. Once we know the optional must contain a value, we unwrap it by placing an exclamation mark (!) to the end of the optional's name.
//Isso é conhecido como desempacotamento forçado . Você usa o !operador para desdobrar um opcional e revelar o valor subjacente.
//apenas desempacotamos o stockCodeopcional após o nil-check. Sabemos que o opcional deve conter um valor diferente de zero antes de desembrulhar usando o !operador. É sempre recomendável garantir que um opcional contenha um valor antes de desembrulhar.
var stockCode03: String? = findStockCode(company: "Google")
let text03 = "Stock Code - "
if stockCode03 != nil {
    let message = text03 + stockCode03!
    print(message)
}

//Mas e se esquecermos a verificação como acima?
//Não haverá erro em tempo de compilação. O compilador assume que o opcional contém um valor quando o desempacotamento forçado é usado. Quando você executa o aplicativo, um erro de tempo de execução é mostrado no console.
var stockCode04:String? = findStockCode(company: "Facebook")
let text04 = "Stock Code - "
//let message30 = text04 + stockCode04!  // runtime error

//#opcional Vinculado - Optional Binding
//Além do desempacotamento forçado, a vinculação opcional é uma maneira mais simples e recomendada de desempacotar um opcional.
// Você usa para verificar se o opcional contém um valor ou não. Se contiver um valor, desembrulhe-o e coloque-o em uma constante ou variável temporária.
// o código diz: "Se stockCode contiver um valor, desembrulhe-o, defina seu valor tempStockCodee execute o bloco condicional. Caso contrário, pule o bloco". Como tempStockCodeé uma nova constante, você não precisa mais usar o !sufixo para acessar seu valor.
var stockCode07: String? = findStockCode(company: "Facebook")
let text07 = "Stock Code - "
if let tempStockCode = stockCode07 {
    let message07 = text07 + tempStockCode
    print(message07)
}

//Você pode simplificar ainda mais o código avaliando a função na ifinstrução
//Aqui stockCodenão é opcional. Não há necessidade de usar o !sufixo para acessar seu valor no bloco condicional. Se um nilvalor for retornado da função, o bloco não será executado.
//let text08 = "Stock Code - "
//if var stockCode08 = findStockCode(company: "Apple") {
//    let message08 = text08 + stockCode08
//    print(message08)
//}

//#Opcional Encadeado - Optional Chaining

class Stock {
    var code: String?
    var price: Double?
}

func findStockCode09(company: String) -> Stock? {
    if (company == "Apple") {
        let aapl: Stock = Stock()
        aapl.code = "AAPL" //atribuindo valor a um opcional
        aapl.price =  90.32

        return aapl

    } else if (company == "Google") {
        let goog: Stock = Stock()
        goog.code =  "GOOG"
        goog.price = 556.36

        return goog
    }

    return nil
}

//Como o valor de retorno de findStockCode()é opcional, usamos a  opcional Vinculado para verificar se ele contém um valor real. Aparentemente, a propriedade price da Stockclasse é opcional. Novamente, usamos a if let instrução para testar se stock.price contém um valor não nulo.
if let stock09 = findStockCode09(company: "Apple") {
    if let sharePrice09 = stock09.price {
        let totalCost09 = sharePrice09 * 100
        print(totalCost09)
    }
}

//(ESTUDAR DE NOVO)
//O código acima funciona sem nenhum erro. Em vez de escrever aninhado if let, você pode simplificar o código usando o Encadeamento Opcional. O recurso nos permite encadear vários opcionais junto com o ?.operador.
if let sharePrice10 = findStockCode09(company: "Apple")?.price {
    let totalCost10 = sharePrice10 * 100
    print(totalCost10)
}

//##Inicializadores com falha - Failable Initializers
//A inicialização é o processo de fornecer valores iniciais para cada uma das propriedades armazenadas de uma classe. Em alguns casos, a inicialização de uma instância pode falhar. Agora, essa falha pode ser relatada usando um inicializador com falha. O valor resultante de um inicializador com falha contém o objeto ou nil. Você precisará usar if let para verificar se a inicialização foi bem-sucedida ou não.

let myFont00 = UIFont(name : "AvenirNextCondensed-DemiBold", size: 22.0) // nao falhou e retornou objeto

let myFont01 = UIFont(name : "xxx", size: 22.0) //falhou e retornando nil

//A inicialização do UIFont objeto falhará se o arquivo de fonte não existir ou for ilegível. Essa falha de inicialização será relatada usando um inicializador com falha. O objeto retornado é um opcional que pode ser o próprio objeto ou nil. Assim, precisamos usar if let para lidar com o opcional:
//init?(name: String, size: CGFloat)
//o código diz: "Se UIFont contiver um valor, desembrulhe-o, defina seu valor myFont02 execute o bloco condicional. Caso contrário, pule o bloco". Como myFont02 é uma nova constante, você não precisa mais usar o !sufixo para acessar seu valor.
if let myFont02 = UIFont(name : "AvenirNextCondensed-DemiBold", size: 22.0) { //nao falhou e retornou um opcional de objeto //entrou no if

    print("hi myFont02 \(myFont02)")

}

if let myFont03 = UIFont(name : "yyy", size: 22.0) { //falhou e retornou opcional de nil //não entrou no if

    print("hi \(myFont03)")

}

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

//#Observadores de propriedade

//Os observadores de propriedade observam e respondem a mudanças no valor de uma propriedade. Os observadores são chamados sempre que o valor de uma propriedade é definido. Você tem a opção de definir dois tipos de observadores em uma propriedade:

//didSet é chamado imediatamente após o novo valor ser armazenado.

//willSet é chamado imediatamente antes do valor ser armazenado.

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


//##Failable Casts
//as! (or as?) is known as a failable cast operator. You have to either use as! or as? to downcast an object to a subclass type. If you're quite sure that the downcasting will succeed, you can use as! to force the casting.
//Se você não tiver certeza se a conversão será bem-sucedida, basta usar o as?operador. Ao usar as?, ele retorna um valor opcional, mas caso o downcasting falhe, o valor será nil
//let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell


//##repeat-while
//que substitui o do-while loop clássico
//repeat-while avalia sua condição no final de cada passagem pelo loop. Se a condição for true, ele repete o bloco de código novamente. Ele sai do loop quando a condição é avaliada como false
var i = 0
repeat {
    i += 1
    print(i)
} while i < 10


//##for-in where Clauses
//imprime apenas os números maiores que 100.
let numbers = [20, 18, 39, 49, 68, 230, 499, 238, 239, 723, 332]
for number in numbers where number > 100 {
    print(number)
}


//##Guard

//Antes de explicar melhor a instrução guard, vamos direto ao exemplo a seguir, onde imprimiremos as informações de um artigo com mais de mil palavras. Como as variáveis ​​são opcionais, usamos if let para verificar se o opcional contém um valor ou não.
struct Article {
     var title: String?
     var description: String?
     var author: String?
     var totalWords: Int?
}

func printInfo01(article: Article) {
    if let totalWords = article.totalWords, totalWords > 1000 { //INTERESSANTE
        if let title = article.title {
            print("Title: \(title)")
        } else {
            print("Error: Couldn't print the title of the article!")
        }
    } else {
        print("Error: It only works for article with more than 1000 words.")
    }
}

let sampleArticle01 = Article(title: "Swift Guide", description: "A beginner's guide to Swift 2", author: "Simon Ng", totalWords: 1500)
printInfo01(article: sampleArticle01)

//Como você pode notar, se você precisar testar mais condições, ele será aninhado com mais condições. Não há nada de errado com isso programaticamente. Mas em termos de legibilidade, seu código ficará confuso se houver muitas condições aninhadas.
//Se a condição definida na guardinstrução não for atendida, o código dentro da elseramificação é executado. Por outro lado, se a condição for atendida, ele ignora a elsecláusula e continua a execução do código.
//Com guard, você se concentra em lidar com a condição que não deseja. Além disso, força você a lidar com um caso de cada vez, evitando condições aninhadas. Assim, o código fica mais limpo e fácil de ler.
//Se você reescrever o código de exemplo usando guard, é muito mais limpo
func printInfo02(article: Article) {
    guard let totalWords = article.totalWords, totalWords > 1000 else {
        print("Error: It only works for article with more than 1000 words.")
        return
    }

    guard let title = article.title else {
        print("Error: Couldn't print the title of the article!")
        return
    }

    print("Title: \(title)")
}

let sampleArticle02 = Article(title: "Swift Guide", description: "A beginner's guide to Swift 2", author: "Simon Ng", totalWords: 1500)
printInfo02(article: sampleArticle02)


//##Manipulação de erros

