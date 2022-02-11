import UIKit

//hera de UIViewController
//Classe ViewController é aquela que adota o protocolo e implementa todos os métodos obrigatórios
//Classe ViewController é o delegado que fornece os dados da tabela
//Protocolos UITableViewDataSource, UITableViewDelegate
//Como você informa ao UITableView quais dados exibir? O protocolo UITableViewDataSource é a chave
//protocolo UITableViewDelegate,trata da aparência do UITableView
//O protocolo também define alguns métodos opcionais que não discutiremos aqui.
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //método necessario para o UITableViewDataSource protocolo.
    //informa número total de linhas a serem exibidas
    //o método é utilizado para informar à table view o número total de linhas de uma seção.
    //Uma visualização de tabela pode ter várias seções, mas há apenas uma por padrão
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return restaurantNames.count
    }

    //método necessario para o UITableViewDataSource protocolo.
    //informa dados de cada linha
    //o método será chamado toda vez que uma linha da tabela for exibida
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // O identificador datacell é aquele que definimos anteriormente no Interface Builder em Prototype Cell.
        let cellIdentifier = "datacell"
        //método dequeueReusableCell é usado para recuperar uma célula de tabela reutilizável da fila com o identificador de célula especificado.
        //textLabel e imageView são propriedades da UITableViewCell classe padrão
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Configure the cell...
        //Aqui textLabel é um opcional. Para acessar a propriedade de textLabel, primeiro temos que verificar se textLabel tem um valor. Você pode usar if let para realizar a verificação. Alternativamente, você pode colocar um ponto de interrogação (?) após textLabel.
        //Usando o indexPathobjeto, podemos obter a linha atual
        cell.textLabel?.text = restaurantNames[indexPath.row]
        //Você pode passar o nome da imagem (a extensão do arquivo é opcional) e a classe carregará a imagem do catálogo de ativos.
        //A UIImageclasse fornecida pela estrutura UIKit permite criar imagens a partir de arquivos. Ele suporta vários formatos de imagem, como PNG, PDF e JPEG
        //This line of code instructs UITableView to load the image and display it in the image view of the table cell.
        cell.imageView?.image = UIImage(named: "restaurant")
        
        return cell
    }
    
    //Se você não quiser mostrar a barra de status em um controlador de exibição específico, definindo como true
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

