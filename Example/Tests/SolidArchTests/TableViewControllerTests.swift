//
//  TableViewControllerTests.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import XCTest
@testable import SOLIDArch

class TableViewControllerTests: XCTestCase {

	var tableView: UITableViewMock!
	var tableViewController: TableViewController!

    override func setUpWithError() throws {
		try super.setUpWithError()
		tableView = UITableViewMock()
		tableViewController = TableViewController()
    }

    override func tearDownWithError() throws {
		tableView = nil
		tableViewController = nil
		try super.tearDownWithError()
    }

	func testViewDidLoad() throws {
		// arrange
        let dataSource = UITableViewDataSourceStub()
        let delegate = UITableViewDelegateStub()
        tableViewController.dataSource = dataSource
        tableViewController.delegate = delegate
		tableViewController.tableView = tableView

		// act
		tableViewController.viewDidLoad()

		// assert
        XCTAssertNotNil(tableView.delegate)
        XCTAssertNotNil(tableView.dataSource)
//		XCTAssertTrue(tableView.reloadDataCalled)
	}

	func testDataSourceDidSet() throws {
		// arrange
		let dataSource = UITableViewDataSourceStub()
		tableViewController.tableView = tableView

		// act
		tableViewController.dataSource = dataSource

		// assert
		XCTAssertNotNil(tableView.dataSource)
		XCTAssertTrue(tableView.reloadDataCalled)
	}

	func testDelegateDidSet() throws {
		// arrange
		let delegate = UITableViewDelegateStub()
		tableViewController.tableView = tableView

		// act
		tableViewController.delegate = delegate

		// assert
		XCTAssertNotNil(tableView.delegate)
	}
}
