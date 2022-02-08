import Foundation

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



//##Failable Casts
//as! (or as?) is known as a failable cast operator. You have to either use as! or as? to downcast an object to a subclass type. If you're quite sure that the downcasting will succeed, you can use as! to force the casting.
//Se você não tiver certeza se a conversão será bem-sucedida, basta usar o as?operador. Ao usar as?, ele retorna um valor opcional, mas caso o downcasting falhe, o valor será nil
//let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
