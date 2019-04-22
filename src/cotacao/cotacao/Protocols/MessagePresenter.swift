//
//  MessagePresenter.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 21/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation

protocol MessagePresenter {
    
    func showErrorMessage(error: String?)
    func showMessage(message: String?, title: String?)
    
}
