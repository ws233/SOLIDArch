//
//  Configurable.swift
//  SOLID
//
//  Created by Cyril Makankov on 16/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import UIKit

/// Protocol specifying the configutable view.
/// The view has the `viewModel` property of associated type `ItemViewModel`,
/// which might be set to configure the view presentation
public protocol Configurable where Self: UIView {
    associatedtype ItemViewModel
    var viewModel: ItemViewModel? { get set }
}
