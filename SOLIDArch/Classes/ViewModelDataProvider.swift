//
//  ViewModelDataProvider.swift
//  SOLID
//
//  Created by Cyril Makankov on 16/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import Foundation

/// A protocol specifying the data necessary for `TableViewDataSource`
/// to set up the cell view model
public protocol ViewModelDataProvider {
    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func itemForRow(atIndexPath indexPath: IndexPath) -> ItemViewModel?
}
