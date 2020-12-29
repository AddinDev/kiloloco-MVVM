//
//  AppDataService.swift
//  kiloloco MVVM
//
//  Created by addin on 29/12/20.
//

import Foundation

protocol DataService {
    func getUsers(completion: @escaping ([User]) -> Void)
}

class AppDataService: DataService {
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion([
            User(name: "udin"),
            User(name: "dinda"),
            User(name: "udinda")
        ])
    }
}
