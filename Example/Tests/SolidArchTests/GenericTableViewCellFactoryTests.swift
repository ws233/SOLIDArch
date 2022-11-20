//
//  GenericTableViewCellFactoryTests.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import XCTest
@testable import SOLIDArch

class GenericTableViewCellFactoryTests: XCTestCase {

	var tableView: UITableViewMock!
	var itemViewModel: ItemViewModelStub!
	var factory: GenericTableViewCellFactory<UITableViewCellStub>!

    override func setUpWithError() throws {
		try super.setUpWithError()
		tableView = UITableViewMock()
		itemViewModel = ItemViewModelStub()
		factory = GenericTableViewCellFactory<UITableViewCellStub>(cellIdentifier: "")
    }

    override func tearDownWithError() throws {
		factory = nil
		tableView = nil
		itemViewModel = nil
		try super.tearDownWithError()
    }

    func testMakeCellSuccess() throws {
        // arrange
		let cell = UITableViewCellStub()
		cell.stubbedItemViewModel = itemViewModel
		tableView.stubbedDequeuedReusableCell = cell

		// act
		let result = factory.makeCell(for: tableView, at: IndexPath(row: 0, section: 0), with: itemViewModel)

		// assert
		XCTAssertEqual(result, cell)
		XCTAssertTrue(result is UITableViewCellStub)
		let resultCell = result as! UITableViewCellStub
		XCTAssertTrue(resultCell.viewModel != nil)
    }

	func testMakeCellFailure() throws {
		// arrange
		let cell = UITableViewCell()
		tableView.stubbedDequeuedReusableCell = cell

		// act
		let result = factory.makeCell(for: tableView, at: IndexPath(row: 0, section: 0), with: itemViewModel)

		// assert
		XCTAssertEqual(result, cell)
		XCTAssertFalse(result is UITableViewCellStub)
	}
}
