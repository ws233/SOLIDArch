//
//  SectionDataProvider.swift
//  SOLID
//
//  Created by Cyril Makankov on 18.01.2020.
//  Copyright © 2019 ws233. All rights reserved.
//

import Foundation

/// A protocol that defines the interface for section objects vended by a `SectionDataProvider`
public protocol SectionInfo {
    /// The number of objects (rows) in the section.
    var numberOfObjects: Int { get }
    
    /// The array of objects in the section.
    var objects: [ItemViewModel]? { get }
    
    /// The name of the section.
    var name: String { get }
    
    /// The index title of the section.
    var indexTitle: String? { get }
}

/// A simple implementation of a `ViewModelDataProvider` protocol only.
/// Represents a sectioned array of view models of type `ItemViewNidek` as a sectioned table view list,
/// where an every `SectionInfo` item
public class SectionDataProvider {
    let sections: [SectionInfo]
    
    public init(sections: [SectionInfo]) {
        self.sections = sections
    }
}

// MARK: - ViewModelDataProvider
extension SectionDataProvider: ViewModelDataProvider {
    public func numberOfSections() -> Int {
        return sections.count
    }
    
    public func numberOfRows(inSection section: Int) -> Int {
        let section = sections[section]
        return section.numberOfObjects
    }
    
    public func itemForRow(atIndexPath indexPath: IndexPath) -> ItemViewModel? {
        let section = sections[indexPath.section]
        return section.objects![indexPath.row]
    }

    public func title(forSection section: Int) -> String? {
        let section = sections[section]
        return section.name
    }

    public func sectionIndexTitles() -> [String]? {
        return sections.compactMap { $0.indexTitle }
    }
}
