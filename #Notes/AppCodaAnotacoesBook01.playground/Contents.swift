import UIKit

//#Chapter 1

//As Ferramentas de Desenvolvimento, a Abordagem de Aprendizagem e a Ideia de Aplicativo
//
//UIKit e SwiftUI - tipos de estrutura de interface do usuário (frameworks)


//#Chapter 2

//shift+command+enter para executar o código

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
