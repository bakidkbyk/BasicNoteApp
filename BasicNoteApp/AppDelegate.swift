//
//  AppDelegate.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 1.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        self.window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }

}
