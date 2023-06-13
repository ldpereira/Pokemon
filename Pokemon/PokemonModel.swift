//
//  Pokemon.swift
//  Pokemon
//
//  Created by Lucas Pereira on 14/06/23.
//

import Foundation

struct PokemonModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
}
