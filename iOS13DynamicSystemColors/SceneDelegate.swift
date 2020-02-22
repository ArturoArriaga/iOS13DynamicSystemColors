//
//  SceneDelegate.swift
//  iOS13DynamicSystemColors
//
//  Created by Art Arriaga on 2/20/20.
//  Copyright © 2020 ArturoArriaga.IO. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let maincontroller = MainController()
        let navigationController = UINavigationController(rootViewController: maincontroller)
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

