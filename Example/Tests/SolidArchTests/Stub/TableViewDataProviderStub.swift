//
//  File.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import Foundation
import SOLIDArch

class TableViewDataProviderStub: ViewModelDataProvider {

	var stubbedNumberOfSections: Int!
	var stubbedNumberOfRows: Int!
	var stubbedItemForRow: ItemViewModel?
	var stubbedTitleForSection: String?
	var stubbedSectionsIndexTitles: [String]?

	func numberOfSections() -> Int {
		stubbedNumberOfSections
	}

	func numberOfRows(inSection section: Int) -> Int {
		stubbedNumberOfRows
	}

	func itemForRow(atIndexPath indexPath: IndexPath) -> ItemViewModel? {
		stubbedItemForRow
	}

	func title(forSection section: Int) -> String? {
		stubbedTitleForSection
	}

	func sectionIndexTitles() -> [String]? {
		stubbedSectionsIndexTitles
	}
}
