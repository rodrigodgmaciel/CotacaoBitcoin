//
//  AppRouter.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

final class AppRouter {
    
    private var window: UIWindow
    private var navigationController: UINavigationController
    
    private var appLaunchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
    init(appLaunchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.appLaunchOptions = appLaunchOptions
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.navigationController = UINavigationController()
        
    }
    
    func visibleViewController(_ rootViewController: UIViewController) {
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
   
}

extension AppRouter {
    
    func showInitialViewController() {
        
        self.visibleViewController(self.navigationController)
        
        let controller = InitialViewController(delegate: self)
        navigationController.viewControllers = [controller]
        
    }
    
    func showConsultViewController() {
        
        let controller = ConsultViewController()
        navigationController.pushViewController(controller, animated: true)
    }
    
}

extension AppRouter: InitialViewControllerDelegate {
    
    func consultViewController(_ controller: InitialViewController) {
        
        self.showConsultViewController()
    }
}
