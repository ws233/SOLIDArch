//
//  FirstDataSourceFactory.swift
//  SOLIDArch_Example
//
//  Created by Cyril Makankov on 18.01.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SOLIDArch

struct Section: SectionInfo {
    var numberOfObjects: Int { return objects!.count }
    var objects: [ItemViewModel]?
    var name: String
    var indexTitle: String?
}

class FirstDataSourceFactory {

    let plainDataProvider: ViewModelDataProvider
    let sectionDataProvider: ViewModelDataProvider

    init() {
        let plainArray = firstSectionObjects + secondSectionObjects + thirdSectionObjects
        self.plainDataProvider = ArrayDataProvider(array: plainArray)

        let sectionArray = [
            Section(objects: firstSectionObjects, name: "Text Cells", indexTitle: "T"),
            Section(objects: secondSectionObjects, name: "Int Cells", indexTitle: "V"),
            Section(objects: thirdSectionObjects, name: "Bool Cells", indexTitle: "B")
        ]
        self.sectionDataProvider = SectionDataProvider(sections: sectionArray)
    }

    private let firstSectionObjects = [
        TextViewModel(text: "First Cell"),
        TextViewModel(text: "Cell #2"),
        TextViewModel(text: "This is also a text cell"),
    ]

    private let secondSectionObjects = [
        ValueSettingViewModel(parameter: "Size", value: 25),
        ValueSettingViewModel(parameter: "Opacity", value: 37),
        ValueSettingViewModel(parameter: "Blur", value: 13),
    ]

    private let thirdSectionObjects = [
        SwitchedSettingViewModel(parameter: "Push notifications enabled", enabled: true),
        SwitchedSettingViewModel(parameter: "Camera access enabled", enabled: false),
    ]

    private func makeDataSource(with dataProvider: ViewModelDataProvider) -> UITableViewDataSource? {
        let dataSource = TableViewDataSource(dataProvider: dataProvider)
        dataSource.registerCell(class: TextTableViewCell.self,
                                identifier: "TextTableViewCell",
                                for: TextViewModel.self)
        dataSource.registerCell(class: DetailedTextTableViewCell.self,
                                identifier: "DetailedTextTableViewCell",
                                for: ValueSettingViewModel.self)
        dataSource.registerCell(class: DetailedTextTableViewCell.self,
                                identifier: "SwitchedSettingTableViewCell",
                                for: SwitchedSettingViewModel.self)
        return dataSource
    }

}

extension FirstDataSourceFactory: FirstDataSourceFactoryProtocol {

    func makePlainListDataSource() -> UITableViewDataSource? {
        makeDataSource(with: plainDataProvider)
    }

    func makeSectionDevidedDataSource() -> UITableViewDataSource? {
        makeDataSource(with: sectionDataProvider)
    }
}
