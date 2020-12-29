//
//  ContentView.swift
//  kiloloco MVVM
//
//  Created by addin on 29/12/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }.onAppear {
//            viewModel.getUsers()
        }
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var users = [User]()
        
        let dataService: DataService
        
        init(dataService: DataService = AppDataService()) {
            self.dataService = dataService
        }
        
        func getUsers() {
            dataService.getUsers { [weak self] users in
                self?.users = users
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(name: "ha")
        let viewModel = ContentView.ViewModel()
        viewModel.users = [user]
        return ContentView(viewModel: viewModel)
    }
}
