import Foundation

//##Manipulação de erros

//Os clientes podem usar o carrinho para armazenar temporariamente e conferir seus itens, mas esse carrinho gerará um erro nas seguintes condições:
//O carrinho de compras só pode armazenar no máximo 5 itens. Caso contrário, ele lança um cartIsFullerro.
//Deve haver pelo menos um item no carrinho de compras durante a finalização da compra. Caso contrário, ele lança um cartIsEmptyerro.
//Em Swift, os erros são representados por valores de tipos em conformidade com o Errorprotocolo.
//Normalmente, você usa uma enumeração para modelar as condições de erro. Nesse caso, você pode criar uma enumeração que adote Errorassim para os erros do carrinho de compras:

enum ShoppingCartError: Error {
    case cartIsFull
    case emptyCart
}


struct Item {
    var price:Double
    var name:String
}

// Anexamos a palavra- throws chave na declaração do método para indicar que o método pode gerar um erro.
//Para lançar um erro, basta escrever a palavra- throwchave, seguida pelo erro real
//Na implementação, usamos guard para garantir que o número total de itens seja menor que 5. Caso contrário, lançamos o ShoppingCartError.cartIsFullerro
class LiteShoppingCart {
    var items:[Item] = []

    func addItem(item: Item) throws {
        guard items.count < 5 else { //se for falsa (carrinho mais de 5 itens), entra no else, caso contrario pula o else e adiciona item.
            throw ShoppingCartError.cartIsFull
        }

        items.append(item)
    }

    func checkout() throws {
        guard items.count > 0 else { //Se o carrinho não contiver nenhum item, lançamos o ShoppingCartError.emptyCarterro.
            throw ShoppingCartError.emptyCart
        }
        // Continue with the checkout
    }
}

//Como o checkout método pode gerar um erro, usamos a do-catch instrução para capturar os erros
//ele detectará o ShoppingCartError.emptyCart erro e imprimirá a mensagem de erro de acordo, porque não adicionamos nenhum item.
let shoppingCart = LiteShoppingCart()
do {//INTERESSANTE a forma como acessa a struct Item e atribui
    //Aqui tentamos adicionar um total de 6 itens ao shoppingCartobjeto. Novamente, ele gerará um erro porque o carrinho de compras não pode conter mais de 5 itens.
    try shoppingCart.addItem(item: Item(price: 100.0, name: "Product #1"))
    try shoppingCart.addItem(item: Item(price: 100.0, name: "Product #2"))
    try shoppingCart.addItem(item: Item(price: 100.0, name: "Product #3"))
    try shoppingCart.addItem(item: Item(price: 100.0, name: "Product #4"))
    try shoppingCart.addItem(item: Item(price: 100.0, name: "Product #5"))
    try shoppingCart.addItem(item: Item(price: 100.0, name: "Product #6"))
    
    try shoppingCart.checkout() //se carrinho tiver vazio, entao retornara throw ShoppingCartError.emptyCart que é pegado pelo catch abaxio.
    print("Successfully checked out the items!")
} catch ShoppingCartError.cartIsFull {
    print("Couldn't add new items because the cart is full")
} catch ShoppingCartError.emptyCart {
    print("The shopping cart is empty!")
} catch { //se nao especificar os catch acima, ele entrara aqui e imprimira por ex: cartIsFull
    print(error)
}


//##Verificação de disponibilidade

//Observação: você não pode testar a verificação de disponibilidade no Playgrounds. Se você quiser experimentá-lo, crie um novo projeto Xcode para testar o recurso.
//Exemplo de uso: a propriedade safeAreaLayoutGuide de UIViewe stá disponível apenas no iOS 12 (ou posterior). Se você usar a propriedade em versões mais antigas do iOS, acabará com um erro e isso provavelmente causará uma falha no aplicativo.
//O Swift possui suporte integrado para verificar a disponibilidade da API. Você pode definir facilmente uma condição de disponibilidade para que o bloco de código seja executado apenas em determinadas versões do iOS. Aqui está um exemplo.
//Você usa a palavra- #availablechave na ifinstrução. Na condição de disponibilidade, você especifica as versões do SO (por exemplo, iOS 14) que deseja verificar. O *é obrigatório e indica que a ifcláusula é executada no destino mínimo de implantação e em qualquer outra versão do SO. Para o exemplo acima, o corpo do ifserá executado no iOS 12 ou superior e em outras plataformas, como watchOS.
if #available(iOS 12.0, *) {
    // iOS 12 or up
    let view = UIView()
    let layoutGuide = view.safeAreaLayoutGuide
} else {
    // Fallback on earlier versions (recorrer a versões anteriores)
}

//Da mesma forma, você pode usar guardem vez de ifverificar a disponibilidade da API. Aqui está outro exemplo:
guard #available(iOS 12.0, *) else { //se for false, entra no else
    // what to do if it doesn't meet the minimum OS requirement
    //return
}
let view = UIView()
let layoutGuide = view.safeAreaLayoutGuide

//E se você quiser desenvolver uma classe ou método que esteja disponível para determinadas versões do SO? O Swift permite que você aplique o @availableatributo em classes/métodos/funções para especificar a plataforma e a versão do SO que você deseja atingir. Digamos, por exemplo, que você está desenvolvendo uma classe chamada SuperFancye ela está disponível apenas para iOS 12 ou posterior. Você pode aplicar @availableassim:
@available(iOS 12.0, *)
class SuperFancy {
    // implementation
}
