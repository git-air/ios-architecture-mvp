//
//  PokemonDetailModel.swift
//  ios-architecture
//
//  Created by AIR on 2023/05/22.
//

import Foundation

final class PokemonDetailModel {
    let notificationCenter = NotificationCenter.default
    private(set) var pokemonDetail: PokemonDetail! {
        didSet {
            notificationCenter.post(name: .init("pokemonDetail"),
                                    object: nil,
                                    userInfo: ["pokemonDetail": pokemonDetail!]
            )
        }
    }
    
    private let pokemonDetailAPI: PokemonDetailAPI
    private let pokeId: Int
    
    init(pokeId: Int, apiClient: APIClient) {
        self.pokeId = pokeId
        self.pokemonDetailAPI = .init(apiClient: apiClient)
    }
    
    func requestPokemonDetail(_ completion: @escaping (Result<PokemonDetail, APIError>) -> Void) {
        pokemonDetailAPI.requestPokemonDetail(pokeId: pokeId) { [weak self] result in
            if case .success(let pokemonDetail) = result {
                self?.pokemonDetail = pokemonDetail
            }
            completion(result)
        }
    }
}