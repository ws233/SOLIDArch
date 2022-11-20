//
//  TableViewDataSourceTests.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import XCTest
@testable import SOLIDArch

class TableViewDataSourceTests: XCTestCase {

	var dataProvider: TableViewDataProviderStub!
	var tableView: UITableViewMock!

    override func setUpWithError() throws {
		try super.setUpWithError()
		dataProvider = TableViewDataProviderStub()
		tableView = UITableViewMock()
    }

    override func tearDownWithError() throws {
		dataProvider = nil
		tableView = nil
		try super.tearDownWithError()
    }

	func testNumberOfSections() throws {
		// arrange
		dataProvider.stubbedNumberOfSections = 10
		let tableViewDataSource = TableViewDataSource(dataProvider: dataProvider)

		// act
		let result = tableViewDataSource.numberOfSections(in: tableView)

		// assert
		XCTAssertEqual(result, dataProvider.stubbedNumberOfSections)
	}

	func testNumberOfRowsInSections() throws {
		// arrange
		dataProvider.stubbedNumberOfRows = 10
		let tableViewDataSource = TableViewDataSource(dataProvider: dataProvider)

		// act
		let result = tableViewDataSource.tableView(tableView, numberOfRowsInSection: 0)

		// assert
		XCTAssertEqual(result, dataProvider.stubbedNumberOfRows)
	}

	func testCellForRowAtIndexPathSuccess() throws {
		// arrange
		dataProvider.stubbedItemForRow = ItemViewModelStub()
		tableView.stubbedDequeuedReusableCell = UITableViewCellStub()
		let tableViewDataSource = TableViewDataSource(dataProvider: dataProvider)

		// act
        tableViewDataSource.registerCell(class: UITableViewCellStub.self, identifier: "UITableViewCellStub", for: ItemViewModelStub.self)
		let result = tableViewDataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))

		// assert
		XCTAssertTrue(result is UITableViewCellStub)
	}

	func testCellForRowAtIndexPathFailure() throws {
		// arrange
		dataProvider.stubbedItemForRow = nil
		tableView.stubbedDequeuedReusableCell = UITableViewCellStub()
		let tableViewDataSource = TableViewDataSource(dataProvider: dataProvider)

		// act
        tableViewDataSource.registerCell(class: UITableViewCellStub.self, identifier: "UITableViewCellStub", for: ItemViewModelStub.self)
		let result = tableViewDataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))

		// assert
		XCTAssertFalse(result is UITableViewCellStub)
	}
	
	func testTitleForHeaderInSections() throws {
		// arrange
		dataProvider.stubbedTitleForSection = "test_title"
		let tableViewDataSource = TableViewDataSource(dataProvider: dataProvider)

		// act
		let result = tableViewDataSource.tableView(tableView, titleForHeaderInSection: 0)

		// assert
		XCTAssertEqual(result, dataProvider.stubbedTitleForSection)
	}
	
	func testSectionIndexTitles() throws {
		// arrange
		dataProvider.stubbedSectionsIndexTitles = ["test_title"]
		let tableViewDataSource = TableViewDataSource(dataProvider: dataProvider)

		// act
		let result = tableViewDataSource.sectionIndexTitles(for: tableView)

		// assert
		XCTAssertEqual(result, dataProvider.stubbedSectionsIndexTitles)
	}
}
