//
//  MainViewModel.swift
//  PokemonApp
//
//  Created by Erdal Keser on 22.03.2023.
//

import Foundation

protocol MainViewModelInterface {
    
    var delegate: PokemonMainVCInterface? {get set}
    func viewDidLoad()
    func getPokemonList()
}
final class MainViewModel {
    
    weak var delegate: PokemonMainVCInterface?
    private let service = PokemonService()
    
    var pokemons = [PokemonModel]()
    var imageUrls = [String]()
    var abilities1 = [String]()
    var names = [String]()
    var allDetail:PokemonDetailModel?
    
}
extension MainViewModel: MainViewModelInterface {
    func viewDidLoad() {
        delegate?.configureTableView()
    }
    
    func getPokemonList() {
        service.downloadPokemonList { [weak self] result in
            guard let self = self,
                  let result = result else {return}
            
            self.pokemons = Array(result.prefix(40))
            self.delegate?.getPokemonListSuccess()
        }
    }
    
    func getDetail(url: String) {
        
        service.downloadDetail(url: url) { [weak self] returnedDetail in
            guard let self = self else {return}
            guard let returnedDetail = returnedDetail else {return}
            self.allDetail = returnedDetail
            
            if let imageUrl = returnedDetail.sprites?.other?.home?.frontDefault {
                self.imageUrls.append(imageUrl)
            }
            if let names = returnedDetail.name {
                self.names.append(names)
            }
            if let abilities = returnedDetail.abilities?[0].ability?.name{
                self.abilities1.append(abilities)
            }
            
            self.delegate?.reloadTableView()
        }
    }
}
