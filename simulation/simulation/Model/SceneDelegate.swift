//
//  SceneDelegate.swift
//  simulation
//
//  Created by 이다민 on 2022/11/08.
//

import Foundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        UnityManager.shared.setHostMainWindow(self.window)
    }
}
