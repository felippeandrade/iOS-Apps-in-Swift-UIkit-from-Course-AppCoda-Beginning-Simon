import UIKit

//A RestaurantTableViewCell classe serve como o modelo de exibição da célula personalizada. Na célula, temos 4 propriedades que podem ser alteradas.
//Para atualizar os dados da célula, vamos criar uma nova classe, que se estende de UITableViewCell, para a célula protótipo.
//O modelo de exibição armazena e fornece os valores para a célula exibir.
//Ao conectar o código-fonte com os objetos da interface do usuário, podemos alterar os valores dos objetos da interface do usuário dinamicamente.
//é uma relacao de heranca
class RestaurantTableViewCell: UITableViewCell {

    //você usa @IBOutleta palavra-chave para indicar uma propriedade de uma classe, que pode ser exposta ao Interface Builder. Para propriedades anotadas com as palavras- IBOutletchave, chamamos de outlets .
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView! {
        //quando uma visualização de imagem é atribuída, o didSet bloco de código será chamado para alterar o raio do canto e definir o clipsToBounds valor para true
        didSet {
            thumbnailImageView.layer.cornerRadius = 20.0
            thumbnailImageView.clipsToBounds = true
        }
        //Para criar uma imagem circular, você pode alterar o trecho de código como este, que define o raio para metade da largura da visualização da imagem
//        didSet {
//            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2
//            thumbnailImageView.clipsToBounds = true
//        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


