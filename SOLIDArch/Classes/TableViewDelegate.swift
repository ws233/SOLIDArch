//
//  TableViewDelegate.swift
//  SOLIDArch
//
//  Created by Churyanin NG on 23.11.2021.
//

import UIKit

/// Class conforming to `UITableViewDelegate` only.
/// Given an instance of `ViewModelDataProvider` and a matching
/// between item view model class and a selector,
/// it performs the corresponding selector for the tap on the cell.
/// The `TableViewDelegate` does know nothing
/// about the exact cell and view model implementations,
/// since the former is hidden behind the `ViewModelDataProvider` protocol
/// and the later is behind `[String: Selector]`
public final class TableViewDelegate: NSObject {

    // MARK: - Property
    private let dataProvider: ViewModelDataProvider
    private let itemViewModelClassToSelectorMap: [String: Selector]

    // MARK: - Initialization
    public init(dataProvider: ViewModelDataProvider, map: [String: Selector]) {
        self.dataProvider = dataProvider
        self.itemViewModelClassToSelectorMap = map
    }
}

// MARK: - Conforms UITableViewDelegate
extension TableViewDelegate: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let viewModel = dataProvider.itemForRow(atIndexPath: indexPath),
              let selector = itemViewModelClassToSelectorMap["\(type(of: viewModel))"]
        else { return }

        let cell = tableView.cellForRow(at: indexPath)
        let target = tableView.target(forAction: selector, withSender: cell) as? NSObject
        target?.perform(selector, with: cell)
    }
}
