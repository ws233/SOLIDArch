//
//  TableViewCellFabric.swift
//  SOLID
//
//  Created by Cyril Makankov on 07.12.2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import UIKit

/// Protocol specifying the fabric for creating table view cells for the corresponding viewModels
protocol TableViewCellFabric {
    var cellIdentifier: String { get }
    func makeCell(for tableView: UITableView,
                  at indexPath: IndexPath,
                  with viewModel: ItemViewModel) -> UITableViewCell
}

/// A generic implementation of a `TableViewCellFabric` protocol.
/// Creates a cell of a type 'Cell' and set it up a corresponsing view model of a type `ItemViewModel`.
class GenericTableViewCellFabric<Cell>: TableViewCellFabric
where Cell: UITableViewCell & Configurable {
    let cellIdentifier: String
    
    func makeCell(for tableView: UITableView,
                  at indexPath: IndexPath,
                  with viewModel: ItemViewModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath)
        guard
            let configurableCell = cell as? Cell,
            let viewModel = viewModel as? Cell.ItemViewModel
            else {
                return cell
        }
        configurableCell.viewModel = viewModel
        return configurableCell
    }
    
    init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
}
