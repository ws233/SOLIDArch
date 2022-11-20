//
//  ArrayDataProviderTests.swift
//  SOLIDArch_Tests
//
//  Created by Maxim Makankov on 20.11.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
@testable import SOLIDArch

class ArrayDataProviderTests: XCTestCase {

    var viewModel: ItemViewModelStub!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = ItemViewModelStub()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }

    func testNumberOfSections() throws {
        // arrange
        let arrayDataProvider = ArrayDataProvider(array: [viewModel])

        // act
        let result = arrayDataProvider.numberOfSections()

        // assert
        XCTAssertEqual(result, 1)
    }

    func testNumberOfRows() throws {
        // arrange
        let arrayDataProvider = ArrayDataProvider(array: [viewModel])

        // act
        let result = arrayDataProvider.numberOfRows(inSection: 0)

        // assert
        XCTAssertEqual(result, 1)
    }

    func testItemForRowSuccess() throws {
        // arrange
        let arrayDataProvider = ArrayDataProvider(array: [viewModel])

        // act
        let result = arrayDataProvider.itemForRow(atIndexPath: IndexPath(row: 0, section: 0))

        // assert
        XCTAssertTrue(result is ItemViewModelStub)
    }

    func testItemForRowFailure() throws {
        // arrange
        let arrayDataProvider = ArrayDataProvider(array: [viewModel])

        // act
        let result = arrayDataProvider.itemForRow(atIndexPath: IndexPath(row: 10, section: 0))

        // assert
        XCTAssertNil(result)
    }

    func testTitleForSection() throws {
        // arrange
        let sectionTitle = "test_title"
        let arrayDataProvider = ArrayDataProvider(array: [viewModel], sectionTitle: sectionTitle)

        // act
        let result = arrayDataProvider.title(forSection: 0)

        // assert
        XCTAssertEqual(result, sectionTitle)
    }

    func testSectionIndexTitlesSuccess() throws {
        // arrange
        let sectionTitle = "test_title"
        let arrayDataProvider = ArrayDataProvider(array: [viewModel], sectionTitle: sectionTitle)

        // act
        let result = arrayDataProvider.sectionIndexTitles()

        // assert
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first, "t")
    }

    func testSectionIndexTitlesFailure() throws {
        // arrange
        let sectionTitle = ""
        let arrayDataProvider = ArrayDataProvider(array: [viewModel], sectionTitle: sectionTitle)

        // act
        let result = arrayDataProvider.sectionIndexTitles()

        // assert
        XCTAssertNil(result)
    }
}
