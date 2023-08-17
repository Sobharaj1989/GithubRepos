//
//  RepositoriesViewModel.swift
//  GithubRepos
//
//  Created by sobharaj mohapatra on 17/08/23.
//

import Foundation
import Combine

class RepositoriesViewModel: ObservableObject {
    
    @Published private(set) var state = State()
    
    private var subscriptions = Set<AnyCancellable>()
    
    
    /// strDateis the string format of Data
    private lazy var strDate: String? = {
        getDate()
    }()

    
    /// This method fetch the repository list from API Service
    func fetchNextPageIfPossible() {
        guard state.canLoadNextPage, let strDate = strDate else { return }
        APIService.shared.searchRepos(query: strDate, page: state.page)
            .sink(receiveCompletion: onReceive,
                  receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    

    struct State {
        var repos: [RepositoryModel] = []
        var page: Int = 1
        var canLoadNextPage = true
        var isLoading = true
    }
}

private extension RepositoriesViewModel {
    
    func getDate() -> String? {
        guard let thirtyDaysBeforeToday = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let strDate = formatter.string(from: thirtyDaysBeforeToday)

        return strDate
    }
    
     func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            state.isLoading = false
            print(error.localizedDescription)
        }
    }

     func onReceive(_ batch: [RepositoryModel]) {
        state.repos += batch
        state.page += 1
        state.canLoadNextPage = batch.count == APIService.pageSize
        state.isLoading = batch.count == APIService.pageSize
    }

}
