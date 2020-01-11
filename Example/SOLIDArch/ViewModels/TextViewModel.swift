//
//  TextViewModel.swift
//  SOLID
//
//  Created by Cyril Makankov on 16/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import Foundation

class TextViewModel: TextViewModelProtocol {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
