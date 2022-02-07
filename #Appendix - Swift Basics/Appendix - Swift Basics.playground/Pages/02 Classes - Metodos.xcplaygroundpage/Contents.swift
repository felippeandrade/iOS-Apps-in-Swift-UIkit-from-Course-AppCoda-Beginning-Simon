import Foundation

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
