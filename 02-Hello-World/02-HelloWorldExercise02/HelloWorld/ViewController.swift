//Há uma coisa a tomar nota. Antes de poder usar qualquer função do framework, você precisa primeiro importá-la. É por isso que você encontra esta declaração no início de ViewController.swift:
import UIKit

//aqui há heranca
class ViewController: UIViewController {

    //Este método é originalmente fornecido pelo UIViewController. Para fornecer personalizações, indicamos substituir sua implementação padrão usando a palavra-chave override .
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view controller's view becomes black.
        //view.backgroundColor = UIColor.black

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose/Descarte of any resources that can be recreated.
    }

    //@IBAction. This keyword allows you to connect your source code to user interface objects in Interface Builder.
    @IBAction func showMessage(sender: UIButton) {
       
        let emojiDict = ["👻": "Ghost", "🤖": "Robot", "😤": "Angry", "🤓": "Nerdy", "👾": "Alien monster"]
        
        // The sender is the button that is tapped by the user.
        // Here we store the sender in the selectedButton constant
        let selectedButton = sender
        
        // Get the emoji from the title label of the selected button
        if let wordToLookup = selectedButton.titleLabel?.text {
            
            // Get the meaning of the emoji from the dictionary
            let meaning = emojiDict[wordToLookup]
            
            //sintaxe de construção de um objeto de uma classe
            //A primeira linha de código cria um UIAlertController objeto e o armazena em alertController. A sintaxe de construção de um objeto de uma classe é muito semelhante à chamada de um método. Você especifica o nome da classe, seguido por um conjunto de valores iniciais de propriedades. Aqui especificamos o título, a mensagem e o estilo preferido do alerta:
            //to display the meaning of the emoji
            //cria um objeto UIAlertController
            let alertController = UIAlertController(title: "Meaning", message: meaning, preferredStyle: UIAlertController.Style.alert)
            
            //chamamos o método addAction
            //Logo após criar o UIAlertControllerobjeto (ou seja, alertController), chamamos o addActionmétodo para adicionar uma ação ao alerta para que ele exiba um botão "OK". Ao programar em Swift, você chama um método usando a sintaxe de ponto.
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           
            //mostra alerta na tela
            //pedimos ao controlador de exibição atual para apresentar o objeto alertController com animação.
            present(alertController, animated: true, completion: nil)
            // você usa a self propriedade para se referir à instância (ou objeto) atual. Na maioria dos casos, self é opcional. Então você pode omitir.
            //self.present(alertController, animated: true, completion: nil)
        }
        
    }
}

