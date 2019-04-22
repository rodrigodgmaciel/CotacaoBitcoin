//
//  MessagePresenter+Extensions.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 21/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

extension MessagePresenter where Self: UIViewController {
    
    func showErrorMessage(error: String?) {
        showMessage(message: error, title: "Atenção")
    }
    
    func showMessage(message: String?, title: String? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.view.tintColor = Color.app_color_default
        self.present(alert, animated: true, completion: nil)
    }
    
}
