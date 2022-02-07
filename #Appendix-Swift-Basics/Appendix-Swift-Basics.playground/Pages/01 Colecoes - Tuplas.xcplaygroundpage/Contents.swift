import Foundation

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
