//
//  SectionDataProviderTests.swift
//  SOLIDArch_Tests
//
//  Created by Maxim Makankov on 20.11.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
@testable import SOLIDArch

class SectionDataProviderTests: XCTestCase {

    var viewModel: ItemViewModelStub!
    var sectionInfo:  SectionInfoStub!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = ItemViewModelStub()
        sectionInfo = SectionInfoStub()
        sectionInfo.stubbedNumberOfObjects = 1
        sectionInfo.stubbedName = "test_name"
        sectionInfo.stubbedIndexTitle = "t"
        sectionInfo.stubbedObjects = [viewModel]
    }

    override func tearDownWithError() throws {
        viewModel = nil
        sectionInfo = nil
        try super.tearDownWithError()
    }

    func testNumberOfSections() throws {
        // arrange
        let arrayDataProvider = SectionDataProvider(sections: [sectionInfo])

        // act
        let result = arrayDataProvider.numberOfSections()

        // assert
        XCTAssertEqual(result, 1)
    }

    func testNumberOfRows() throws {
        // arrange
        let arrayDataProvider = SectionDataProvider(sections: [sectionInfo])

        // act
        let result = arrayDataProvider.numberOfRows(inSection: 0)

        // assert
        XCTAssertEqual(result, 1)
    }

    func testItemForRowSuccess() throws {
        // arrange
        let arrayDataProvider = SectionDataProvider(sections: [sectionInfo])

        // act
        let result = arrayDataProvider.itemForRow(atIndexPath: IndexPath(row: 0, section: 0))

        // assert
        XCTAssertTrue(result is ItemViewModelStub)
    }

    func testTitleForSection() throws {
        // arrange
        let arrayDataProvider = SectionDataProvider(sections: [sectionInfo])

        // act
        let result = arrayDataProvider.title(forSection: 0)

        // assert
        XCTAssertEqual(result, sectionInfo.stubbedName)
    }

    func testSectionIndexTitlesSuccess() throws {
        // arrange
        let arrayDataProvider = SectionDataProvider(sections: [sectionInfo])

        // act
        let result = arrayDataProvider.sectionIndexTitles()

        // assert
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first, "t")
    }
}
