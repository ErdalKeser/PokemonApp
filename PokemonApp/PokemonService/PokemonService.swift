//
//  PokemonService.swift
//  PokemonApp
//
//  Created by Erdal Keser on 22.03.2023.
//

import Foundation

final class PokemonService {
    
    func downloadPokemonList(completion: @escaping ([PokemonModel]?) -> ()) {
        guard let url = URL(string: APIURLs.pokemonList()) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func downloadDetail(url: String, completion: @escaping (PokemonDetailModel?) -> ()) {
        guard let url = URL(string: url) else { return }
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    private func handleWithData(_ data: Data) -> [PokemonModel]? {
        do {
            let result = try JSONDecoder().decode(PokemonResponseModel.self, from: data)
            return result.results
        }catch {
            print(error)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> PokemonDetailModel? {
        
        do {
            let movieDetail = try JSONDecoder().decode(PokemonDetailModel.self, from: data)
            
            return movieDetail
        } catch {
            print(error)
            return nil
        }
        
    }
    
}
