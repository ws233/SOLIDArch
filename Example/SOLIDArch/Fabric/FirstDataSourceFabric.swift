//
//  FirstDataSourceFabric.swift
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

class FirstDataSourceFabric: FirstDataSourceFibricProtocol {
    let firstSectionObjects = [
        TextViewModel(text: "First Cell"),
        TextViewModel(text: "Cell #2"),
        TextViewModel(text: "This is also a text cell"),
    ]
    
    let secondSectionObjects = [
        ValueSettingViewModel(parameter: "Size", value: 25),
        ValueSettingViewModel(parameter: "Opacity", value: 37),
        ValueSettingViewModel(parameter: "Blur", value: 13),
    ]
    
    let thirdSectionObjects = [
        SwitchedSettingViewModel(parameter: "Push notifications enabled", enabled: true),
        SwitchedSettingViewModel(parameter: "Camera access enabled", enabled: false),
    ]

    func makePlainListDataSource() -> UITableViewDataSource? {
        let plainArray = firstSectionObjects + secondSectionObjects + thirdSectionObjects
        let dataProvider = ArrayDataProvider(array: plainArray)
        return makeDataSource(with: dataProvider)
    }

    func makeSectionDevidedDataSource() -> UITableViewDataSource? {
        let sectionArray = [
            Section(objects: firstSectionObjects, name: "Text Cells", indexTitle: "T"),
            Section(objects: secondSectionObjects, name: "Int Cells", indexTitle: "V"),
            Section(objects: thirdSectionObjects, name: "Bool Cells", indexTitle: "B")
        ]
        let dataProvider = SectionDataProvider(sections: sectionArray)
        return makeDataSource(with: dataProvider)
    }
    
    func makeDataSource(with dataProvider: ViewModelDataProvider) -> UITableViewDataSource? {
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
