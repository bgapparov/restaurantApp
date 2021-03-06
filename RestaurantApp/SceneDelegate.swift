//
//  SceneDelegate.swift
//  RestaurantApp
//
//  Created by Baiaman Gapparov on 7/28/20.
//  Copyright © 2020 Baiaman Gapparov. All rights reserved.
//

import UIKit
import Moya

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let locationService = LocationService()
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let service = MoyaProvider<YelpService.BusinessesProvider>()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        service.request(.search(lat: 42.361145, long: -71.057083)) { (result) in
            switch result {
            case .success(let response):
                print(try? JSONSerialization.jsonObject(with: response.data, options: []))
            case .failure(let error):
                print("Error \(error)")
            }
        }
        
        guard let windowScene = scene as? UIWindowScene else { return }
        let locationViewController = storyBoard.instantiateViewController (withIdentifier: "LocationViewController") as! LocationViewController
        window = UIWindow(windowScene: windowScene)
        locationViewController.locationService = locationService
        window?.rootViewController = locationViewController
        window?.makeKeyAndVisible()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

