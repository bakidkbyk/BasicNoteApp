//
//  AppRouter.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 20.08.2023.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = LoginRoute
    
    static let shared = AppRouter()
    
    func startApp() {
        presentLogin()
    }

    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
}
