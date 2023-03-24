//
//  PokemonListTableViewCell.swift
//  PokemonApp
//
//  Created by Erdal Keser on 22.03.2023.
//

import UIKit
import Kingfisher

class PokemonListTableViewCell: UITableViewCell {
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(image: String) {
        if let url = URL(string: image){
            pokemonImage.kf.setImage(with: url)
        }
    }
    func setCell(name: String){
        pokemonName.backgroundColor = .white
        pokemonName.clipsToBounds = true
        pokemonName.layer.cornerRadius = 15
        pokemonName.text = name.uppercased()
    }
}
