//
//  ValueSettingViewModel.swift
//  SOLID
//
//  Created by Cyril Makankov on 18/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import Foundation

class ValueSettingViewModel: TextViewModel, DetailedTextViewModelProtocol {
    var detailedText: String { return String(value) }
    var value: Int
    
    init(parameter: String, value: Int) {
        self.value = value
        super.init(text: parameter)
    }
}
