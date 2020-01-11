//
//  SwitchedSettingViewModel.swift
//  SOLID
//
//  Created by Cyril Makankov on 18/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import Foundation

class SwitchedSettingViewModel: TextViewModel, DetailedTextViewModelProtocol {
    var detailedText: String { return String(enabled) }
    var enabled: Bool
    
    init(parameter: String, enabled: Bool) {
        self.enabled = enabled
        super.init(text: parameter)
    }
}
