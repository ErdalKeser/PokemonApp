//
//  APIURLs.swift
//  PokemonApp
//
//  Created by Erdal Keser on 22.03.2023.
//

import Foundation

enum APIURLs {
    static func pokemonList() -> String {
        "https://pokeapi.co/api/v2/pokemon?offset=3&limit=40"
    }
}
