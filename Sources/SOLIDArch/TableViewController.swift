//
//  TableViewController.swift
//  SOLID
//
//  Created by Cyril Makankov on 18.01.2020.
//  Copyright © 2019 ws233. All rights reserved.
//

import UIKit

/// Default implementation of `ConfigurableTableViewController` protocol.
/// Stores the `dataSource` value and set's it to the underlying `tableView`
/// All configurable table view controllers should be inherited from `TableViewController`
public class TableViewController: UITableViewController, ConfigurableTableViewController {
    
    public var dataSource: UITableViewDataSource? {
        didSet {
            guard isViewLoaded else {
                return
            }
            tableView.dataSource = dataSource
            tableView.reloadData()
        }
    }

    public var delegate: UITableViewDelegate? {
        didSet {
            guard isViewLoaded else {
                return
            }

            tableView.delegate = delegate
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}
