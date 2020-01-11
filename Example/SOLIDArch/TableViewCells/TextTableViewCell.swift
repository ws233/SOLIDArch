//
//  SystemTableViewCell.swift
//  SOLID
//
//  Created by Cyril Makankov on 16/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import UIKit
import SOLIDArch

protocol TextViewModelProtocol: ItemViewModel {
    var text: String { get }
}

class TextTableViewCell: UITableViewCell, Configurable {
    var viewModel: TextViewModelProtocol? {
        didSet {
            textLabel?.text = viewModel?.text
        }
    }
}
