//
//  ContentView.swift
//  GithubRepos
//
//  Created by sobharaj mohapatra on 17/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: RepositoriesViewModel
    
    var body: some View {
        NavigationView {
            RepositoriesListView(
                repositories: viewModel.state.repos,
                isLoading: viewModel.state.isLoading,
                onScrolledAtBottom: viewModel.fetchNextPageIfPossible
            )
            .onAppear(perform: viewModel.fetchNextPageIfPossible)
            .navigationTitle(Text(StringKey.PAGETITLE))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: RepositoriesViewModel())
    }
}
