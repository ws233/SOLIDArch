//
//  FirstDataSourceFactory+Delegate.swift
//  SOLIDArch_Example
//
//  Created by Churyanin NG on 02.12.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SOLIDArch

extension FirstDataSourceFactory: FirstDelegateFactoryProtocol {
    func makePlainListDelegate() -> UITableViewDelegate {
        let map = makeMap()
        let delegate = TableViewDelegate(dataProvider: plainDataProvider, map: map)
        return delegate
    }
    
    func makeSectionDevidedDelegate() -> UITableViewDelegate {
        let map = makeMap()
        let delegate = TableViewDelegate(dataProvider: sectionDataProvider, map: map)
        return delegate
    }
    
    func makeMap() -> [String: Selector] {
        let firstSelector = #selector(UIViewController.showAlert(sender:))
        let secondSelector = #selector(UITableViewController.showActionSheet(sender:))
        let thirdSelector = #selector(UITabBarController.selectSecondTab(sender:))
        let map = [
            "TextViewModel": firstSelector,
            "ValueSettingViewModel": secondSelector,
            "SwitchedSettingViewModel" : thirdSelector,
        ]
        return map
    }
}
