//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Lucas Pereira on 14/06/23.
//

import Foundation
import UIKit

class PokemonViewModel: ObservableObject {
    @Published var pokemons = [PokemonModel]()
    
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let parsedData = data?.parseData(removeString: "null,") else { return }
            
            guard let pokemonData = try? JSONDecoder().decode([PokemonModel].self, from: parsedData) else { return }
            
            DispatchQueue.main.async {
                self.pokemons = pokemonData
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .orange
        case "poison": return .purple
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .brown
        case "normal" : return .magenta
        case "ground": return .green
        case "flying": return .cyan
        case "fairy": return .systemTeal
        default: return .systemGray
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        
        return data
    }
}
