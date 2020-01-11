//
//  TableViewDataSource.swift
//  SOLID
//
//  Created by Cyril Makankov on 16/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import UIKit

/// Class conforming to `UITableViewDataSource` only.
/// Given an instance of `ViewModelDataProvider` and a matching
/// between item view model class and cell class with a corresponding reuse identifier,
/// it provides a cell array. The `TableViewDataSource` does know
/// nothing about the exact cell and view model implementations,
/// since the former is hidden behind the `Configurable` protocol
/// and the later is behind `ItemViewModel`
public class TableViewDataSource: NSObject {
    let dataProvider: ViewModelDataProvider
    
    private lazy var itemViewModelClassToFabricMapping = [String: TableViewCellFabric]()
    
    public init(dataProvider: ViewModelDataProvider) {
        self.dataProvider = dataProvider
    }
}

// MARK: - Public
extension TableViewDataSource {
    
    /// Registers a mapping map between a cell of `cellClass` with a cell reuse `identifier` and a corresponding `itemViewModelClass`
    /// This mapping allows to dequeue the corresponding table view cell from the given table view.
    /// And set it up the corresponding view model.
    /// - Parameters:
    ///   - cellClass: cell class, used to cast the dequeued cell to. Must be a descendant of `UITableViewCell` conforming `Configurable` protocol.
    ///   - cellIdentifier: cell reuse identifier used to dequeue the cell from a table view
    ///   - itemViewModelClass: the corresponding view model class, for which the cell is dequeuing
    public func registerCell<Cell>(class: Cell.Type, identifier: String, for itemViewModelClass: ItemViewModel.Type)
        where Cell: UITableViewCell & Configurable {
        let cellFabric = GenericTableViewCellFabric<Cell>(cellIdentifier: identifier)
        let itemViewModelTypeString = "\(itemViewModelClass)"
        itemViewModelClassToFabricMapping[itemViewModelTypeString] = cellFabric
    }
}

// MARK: - UITableViewDataSource
extension TableViewDataSource: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.numberOfSections()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfRows(inSection: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let viewModel = dataProvider.itemForRow(atIndexPath: indexPath),
            let fabric = cellFabric(viewModel: viewModel)
            else {
                return UITableViewCell()
        }
        let cell = fabric.makeCell(for: tableView, at: indexPath, with: viewModel)
        return cell
    }
}

// MARK: - Private
private extension TableViewDataSource {
    func cellFabric(viewModel: ItemViewModel) -> TableViewCellFabric? {
        let viewModelType = type(of: viewModel)
        let viewModelTypeString = "\(viewModelType)"
        return itemViewModelClassToFabricMapping[viewModelTypeString]
    }
}
