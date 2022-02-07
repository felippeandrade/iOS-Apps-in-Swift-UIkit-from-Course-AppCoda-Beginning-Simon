import Foundation

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
//Se a condição definida na guardinstrução não for atendida, o código dentro da else ramificação é executado. Por outro lado, se a condição for atendida, ele ignora a else cláusula e continua a execução do código.
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
