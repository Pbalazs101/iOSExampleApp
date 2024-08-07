//
//  NetworkAssembly.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 25/07/2024.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(NetworkingManager.self, initializer: NetworkManager.init).inObjectScope(.container)
        container.storyboardInitCompleted(OffersViewController.self, initCompleted: { r, c in
            c.networkService = r.resolve(NetworkingManager.self)
        })
    }
}
