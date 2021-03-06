//
//  ArrayDataProvider.swift
//  SOLID
//
//  Created by Cyril Makankov on 16/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import Foundation

/// A simple implementation of a `ViewModelDataProvider` protocol only.
/// Represents a simple array of view models of type `T` as a one sectioned table view list
public class ArrayDataProvider<T: ItemViewModel> {
    let array: [T]
    let sectionTitle: String?

    public init(array: [T], sectionTitle: String? = nil) {
        self.array = array
        self.sectionTitle = sectionTitle
    }
}

// MARK: - ViewModelDataProvider
extension ArrayDataProvider: ViewModelDataProvider {
    public func numberOfSections() -> Int {
        return 1
    }
    
    public func numberOfRows(inSection section: Int) -> Int {
        return array.count
    }
    
    public func itemForRow(atIndexPath indexPath: IndexPath) -> ItemViewModel? {
        guard
            indexPath.row >= 0,
            indexPath.row < array.count
            else {
                return nil
        }
        return array[indexPath.row]
    }
    
    public func title(forSection section: Int) -> String? {
        return sectionTitle
    }
    
    public func sectionIndexTitles() -> [String]? {
        guard let count = sectionTitle?.count,
            count > 0,
            let substring = sectionTitle?.prefix(1)
            else {
                return nil
        }
        return [String(substring)]
    }

}
