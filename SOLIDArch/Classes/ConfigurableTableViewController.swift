//
//  ConfigurableTableViewController.swift
//  SOLID
//
//  Created by Cyril Makankov on 18.01.2020.
//  Copyright © 2019 ws233. All rights reserved.
//

import UIKit

/// Protocol pecifying the configutable table view controller.
/// The table view controller has the `dataSource` property of the system `UITableViewDataSource` protocol,
/// which might be set to configure the controller table view presentation
public protocol ConfigurableTableViewController where Self: UITableViewController {
    var dataSource: UITableViewDataSource? { get set }
}
