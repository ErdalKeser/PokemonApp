//
//  PokemonMainModel.swift
//  PokemonApp
//
//  Created by Erdal Keser on 22.03.2023.
//

import Foundation

struct PokemonResponseModel: Codable {
    
    let results: [PokemonModel]?
}
struct PokemonModel: Codable {
    let name: String?
    let url: String?
}

