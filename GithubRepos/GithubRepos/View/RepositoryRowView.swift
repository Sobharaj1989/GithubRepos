//
//  RepositoryRowView.swift
//  GithubRepos
//
//  Created by sobharaj mohapatra on 17/08/23.
//

import SwiftUI

struct RepositoryRowView: View {
    
    let repository: RepositoryModel
    
    var body: some View {
        VStack {
            Text(repository.name).font(.title)
            HStack(spacing: 40) {
                VStack {
                    AsyncImage(url: URL(string: repository.owner.avatar_url ?? StringKey.UNKNOWN_USER)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                    
                    Text(repository.owner.login )
                    Spacer()
                    
                }
                Spacer()
                VStack(spacing: 20) {
                    Text("⭐️ \(repository.stargazers_count)")
                    Text("\(StringKey.ISSUE_LABEL): \(repository.open_issues_count)")
                }
            }
            repository.description.map(Text.init)?.font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

struct RepositoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRowView(repository: RepositoryModel(id: 1, name: StringKey.TEST_DATA, description: StringKey.TEST_DATA, stargazers_count: 2, open_issues_count: .zero, owner: UserModel(id: 1, login: StringKey.TEST_DATA, avatar_url: StringKey.TEST_DATA)))
    }
}
