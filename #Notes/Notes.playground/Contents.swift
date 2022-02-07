import UIKit

//##Chapter 1

//As Ferramentas de Desenvolvimento, a Abordagem de Aprendizagem e a Ideia de Aplicativo
//
//UIKit e SwiftUI - tipos de estrutura de interface do usuário (frameworks)


//##Chapter 2

//#Comandos

//shift+command+enter para executar o código

//Para digitar um caractere emoji no Mac, pressione control-command+espaço.

//#String

//Swift fornece um método embutido chamado uppercased()para converter uma string para maiúscula. uppercased() é apenas uma das muitas funções internas de uma string.
//Você pode tentar usar lowercased()para converter a mensagem em letras minúsculas.
//Ou se você quiser contar o número de caracteres da string, usa-se count()
message.uppercased()
message.lowercased()
message.count

//concatenação de strings
var greeting = "Hello "
var name = "Simon"
var message = greeting + name

//A mensagem de erro exibida no console mencionou que o operador +não pode concatenar uma String variável com uma Intvariável.
var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies
//var totalPriceMessage = "The price of the book is $" + totalPrice

//Você pode escrever o código assim convertendo o inteiro em uma string:
var totalPriceMessage1 = "The price of the book is $" + String(totalPrice)

//String Interpolations
//Existe uma maneira alternativa conhecida como String Interpolations para fazer isso. Você pode escrever o código assim para criar a totalPriceMessage variável.
//Você envolve a variável para conversão de string entre parênteses, prefixada por uma barra invertida.
var totalPriceMessage2 = "The price of the book is $ \(totalPrice)"


//#Noções básicas de fluxo de controle


//if-else
var timeYouWakeUp1 = 6

if timeYouWakeUp1 == 6 {
    print("Cook yourself a big breakfast!") //usamos a printfunção para imprimir uma mensagem no console.
} else {
    print("Go out for breakfast")
}


//        if .... {
//            ....
//        } else {
//            ....
//        }


//        if .... {
//            ....
//        } else if .... {
//            ....
//        } else {
//            ....
//        }


var bonus = 5000

if bonus >= 10000 {
    print("I will travel to Paris and London!")
} else if bonus >= 5000 && bonus < 10000 { //Para especificar duas condições simultâneas, você usa &&operado
    print("I will travel to Tokyo")
} else if bonus >= 1000 && bonus < 5000 {
    print("I will travel to Bangkok")
} else {
    print("Just stay home")
}


//switch
//Você pode reescrever o exemplo acima usando switch.
var timeYouWakeUp2 = 6

switch timeYouWakeUp2 {
case 6:
    print("Cook yourself a big breakfast!")
default: //Se o valor que está sendo avaliado não corresponder a nenhum dos casos, o caso padrão será executado.
    print("Go out for breakfast")
}


var bonus2 = 5000

switch bonus2 {
case 10000...: //indica um valor maior que 10.000.
    print("I will travel to Paris and London!")
case 5000...9999: //5000...9999 define um intervalo que vai de 5.000 a 9.999
    print("I will travel to Tokyo")
case 1000...4999:
    print("I will travel to Bangkok")
default:
    print("Just stay home")
}


//#Arrays
//a ordem dos itens segue a ordem na inicialização
//permite armazenar vários valores em uma variável
//todos os valores devem ser do mesmo tipo

//ocê pode adicionar um novo item ao array chamando o método embutido append
var bookCollection = ["Tool of Titans", "Rework", "Your Move"]
bookCollection.append("Authority")

//você pode revelar o número total de itens de uma matriz.Use a countpropriedade interna:
bookCollection.count

print(bookCollection[0])
print(bookCollection[1])
print(bookCollection[2])
print(bookCollection[3])

//ou
//for-in
for index in 0...3 {
    print(bookCollection[index])
}

//ou
//O limite superior do intervalo é igual ao número total de itens menos 1. Na verdade, você pode reescrever o código assim.
//Agora, independentemente do número de itens da matriz, esse trecho de código funciona.
for index in 0...bookCollection.count - 1 {
    print(bookCollection[index])
}


//ou
for book in bookCollection {
    print(book)
}


//#dictionary
//a ordem dos itens não segue a ordem na inicialização
//Um dicionário é semelhante a um array que permite armazenar vários valores em uma variável/constante. A principal diferença é que cada valor em um dicionário está associado a uma chave. Em vez de identificar um item usando um índice, você pode acessar o item usando uma chave exclusiva.
var bookCollectionDict2:  [String: String] = ["1328683788": "Tool of Titans", "0307463745": "Rework", "1612060919": "Authority"]

//ou

var bookCollectionDict = ["1328683788": "Tool of Titans", "0307463745": "Rework", "1612060919": "Authority"]


//para acessar, usa-se chave exclusiva
bookCollectionDict["0307463745"]

//Para iterar sobre todos os itens do dicionário, você também pode usar o for-in
for (key, value) in bookCollectionDict {
    print("ISBN: \(key)")
    print("Title: \(value)")
}

//#Opcionais
//Diferentes linguagens de programação têm estratégias diferentes para encorajar os programadores a escrever um bom código ou código menos propenso a erros. A introdução de Optionals é a maneira do Swift de ajudar os programadores a escrever um código melhor, evitando assim travamentos de aplicativos.
//Antes de acessar uma variável que pode não ter valor, o Swift recomenda que você a verifique primeiro. Você deve certificar-se de que tenha um valor antes de qualquer processamento adicional. Assim, isso pode evitar falhas no aplicativo.
//Em algumas situações, você precisa declarar uma variável sem valor inicial. Imagine que você está desenvolvendo um aplicativo com um formulário de registro. Nem todos os campos do formulário são obrigatórios, alguns campos (por exemplo, cargo) são opcionais. Nesse caso, as variáveis ​​desses campos opcionais podem não ter valores
//opcional é apenas um tipo em Swift. Esse tipo indica que a variável pode ter um valor ou nenhum valor.
//você precisa especificar explicitamente o tipo de uma variável opcional (por exemplo String, , Int).
var jobTitle: String? //imprime nil //Para qualquer variável opcional sem valor, um valor especial chamado nilé atribuído a ela. //nil é o mesmo que nao tem valor

//Se você tiver que atribuir um valor a uma variável opcional, você pode fazer isso normalmente assim:
jobTitle = "iOS Developer"


//#Desempacotamentoforçado de opcionais

//Você tem que fazer algumas verificações antes de usar a variável opcional.
// Sempre que você precisar acessar uma variável opcional, o Xcode força você a realizar uma verificação para descobrir se a opcional possui um valor.
//var jobTitle2: String?
//jobTitle2 = "xxxxx"
//var message2 = "Your job title is " + jobTitle2

// Swift oferece algumas maneiras Desembrulho. Primeiro, é conhecido como instruções if e desempacotamento forçado

var jobTitle3: String?
jobTitle3 = "xxxxx"
if jobTitle3 != nil { //Se o opcional tiver um valor, você desempacotará seu valor para processamento adicional.
    var message3 = "Your job title is " + jobTitle3! //Quando precisar acessar o valor de jobTitle, adicione um ponto de exclamação ( !) ao final da variável opcional. Este ponto de exclamação é um indicador especial, informando ao Xcode que você garante que a variável opcional tenha um valor e que seja seguro usá-lo
    print(message3)
}


//#Optional Binding (opcional encadeado)
//O desempacotamento forçado é uma maneira de acessar o valor subjacente de uma variável opcional. A outra maneira é chamada de ligação opcional e é a maneira recomendada de trabalhar com opcionais.
var jobTitle4: String?
jobTitle4 = "xxxxx"
if let jobTitleWithValue = jobTitle4 { // valor é atribuído à constante temporária jobTitleWithValue //ou: jobTitle4 = jobTitle4 // Mesmo que os nomes sejam os mesmos, na verdade existem duas variáveis ​​no código
    var message4 = "Your job title is " + jobTitleWithValue //Como você pode ver, não há necessidade de adicionar o !sufixo.
    print(message4)
}

//#Chapter 3 //Olá Mundo! Crie seu primeiro aplicativo em Swift

//#Criando projeto
//Nome do produto: HelloWorld //tudo junto

//#Comandos

//no Mac sem retina, pode não ser possível mostrar a janela completa do simulador. Você pode selecionar o simulador e pressionar command+1 para reduzi-lo.no Mac sem retina, pode não ser possível mostrar a janela completa do simulador. Você pode selecionar o simulador e pressionar command+1 para reduzi-lo.

//O simulador funciona praticamente como um iPhone real. Você pode clicar no botão home (ou pressionar shift-command-h) para abrir a tela inicial.

//Se você não precisar de nenhum dos simuladores, você pode selecionar o simulador e pressionar command+w para fechá-lo.

//Caso as palavras/textos estejam truncadas num label/botao, você pode redimensionar o label/botão para ajustá-lo ou pressionar command+= para deixar o Xcode redimensioná-lo para você.

//#Um passo a passo rápido do Interface Builde
// interface de usuário (storyboards)
//O Xcode então traz um editor visual para storyboards, conhecido como Interface Builder. O editor do Interface Builder fornece uma maneira visual para você criar e projetar a interface do usuário de um aplicativo.

//Since we chose to use the App template during project creation, Xcode generated a default view controller scene in the storyboard.

//Uma cena no storyboard representa um controlador de visualização e suas visualizações.
//Ao desenvolver aplicativos iOS, as visualizações são os blocos de construção básicos para criar sua interface de usuário. Cada tipo de visualização tem sua própria função. Por exemplo, a visualização que você encontra no storyboard é uma visualização de contêiner para conter outras visualizações, como botões, rótulos, visualizações de imagens, etc.
//Um controlador de visualização é projetado para gerenciar sua visualização e subvisualizações associadas (por exemplo, botão e rótulo).

//A visualização Document Outline do editor Interface Builder mostra uma visão geral de todas as cenas e os objetos em uma cena específica.


//#Chapter 4
//Explicação do aplicativo Hello World
