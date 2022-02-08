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
var greeting = "Hello"
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

//o botão que interage com você é comumente caracterizado como a interface e os detalhes internos que se escondem atrás do botão são chamados de implementação . A interface se comunica com a implementação por meio de uma mensagem.

// Os objetos da interface do usuário (por exemplo, botão) se comunicam com o código por meio de mensagens.

//se você voltar ao projeto Hello World, o botão que você adicionou na visualização é a interface. O showMessage(sender:)método da ViewControllerclasse é a implementação. Quando alguém toca no botão, ele envia uma mensagem showMessageWithSender para ViewController por meio da invocação do método showMessage(sender:).
//O que acabamos de demonstrar é um dos conceitos importantes por trás da Programação Orientada a Objetos conhecido como Encapsulamento . A implementação do showMessage(sender:)método está oculta do mundo exterior (ou seja, a interface).O botão Hello World não tem ideia de como o showMessage(sender:)método funciona. Tudo o que sabe é que precisa enviar uma mensagem. O showMessage(sender:)método trata do resto exibindo uma mensagem.

//Assim como o Objective-C, o Swift é uma linguagem de programação orientada a objetos (OOP). A maior parte do código em um aplicativo

//No iOS, os aplicativos são baseados em programação orientada a eventos. Seja um objeto do sistema ou um objeto de interface do usuário, ele escuta determinados eventos para determinar o fluxo do aplicativo. Para um objeto de interface do usuário (por exemplo, Button), ele pode ouvir um evento de toque específico. Quando o evento é acionado, o objeto chama o método predefinido associado ao evento.
//Abra Mainn ovamente e selecione o botão "Hello World". Clique no ícone do Inspetor de conexão na área Utilitário. Na seção Eventos enviados, você deve encontrar uma lista de eventos disponíveis e seu método correspondente para chamar. Como você pode ver na figura abaixo, o evento "Touch Up Inside" está conectado ao showMessage(sender:)método ou showMessageWithSender

//No aplicativo Hello World, quando os usuários levantam o dedo dentro do botão, o evento "Touch Up Inside" é acionado. Conseqüentemente, ele chama o showMessage(sender:)método para exibir a mensagem "Hello World". Usamos o evento "Touch Up Inside" em vez de "Touch Down" porque queremos evitar um toque acidental ou falso.

//#Metodos
//Um método não precisa receber parâmetros. Nesse caso, você simplesmente escreve um par de parênteses vazio assim:

func showMessage() { }

//Opcionalmente, um método pode receber parâmetros como entrada. Os parâmetros são definidos entre parênteses.

//Em nosso exemplo, o método aceita um sender parâmetro que possui um tipo UIButton. O sender parâmetro indica o objeto (botao) que envia a solicitação. Em outras palavras, ele informa o botão que o usuário tocou. O sender parâmetro indica o objeto que envia a solicitação. Em outras palavras, ele informa o botão que o usuário tocou.

//#@IBAction
//Essa palavra-chave permite que você conecte seu código-fonte aos objetos da interface do usuário no Interface Builder. Quando inserido na declaração do método, indica que o método pode ser exposto ao Interface Builder. É por isso que o showMessageWithSender evento apareceu em um pop-over quando você estabeleceu a conexão entre o botão Hello World e o código.

//#SDK - APIs(classes e funções) - framework (UIKit)
//Ao desenvolver aplicativos no iOS, não precisamos escrever todas as funções do zero. Digamos que você não precise aprender a desenhar a caixa de alerta na tela. O SDK do iOS, incluído no Xcode, já fornece várias funções integradas para facilitar sua vida. Essas funções geralmente são conhecidas como APIs e organizadas na forma de frameworks . O UIKit framework é apenas um deles, que fornece classes e funções para construir e gerenciar a interface de usuário do seu aplicativo. Por exemplo, UIViewController, UIButton, e UIAlertControllerrealmente vêm do UIKit framework.

//Há classe ViewController (ViewController.swift)
//Há ViewController da view do Interface Builder
//Como eu disse antes, contamos com o iOS SDK da Apple para construir nossos aplicativos. Raramente escrevemos nosso próprio código para desenhar uma caixa de diálogo de aviso ou caixa de diálogo de mensagem para apresentar algumas mensagens na tela. Raramente desenhamos nossos próprios botões também. Em vez disso, confiamos UIAlertControllere UIButtonfazemo s o trabalho pesado. O mesmo conceito se aplica à visualização, a área retangular que apresentamos na tela para os usuários (UIViewControlleré).
//UIViewControlleré o bloco de construção fundamental da maioria dos aplicativos iOS. Ele contém outros elementos da interface do usuário (por exemplo, botões) e controla o que exibir na tela. Por padrão, UIViewControllertem uma visão vazia. Como você testou no capítulo anterior, ele apenas exibiu uma tela em branco sem nenhuma função ou interação com os usuários. É nossa responsabilidade fornecer uma versão personalizada do UIViewController.
//Para fazer isso, criamos uma nova classe (ie ViewController) que se estende de UIViewController. Ao estender de UIViewController, ViewControllerherda todas as suas funcionalidades.
//Por exemplo, ele tem uma visão vazia padrão. No código, está escrito assim:
//class ViewController: UIViewController
//No corpo do ViewController, disponibilizamos nossas customizações.

//Semelhante ao botão "Hello World" que discutimos anteriormente, a visão do controlador de visão também recebe eventos diferentes devido às mudanças de visibilidade ou estado da visão. Em um momento apropriado, o iOS chama automaticamente um método específico de UIViewController quando o estado da exibição é alterado.

//#viewDidLoad
//Quando a visualização for carregada, o viewDidLoad método será chamado automaticamente, para que você possa executar uma inicialização adicional.
//viewDidLoadé apenas um dos métodos para gerenciar os estados da view.

//Digamos que, quando um usuário clicar no botão inicial para voltar à tela inicial, os métodos viewWillDisappeare viewDidDisappearserão chamados automaticamente. Novamente, você pode fornecer sua própria personalização desses métodos para realizar operações adicionais.

//#Nos bastidores do botão Executar
//Compile – Você provavelmente acha que o iOS entende o código Swift. Na realidade, o iOS lê apenas código de máquina. O código Swift é para os desenvolvedores escreverem e lerem. Para que o iOS entenda o código-fonte do aplicativo, ele precisa passar por um processo de tradução para traduzir o código Swift em código de máquina. Este processo é referido como "compilar". O Xcode já vem com um compilador embutido para compilar o código fonte.
//Pacote – Além do código-fonte, um aplicativo geralmente contém arquivos de recursos, como imagens, arquivos de texto, arquivos de som, etc. Todos esses recursos são empacotados para compor o aplicativo final. Costumávamos nos referir a esses dois processos como o processo de "construção".


//#Chapter 5

//#Comandos

//Isso gira o dispositivo para o modo paisagem: você pode pressionar command+seta para a esquerda/seta para a direita para girar o dispositivo lateralmente.

//você pode pressionar command+0 para ocultar o navegador do projeto. Isso liberará mais espaço na tela para você trabalhar no design do aplicativo.

//Se você quiser liberar mais espaço na tela para o painel de visualização, mantenha as teclas de comando e de opção pressionadas e pressione 0  para ocultar a área Utilitário.

//quando você adiciona mais dispositivos no assistente de visualização, o Xcode pode não conseguir ajustar a visualização de todos os tamanhos de dispositivos na tela ao mesmo tempo. Se estiver usando um trackpad, você pode rolar pela visualização deslizando para a esquerda ou para a direita com dois dedos. E se você ainda estiver usando um mouse com roda de rolagem? Basta segurar a tecla shift para rolar horizontalmente.


//#Introduction to Auto Layout
//O layout automático é um sistema de layout baseado em restrições. Ele permite que os desenvolvedores criem uma interface do usuário adaptável que responda adequadamente às alterações no tamanho da tela e na orientação do dispositivo.
//Sem usar o layout automático, a posição do botão que colocamos no storyboard é fixa. Em outras palavras, "codificamos" a origem do frmae (x,y) do botão
//frame x = 0 - objeto fica gruado no linha esquerda
//frame y = 0 - objeto fica gruado no linha superior

//Por exemplo, se você estiver definindo a posição de um botão, você pode querer dizer "the left edge should be 30 points from the left edge of its containing view.". Isso se traduz em button.left = (container.left + 30). Felizmente, não precisamos lidar com as fórmulas. Tudo o que você precisa saber é como expressar as restrições de forma descritiva e usar o Interface Builder para criá-las.

//#Usando o layout automático para centralizar o botão

//O Xcode fornece duas maneiras de definir restrições de layout automático:

//Barra de layout automático
//Controle-arraste

//Primeiro, começamos com a barra de layout automático. No canto inferior direito do editor do Interface Builder, você deve encontrar 5 botões. Esses botões são da barra de layout. Você pode usá-los para definir vários tipos de restrições de layout e resolver problemas de layout

//Cada botão tem sua própria função:

//Alinhar – Crie restrições de alinhamento, como alinhar as bordas esquerdas de duas vistas.
//Adicionar novas restrições – Crie restrições de espaçamento, como definir a largura de um controle de interface do usuário.
//Incorporar – Incorpore visualizações em uma visualização de pilha (ou outras visualizações). Vamos discuti-lo melhor no próximo capítulo.
//Resolver problemas de layout automático – Resolva problemas de layout.
//Atualizar quadros - Atualize a posição e o tamanho do quadro em referência às restrições de layout fornecidas.

//Quando seu layout de visualização está sendo configurado corretamente e não há ambiguidade, as linhas de restrição ficam em azul.

//Com base nas restrições configuradas, eles especificaram que o botão deve ser centralizado vertical e horizontalmente no contêiner (ou seja, a visualização)



//#Adicionando um rótulo (label)

//Os rótulos no iOS geralmente são usados ​​para exibir texto e mensagens simples.

//O rótulo está a 20 pontos da margem direita da visualização.
//O rótulo está a 20 pontos de distância da parte inferior da visualização.
//No layout automático, nos referimos a esse tipo de restrição como restrições de espaçamento

//#Área segura
//a área segura é a visualização inteira, excluindo a barra de status.
//A área segura é na verdade um guia de layout, representando a parte da sua visualização que não é obscurecida por barras e outros conteúdos.
//a área segura se atualiza automaticamente quando a visualização é coberta pela barra de navegação ou outro conteúdo.
//Se a visualização não tiver nenhuma barra de navegação ou barra de guias, a área segura será a visualização inteira, excluindo a barra de status.

//#Chapter 06



