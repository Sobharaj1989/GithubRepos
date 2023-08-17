//
//  GithubReposApp.swift
//  GithubRepos
//
//  Created by sobharaj mohapatra on 17/08/23.
//

import SwiftUI

@main
struct GithubReposApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: RepositoriesViewModel())
        }
    }
}
