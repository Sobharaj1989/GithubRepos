//
//  RepositoryModel.swift
//  GithubRepos
//
//  Created by sobharaj mohapatra on 17/08/23.
//

import Foundation

struct GithubSearchResult<T: Codable>: Codable {
    let items: [T]
}

struct RepositoryModel: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let stargazers_count: Int
    let open_issues_count: Int
    let owner: UserModel
}


struct UserModel: Codable, Identifiable, Equatable {
    let id: Int
    let login: String
    let avatar_url: String?
}
