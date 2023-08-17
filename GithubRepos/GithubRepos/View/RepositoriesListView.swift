//
//  RepositoriesListView.swift
//  GithubRepos
//
//  Created by sobharaj mohapatra on 17/08/23.
//

import SwiftUI

struct RepositoriesListView: View {
    
    /// Creating RepositoryModel array reference
    let repositories: [RepositoryModel]
    
    let isLoading: Bool
    
    let onScrolledAtBottom: () -> Void
    
    var body: some View {
        List {
            repositoryList
            if isLoading {
                loadingIndicator
            }
        }
    }
}

private extension RepositoriesListView {
    
    /// Preparing repositoryList view
    var repositoryList: some View {
        ForEach(repositories) { repo in
            RepositoryRowView(repository: repo).onAppear {
                if self.repositories.last == repo {
                    self.onScrolledAtBottom()
                }
            }
        }
    }
    
    /// Preparing the indicator View
    var loadingIndicator: some View {
        Spinner(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

struct RepositoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesListView(repositories: [], isLoading: true) {
        }
    }
}
