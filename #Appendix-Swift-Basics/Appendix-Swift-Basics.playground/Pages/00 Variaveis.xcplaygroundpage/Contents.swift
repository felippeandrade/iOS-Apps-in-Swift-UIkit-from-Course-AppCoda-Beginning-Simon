import Foundation


//#Variáveis, Constantes e Inferência de Tipos

var numberOfRows = 50
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
