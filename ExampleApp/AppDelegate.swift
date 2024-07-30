//
//  AppDelegate.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 27/05/2024.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    fileprivate let assemblies: [Assembly] = [NetworkAssembly()]

    var window: UIWindow?
    let container = Container()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let assembler = Assembler.init(container: container)
        assembler.apply(assemblies: assemblies)

        SwinjectStoryboard.defaultContainer = container

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // Unused function
    /*
    private func setupContainer() {

        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
              let initialViewController = navigationController.viewControllers.first as? OffersViewController else {
            fatalError("Storyboard error")
        }
        let resolvedService = container.resolve(NetworkingManager.self)
        print("Resolved service: \(String(describing: resolvedService))")
        initialViewController.networkService = resolvedService

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

    }
     */
}
