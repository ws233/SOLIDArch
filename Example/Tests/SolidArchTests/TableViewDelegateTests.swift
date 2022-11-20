//
//  TableViewDelegateTests.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import XCTest
@testable import SOLIDArch

class TableViewDelegateTests: XCTestCase {

	var dataProvider: TableViewDataProviderStub!
	var itemViewModel: ItemViewModelStub!
	var tableView: UITableViewMock!

    override func setUpWithError() throws {
		try super.setUpWithError()
		dataProvider = TableViewDataProviderStub()
		itemViewModel = ItemViewModelStub()
		tableView = UITableViewMock()
		tableView.stubbedCell = UITableViewCellStub()
		dataProvider.stubbedItemForRow = itemViewModel
    }

    override func tearDownWithError() throws {
		dataProvider = nil
		itemViewModel = nil
		tableView = nil
		try super.tearDownWithError()
    }

	func testDidSelectRowSuccess() throws {
		// arrange
		let selector = #selector(UITableView.reloadData)
		let tableViewDelegate = TableViewDelegate(
			dataProvider: dataProvider,
			map: ["\(ItemViewModelStub.self)": selector]
		)

		// act
		tableViewDelegate.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

		// assert
		XCTAssertTrue(tableView.reloadDataCalled)
	}

	func testDidSelectRowFailure() throws {
		// arrange
		let selector = #selector(UITableView.reloadData)
		let tableViewDelegate = TableViewDelegate(
			dataProvider: dataProvider,
			map: ["test": selector]
		)

		// act
		tableViewDelegate.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

		// assert
		XCTAssertFalse(tableView.reloadDataCalled)
	}
}
