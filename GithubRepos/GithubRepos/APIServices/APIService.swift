//
//  APIService.swift
//  GithubRepos
//
//  Created by sobharaj mohapatra on 17/08/23.
//

import Foundation

import Combine
import Foundation

class APIService {

    static let shared = APIService()

    static let pageSize = 10
    
    func searchRepos(query: String, page: Int) -> AnyPublisher<[RepositoryModel], Error> {
        let url = URL(string:"https://api.github.com/search/repositories?q=created:%3e\(query)&sort=stars&order=desc&per_page=\(Self.pageSize)&page=\(page)")!
    
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { _ in})
            .tryMap { try JSONDecoder().decode(GithubSearchResult<RepositoryModel>.self, from: $0.data).items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
