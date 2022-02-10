import UIKit

//herda de UITableViewController
class RestaurantTableViewController: UITableViewController {

    //UITableViewsuporta várias seções, portanto, o UITableViewDiffableDataSource objeto também exige que especifiquemos o número de seções e a configuração da célula de cada seção. Para o aplicativo de demonstração, temos apenas uma seção. Então, declare uma variável enum
    //We use enum to define a new Section type. In the enumeration, it only has one case because the table has a single section. I name the case all, which means all records. But you can actually name it to whatever name you like.

    enum Section {
        case all
    }

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
        
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    //Nesse caso, você deve declarar a variável com o lazy modificador porque seu valor inicial não pode ser recuperado até que a inicialização da instância RestaurantTableViewController seja concluída.
    //so é executa quando é chamado
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Atribua a fonte de dados diffable à sua visualização de tabela.
        tableView.dataSource = dataSource
        
        //Gere o estado atual dos dados da tabela criando um instantâneo
        //Through a snapshot, you set up the initial state of the data that displays in a view, and later update that data.
        //e, em seguida, criar um NSDiffableDataSourceSnapshot objeto para informar à visualização de tabela quais dados exibir.
        //Each of your sections and items must have unique identifiers that conform to the Hashable protoco
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
        //a partir daqui,entra de novo no metodo configureDataSource, porém na linha da cellProvider
    }
    
    //Crie um UITableViewDiffableDataSourceobjeto para se conectar com sua tabela e forneça a configuração das células de visualização da tabela.
    //o próximo passo é criar uma instância de UITableViewDiffableDataSource. Vamos escrever uma nova função chamada configureDataSource()para este propósito.
    //temos que criar um UITableViewDiffableDataSource objeto para configurar a célula de visualização de tabela
    //UITableViewDiffableDataSource é um objeto genérico capaz de lidar com diferentes tipos de seção e item de uma visualização de tabela. O tipo Section e String dentro do colchete indicam que usamos o Section tipo para a seção da tabela e o String tipo para os dados da célula da tabela. A razão pela qual String type é usado é que o nome do restaurante é do tipo String.
    //Dentro da configureDataSource()função, criamos uma instância de UITableViewDiffableDataSource. Ao inicializar o objeto, é necessário fornecer a instância de table view que a fonte de dados está conectada, além do provedor de célula.
    //Obviously, the data source will connect to the tableView of RestaurantTableViewController. The cellProvider parameter is where you set up each cell of the table view. In the closure of the cell provider, you have three parameters including tableView, indexPath, and restaurantName. The restaurantName here is the restaurant name of the current cell.
    //em cellProvider, ela já passa o nome de um único restaurante a ser exibido, sem necessidade de usar um arrya com indepath.row.
    //ao entrar na funcao abaixo: primeiro retorna uma instancia dataSource e sai da funcao, depois entra de novo na funcao e retorna cell.
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        
        let cellIdentifier = "datacell"
        
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, restaurantName in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
                            
                cell.nameLabel.text = restaurantName //self.restaurantNames[indexPath.row]
                cell.typeLabel.text = self.restaurantTypes[indexPath.row]
                cell.locationLabel.text = self.restaurantLocations[indexPath.row]
                cell.thumbnailImageView.image = UIImage(named: self.restaurantImages[indexPath.row])
                
                return cell
            }
        )
        return dataSource
    }

}
