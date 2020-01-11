//
//  DetailedTextTableViewCell.swift
//  SOLID
//
//  Created by Cyril Makankov on 18/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import UIKit
import SOLIDArch

protocol DetailedTextViewModelProtocol: TextViewModel {
    var detailedText: String { get }
}

class DetailedTextTableViewCell: UITableViewCell, Configurable {
    var viewModel: DetailedTextViewModelProtocol? {
        didSet {
            textLabel?.text = viewModel?.text
            detailTextLabel?.text = viewModel?.detailedText
        }
    }
}
