//
//  Appearance.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

struct Appereance {
    
    static let navigationBarColor = Color.app_color_default
    
    static func install() {
        UINavigationBar.appearance().barTintColor = navigationBarColor;
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        if #available(iOS 11.0, *) {
            UINavigationBar.appearance().prefersLargeTitles = true
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
    }
}
