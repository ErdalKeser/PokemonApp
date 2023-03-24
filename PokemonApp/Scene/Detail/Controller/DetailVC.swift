//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by Erdal Keser on 21.03.2023.
//

import UIKit
import Kingfisher



final class DetailVC: UIViewController{
    
    var imageUrls:String?
    var name:String?
    var abilities1:String?

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonAbilities1: UILabel!
    @IBOutlet weak var pokemonAbilities2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        pokemonName.backgroundColor = .white
        pokemonName.layer.cornerRadius = 15
        pokemonName.clipsToBounds = true
        
        guard let url = imageUrls else {return}
        let urls = URL(string: url)
            pokemonImage.kf.setImage(with: urls)
        guard let name = name else {return}
    
        pokemonName.text = name.uppercased()
        guard let abilities1 = abilities1 else {return}
        pokemonAbilities1.text = abilities1.uppercased()

    }
    


}
