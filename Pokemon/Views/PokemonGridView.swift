//
//  PokemonGridView.swift
//  Pokemon
//
//  Created by Lucas Pereira on 14/06/23.
//

import SwiftUI

struct PokemonGridView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.blue.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(viewModel.pokemons) { pokemon in
                            NavigationLink {
                                PokemonDetailView(pokemon: pokemon, viewModel: viewModel)
                            } label: {
                                PokemonCell(pokemon: pokemon, viewModel: viewModel)
                            }
                        }
                    }
                }.navigationTitle("Pokemon Club \(viewModel.pokemons.count)")
            }
        }.navigationBarHidden(true)
    }
}

struct PokemonGridView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGridView()
    }
}
