import UIKit



//#Variáveis, Constantes e Inferência de Tipos

var numberOfRows = 30
let maxNumberOfRows = 100

//count is inferred to be of type Int
let count = 10

//price is inferred to be of type Double
var price = 23.55

//myMessage is inferred to be of type String
var myMessage1 = "Swift is the future!"

//O exemplo abaixo mostra como especificar informações de tipo ao declarar uma variável no Swift:
var myMessage2: String = "Swift is the future!"



//#Sem ponto e vírgula

//o Swift não exige que você escreva um ponto e vírgula ( ;) após cada instrução, embora você ainda possa fazê-lo se quiser.



//#Manipulação Básica de Strings

//Concatenar strings é super fácil. Basta adicionar duas strings usando o +operador:
let firstMessage = "Swift is awesome."
let secondMessage = "What do you think?"
var message = firstMessage + secondMessage
print(message)

//print é uma função global no Swift para imprimir a mensagem no console.

//A comparação de strings é mais direta. Você pode usar o ==operador para comparar duas strings como esta:
var string1 = "Hello"
var string2 = "Hello"
if string1 == string2 {
    print("Both are the same")
}

//#O Swift fornece três tipos de coleção principais: arrays , dictionaries e sets.



//#Array(Matriz)

//arrays em Swift só podem armazenar itens do mesmo tipo. No exemplo abaixo, você só pode armazenar strings no array de strings.
var recipes1 = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich"]

//Mas se desejar, você também pode especificar o tipo no seguinte formulário:
var recipes2 : [String] = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich"]

//O Swift fornece vários métodos para você consultar e manipular um array. Basta usar o método count para encontrar o número de itens na array:
var numberOfItems = recipes2.count // recipes.count will return 5

//O Swift torna as operações em array muito mais simples. Você pode adicionar um item usando o +=operador:
recipes2 += ["Thai Shrimp Cake"]

//Isso também se aplica quando você precisa adicionar vários itens:
recipes2 += ["Creme Brelee", "White Chocolate Donut", "Ham and Cheese Panini"]

//Para acessar ou alterar um item específico em uma array, passe o índice do item usando a sintaxe de subscrito como em Objective-C e outras linguagens de programação:
var recipeItem1 = recipes2[0]
recipes2[1] = "Cupcake"

//Um recurso interessante do Swift é que você pode usar …para alterar um intervalo de valores. Aqui está um exemplo:
recipes2[1...3] = ["Cheese Cake", "Greek Salad", "Braised Beef Cheeks"] //Isso altera o item 2 a 4 do array de receitas para "Cheese Cake", "Greek Salad" e "Braised Beef Cheeks". (Lembre-se de que o primeiro item em uma array começa com o índice 0. É por isso que o índice 1 se refere ao item 2.)



//#Dicionários

//Cada valor em um dicionário está associado a uma chave exclusiva.
var companies1 =
[
    "AAPL" : "Apple Inc",
    "GOOG" : "Google Inc",
    "AMZN" : "Amazon.com, Inc",
    "FB" : "Facebook Inc"
]

//se desejar, você pode especificar as informações de tipo usando a seguinte sintaxe
var companies2: [String: String] = ["AAPL" : "Apple Inc", "GOOG" : "Google Inc", "AMZN" : "Amazon.com, Inc", "FB" : "Facebook Inc"]

//Para iterar em um dicionário, use o for-inloop
for (stockCode, name) in companies2 {
    print("\(stockCode) = \(name)")
}

// You can also use the keys and values properties to
// retrieve the keys and values of the dictionary.
for stockCode in companies2.keys {
    print("Stock code = \(stockCode)")
}
for name in companies2.values {
    print("Company name = \(name)")
}

//Se você quiser adicionar um novo par chave-valor ao dicionário, simplesmente use a chave como o subscrito e atribua a ela um valor como abaixo:
companies2["TWTR"] = "Twitter Inc"


//#Set (conjunto)

//Enquanto um array é uma coleção ordenada, um conjunto é uma coleção não ordenada.
//Os itens em uma array podem ser duplicados. Um conjunto não armazena valores repetidos.

//A sintaxe é muito semelhante à criação de uma matriz, mas você precisa especificar explicitamente o tipo Set.
var favoriteCuisines1: Set = ["Greek", "Italian", "Thai", "Japanese"]

//se você declarar um conjunto de valores duplicados, o conjunto não armazenará as duplicatas. Aqui está um exemplo:
var favoriteCuisines2: Set = ["Greek", "Greek", "Italian", "Thai", "Japanese", "Italian"]

//As operações em conjuntos são bastante semelhantes a uma matriz. Você pode usar for-inloop para iterar sobre um conjunto. Mas para adicionar um novo item a um conjunto, você não pode usar o +=operador. Você tem que chamar o insertmétodo:
favoriteCuisines2.insert("Indian")

//Com conjuntos, você pode determinar facilmente os valores que dois conjuntos têm em comum ou vice-versa. Por exemplo, você usa dois conjuntos para representar os pratos favoritos de duas pessoas:
var favoriteCuisines3: Set = ["Greek", "Italian", "Thai", "Japanese"]
var petersFavoriteCuisines: Set = ["Greek", "Indian", "French", "Japanese"]

//Você quer descobrir as cozinhas comuns que ambos amam. Você pode chamar o intersectionmétodo assim:
favoriteCuisines3.intersection(petersFavoriteCuisines) //Isso retornará o resultado: {"Greek", "Japanese"}.

//Ou se você quiser determinar quais cozinhas eles não têm em comum, você pode usar o symmetricDifferencemétodo:
favoriteCuisines3.symmetricDifference(petersFavoriteCuisines) // Result: {"French", "Italian", "Thai", "Indian"}


//#Classes

//definimos uma Recipeclasse com três propriedades, incluindo duração do nome e ingredientes. O Swift exige que você forneça os valores padrão das propriedades. Você terminará com um erro de compilação se os valores iniciais estiverem ausentes.
class Recipe1 {
    var name: String = ""
    var duration: Int = 10
    var ingredients: [String] = ["egg"]
}

//E se você não quiser atribuir um valor padrão? O Swift permite que você escreva um ponto de interrogação ( ?) após o tipo de um valor que indica que o valor é opcional.
//No código abaixo, as propriedades namee ingredientssão atribuídas automaticamente com um valor padrão de nil
class Recipe2 {
    var name: String?
    var duration: Int = 10
    var ingredients: [String]?
}

//ara criar uma instância de uma classe, basta usar a sintaxe abaixo:
var recipeItem = Recipe1()
// You use the dot notation to access or change the property of an instance.
recipeItem.name = "Mushroom Risotto"
recipeItem.duration = 30
recipeItem.ingredients = ["1 tbsp dried porcini mushrooms", "2 tbsp olive oil", "1 onion, chopped", "2 garlic cloves", "350g/12oz arborio rice", "1.2 litres/2 pints hot vegetable stock", "salt and pepper", "25g/1oz butter"]

//Swift permite que você subclassifique classes e adote protocolos. Por exemplo, se você tiver uma SimpleTableViewController classe que se estende de UIViewController e adota protocolos UITableViewDelegatee UITableViewDataSource, você pode escrever a declaração de classe assim:
//class SimpleTableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{}


//#Métodos

//o Swift permite definir funções em uma classe conhecida como método

//Aqui está um método de amostra sem valores de retorno e parâmetros:

class TodoManager1 {
    func printWelcomeMessage() {
        print("Welcome to My ToDo List")
    }
}

//No Swift, você chama um método usando a sintaxe de ponto:
var todoManager1 = TodoManager1()
todoManager1.printWelcomeMessage()

//Se você precisar declarar um método com parâmetros e valores de retorno, o método ficará assim.
//O método usa um parâmetro de nome no tipo String como entrada.
//O -> operador é usado como um indicador para métodos com um valor de retorno.
//No código acima, você especifica um tipo de Int retorno que retorna o número total de itens de tarefas pendentes
class TodoManager2 {
    func printWelcomeMessage(name:String) -> Int {
        print("Welcome to \(name)'s ToDo List")

        return 10
    }
}

var todoManager2 = TodoManager2()
let numberOfTodoItem = todoManager2.printWelcomeMessage(name: "Simon")
print(numberOfTodoItem)


//#Control Flow (fluxo de controle) e loops

//o Swift fornece um loop for-in para percorrer arrays, dicionários e sets



//##for loops
//Caso você queira apenas iterar em um intervalo de valores, você pode usar os operadores ...ou . ..<
//qual é a diferença entre ..<e ...?
//Se substituirmos o ..<operador por ..., isso definirá um intervalo que vai de 0 a 5 e 5 será incluído no intervalo.
for i in 0..<5 {
    print("index = \(i)")
}


//##if-else statement
//você pode usar a instrução if para executar o código com base em uma determinada condição
var bookPrice = 1000;
if bookPrice >= 999 {
    print("Hey, the book is expensive")
} else {
    print("Okay, I can affort it")
}



//##switch statement

//No Swift, você não precisa adicionar a instrução break explicitamente. As instruções switch no Swift não caem na parte inferior de cada caso e no próximo. Assim que o primeiro case correspondente for concluído, toda a instrução switch completará sua execução.
var recipeName = "Egg Benedict"

switch recipeName {
    case "Egg Benedict":
        print("Let's cook!")
    case "Mushroom Risotto":
        print("Hmm... let me think about it")
    case "Hamburger":
        print("Love it!")
    default:
        print("Anything else")
}

//a instrução switch agora suporta correspondência de intervalo.
var speed = 50

switch speed {
case 0:
    print("stop")
case 0...40:
    print("slow")
case 41...70: //incluindo 41 e 70.
    print("normal")
case 71..<101: //intervalo que vai de 71 a 100. 100 é excluído
    print("fast")
default:
    print("not classified yet")
}
// as the speed falls within the range of 41 and 70, it'll print normal to console

//##Tuples

//As tuplas permitem que os desenvolvedores criem um grupo de valores e os distribuam
//As tuplas tratam vários valores como um único valor composto.
//você pode colocar qualquer valor de qualquer tipo dentro de uma tupla.

//O código abaixo cria uma tupla que inclui: o código da ação, o nome da empresa e o preço da ação.
let company = ("AAPL", "Apple Inc", 93.5)

//Você pode decompor os valores das tuplas e usá-lo assim:
let (stockCode, companyName, stockPrice) = company
print("stock code = \(stockCode)")
print("company name = \(companyName)")
print("stock price = \(stockPrice)")

//Uma maneira melhor de usar tupla é dar um nome a cada elemento na tupla e você pode acessar o valor do elemento usando a notação de ponto.
let product = (id: "AP234", name: "iPhone X", price: 599)
print("id = \(product.id)")
print("name = \(product.name)")
print("price = USD\(product.price)")

//Um uso comum de tuplas é servir como um valor de retorno. Em alguns casos, você deseja retornar vários valores em um método sem usar uma classe personalizada ou em vez de retornar um objeto personalizado.
class Store10 {
    func getProduct(number: Int) -> (id: String, name: String, price: Int) {
        var id = "IP435", name = "iMac", price = 1399 //outra forma de criar uma variavel
        switch number {
        case 1:
            id = "AP234"
            name = "iPhone X"
            price = 999
        case 2:
            id = "PE645"
            name = "iPad Pro"
            price = 599
        default:
            break
        }

        return (id, name, price)
    }
}

let store = Store10()
let product10 = store.getProduct(number: 2)
print("id = \(product10.id)")
print("name = \(product10.name)")
print("price = USD\(product10.price)")
